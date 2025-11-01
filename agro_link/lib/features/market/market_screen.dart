import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../l10n/app_localizations.dart';
import '../../models/product.dart';
import '../../services/fake_data_service.dart';
import '../../shared/utils/constants.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<Product> _allProducts = [];
  List<String> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final products = FakeDataService.getAllProducts();
    final categories = products.map((p) => p.category).toSet().toList();

    setState(() {
      _allProducts = products;
      _categories = categories;
      _tabController = TabController(
        length: _categories.length + 2, // +1 for All, +1 for Farmer Markets
        vsync: this,
      );
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Product> _getProductsForTab(int index) {
    if (index == 0) return _allProducts; // All products
    if (index == 1) {
      return _allProducts
          .where((p) => p.isFarmerProduct)
          .toList(); // Farmer Markets
    }
    return _allProducts
        .where((p) => p.category == _categories[index - 2])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background, // Use a background color from theme
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primaryGreen),
            )
          : NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Text(
                      AppLocalizations.of(context)?.market ?? 'Market',
                      style: AppTextStyles.headline2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: AppColors.background,
                    floating: true,
                    pinned: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    actions: [
                      IconButton(
                        icon: const Icon(
                          Iconsax.search_normal,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () {
                          /* TODO: Implement search */
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Iconsax.filter,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () {
                          /* TODO: Implement filter */
                        },
                      ),
                    ],
                    bottom: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: AppColors.primaryGreen,
                      indicatorWeight: 3,
                      labelColor: AppColors.primaryGreen,
                      unselectedLabelColor: AppColors.textLight,
                      labelStyle: AppTextStyles.bodyText1.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)?.viewAll ?? 'All',
                        ),
                        Tab(
                          text:
                              AppLocalizations.of(context)?.farmerMarkets ??
                              'Farmer Markets',
                        ),
                        ..._categories.map((category) => Tab(text: category)),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: List.generate(
                  _categories.length + 2,
                  (index) =>
                      ProductGridView(products: _getProductsForTab(index)),
                ),
              ),
            ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  final List<Product> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.shop_remove, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)?.noProductsFound ??
                  'No Products Found',
              style: AppTextStyles.bodyText1.copyWith(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // KEY CHANGE FOR RESPONSIVENESS
        mainAxisSpacing: AppConstants.paddingMedium,
        crossAxisSpacing: AppConstants.paddingMedium,
        childAspectRatio: 0.70, // Adjusted for better card proportions
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index], onTap: () {});
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  // 💡 UX Improvement: Pass a callback for better state management
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the passed callback
      child: Card(
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                    ), // Cleaner placeholder
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Iconsax.gallery_slash,
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                  if (!product.isAvailable)
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)?.outOfStock ??
                              'Out of Stock',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  // Favorite Icon
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Iconsax.heart,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          /* TODO: Handle favorite action */
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: AppTextStyles.bodyText1.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Rating and Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // 💡 FIX: Wrap the Rating Row with Expanded
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.star5,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              // Use Flexible to prevent the rating text itself from overflowing if it's too long
                              Flexible(
                                child: Text(
                                  '${product.rating} (${product.reviewCount})',
                                  style: AppTextStyles.bodyText2.copyWith(
                                    fontSize: 12,
                                    color: AppColors.textLight,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // This SizedBox adds a little space between rating and price
                        const SizedBox(width: 8),
                        // Price
                        Text(
                          '${(product.price * 1460).toInt()} IQD',
                          style: AppTextStyles.headline3.copyWith(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
