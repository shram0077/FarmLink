import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';
import '../../core/navigation/navigation_service.dart';
import '../../core/routing/route_names.dart';
import '../../models/post.dart';
import '../../services/fake_data_service.dart';
import 'beauty_3d_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Post> _posts = [];
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadPosts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadPosts() {
    setState(() {
      _posts = FakeDataService.getRecentPosts(limit: 20);
    });
  }

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      _isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              _buildCustomAppBar(),
              Expanded(
                child: Column(
                  children: [
                    // Tab Bar
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE0E0E0),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: AppColors.primaryGreen,
                        indicatorWeight: 3,
                        labelColor: AppColors.primaryGreen,
                        unselectedLabelColor: AppColors.textLight,
                        labelStyle: AppTextStyles.bodyText1.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        tabs: [
                          Tab(
                            text:
                                AppLocalizations.of(context)?.services ??
                                'Services',
                          ),
                          Tab(
                            text:
                                AppLocalizations.of(context)?.posts ?? 'Posts',
                          ),
                        ],
                      ),
                    ),

                    // Tab Bar View
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Services Tab
                          _buildServicesTab(),

                          // Feeds Tab
                          _buildFeedsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 3D Drawer Overlay
          if (_isDrawerOpen) ...[
            // Backdrop
            GestureDetector(
              onTap: _closeDrawer,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),

            // 3D Drawer
            Beauty3DDrawer(onClose: _closeDrawer),
          ],
        ],
      ),
    );
  }

  // --- Widget Builders ---
  PreferredSizeWidget _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menu Icon (Hamburger)
              IconButton(
                icon: const Icon(
                  Iconsax.menu,
                  color: AppColors.textPrimary,
                  size: 28,
                ),
                onPressed: _openDrawer,
              ),
              // App Title
              Text(
                AppLocalizations.of(context)?.appName ?? 'FarmLink',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Profile Avatar
              Container(
                width: 40,
                height: 40,

                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/thumbnails/004/985/994/small_2x/cartoon-farmer-with-farmland-background-free-vector.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaleBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        0,
      ),
      padding: const EdgeInsets.all(AppConstants.paddingSmall),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue background
        borderRadius: BorderRadius.circular(AppConstants.borderRadius * 1.5),
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://img.freepik.com/premium-vector/agricultural-farming-services-web-banner-social-media-post-lawn-gardening-template-design_812236-2390.jpg',
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (context, url, error) =>
            const Icon(Iconsax.image, color: AppColors.textLight),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    // Calculate the width for 3 cards per row, considering the spacing
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth =
        (screenWidth - (AppConstants.paddingMedium * 2) - (16 * 2)) / 3;

    return Container(
      width: cardWidth,
      height: cardWidth, // Make it a square
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius * 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _navigateToCategory(title),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                style: AppTextStyles.headline3.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCategory(String categoryTitle) {
    String routeName;

    // Get localized strings for comparison
    final localizations = AppLocalizations.of(context);
    final specialistsText = localizations?.specialists ?? 'Specialists';
    final calendarText = localizations?.calendar ?? 'Calendar';
    final educationText = localizations?.education ?? 'Education';
    final feedbackText = localizations?.feedback ?? 'Feedback';
    final marketText = localizations?.market ?? 'Market';
    final aiText = localizations?.ai ?? 'AI Assistant';

    // Map category titles to route names using localized strings
    if (categoryTitle == specialistsText) {
      routeName = RouteNames.specialists;
    } else if (categoryTitle == calendarText) {
      routeName = RouteNames.calendar;
    } else if (categoryTitle == educationText) {
      routeName = RouteNames.education;
    } else if (categoryTitle == feedbackText) {
      routeName = RouteNames.feedback;
    } else if (categoryTitle == marketText) {
      routeName = RouteNames.market;
    } else if (categoryTitle == aiText) {
      routeName = RouteNames.ai;
    } else {
      // Unknown category: $categoryTitle
      return;
    }

    // Navigate to the selected category
    NavigationService.navigateTo(routeName);
  }

  // Services Tab Content
  Widget _buildServicesTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sale Banner
          _buildSaleBanner(),

          // Categories Section Title
          Padding(
            padding: const EdgeInsets.only(
              left: AppConstants.paddingMedium,
              right: AppConstants.paddingMedium,
              top: AppConstants.paddingLarge,
              bottom: AppConstants.paddingMedium,
            ),
            child: Text(
              AppLocalizations.of(context)?.categories ?? 'Categories',
              style: AppTextStyles.headline2.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Category Items (using Wrap for the 3+1 layout)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
            ),
            child: Wrap(
              spacing: 16, // Horizontal space between cards
              runSpacing: 16, // Vertical space between rows
              children: [
                _buildCategoryCard(
                  title:
                      AppLocalizations.of(context)?.specialists ??
                      'Specialists',
                  icon: Iconsax.user,
                  color: AppColors.primaryGreen,
                ),
                _buildCategoryCard(
                  title: AppLocalizations.of(context)?.calendar ?? 'Calendar',
                  icon: Iconsax.calendar,
                  color: AppColors.primaryGreen,
                ),
                _buildCategoryCard(
                  title: AppLocalizations.of(context)?.education ?? 'Education',
                  icon: Iconsax.document_text,
                  color: AppColors.primaryGreen,
                ),
                _buildCategoryCard(
                  title: AppLocalizations.of(context)?.feedback ?? 'Feedback',
                  icon: Iconsax.star,
                  color: AppColors.primaryGreen,
                ),
                _buildCategoryCard(
                  title: AppLocalizations.of(context)?.market ?? 'Market',
                  icon: Iconsax.shop,
                  color: AppColors.primaryGreen,
                ),
                _buildCategoryCard(
                  title: AppLocalizations.of(context)?.ai ?? 'AI Assistant',
                  icon: Iconsax.cpu,
                  color: AppColors.primaryGreen,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),
        ],
      ),
    );
  }

  // Feeds Tab Content
  Widget _buildFeedsTab() {
    if (_posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryGreen),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return _buildPostCard(_posts[index]);
      },
    );
  }

  Widget _buildPostCard(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius * 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author Info
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(post.authorImageUrl),
                ),
                const SizedBox(width: AppConstants.paddingSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName,
                        style: AppTextStyles.bodyText1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        _formatTimestamp(post.timestamp),
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.textLight,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingSmall,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadius / 2,
                    ),
                  ),
                  child: Text(
                    post.category,
                    style: AppTextStyles.bodyText2.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppConstants.paddingMedium),

            // Post Title
            Text(
              post.title,
              style: AppTextStyles.headline3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: AppConstants.paddingSmall),

            // Post Content
            Text(
              post.content,
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: AppConstants.paddingMedium),

            // Tags
            if (post.tags.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: post.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius / 2,
                      ),
                    ),
                    child: Text(
                      '#$tag',
                      style: AppTextStyles.bodyText2.copyWith(
                        color: AppColors.primaryGreen,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
            ],

            // Engagement Row
            Row(
              children: [
                _buildEngagementButton(
                  icon: post.isLikedByCurrentUser
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  iconColor: post.isLikedByCurrentUser
                      ? Colors.red
                      : AppColors.textLight,
                  count: post.likesCount,
                  onTap: () {
                    // TODO: Handle like/unlike
                  },
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                _buildEngagementButton(
                  icon: Iconsax.message,
                  iconColor: AppColors.textLight,
                  count: post.commentsCount,
                  onTap: () {
                    // TODO: Handle comments
                  },
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // TODO: Handle share
                  },
                  icon: Icon(
                    Iconsax.share,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEngagementButton({
    required IconData icon,
    required Color iconColor,
    required int count,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textLight,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays} ${AppLocalizations.of(context)?.daysAgo ?? 'days ago'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${AppLocalizations.of(context)?.hoursAgo ?? 'hours ago'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${AppLocalizations.of(context)?.minutesAgo ?? 'minutes ago'}';
    } else {
      return AppLocalizations.of(context)?.justNow ?? 'just now';
    }
  }
}
