import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  String _searchQuery = '';
  String _selectedCategory = 'allCategories';
  final List<Map<String, String>> _categories = [
    {'key': 'allCategories', 'value': 'All'},
    {'key': 'appUsage', 'value': 'App Usage'},
    {'key': 'cropGuides', 'value': 'Crop Guides'},
    {'key': 'seasonalTips', 'value': 'Seasonal Tips'},
    {'key': 'bestPractices', 'value': 'Best Practices'},
    {'key': 'pestControl', 'value': 'Pest Control5'},
    {'key': 'irrigation', 'value': 'Irrigation'},
    {'key': 'soilHealth', 'value': 'Soil Health'},
  ];

  // Tutorial data with progress
  final List<Map<String, dynamic>> _tutorials = [
    {
      'titleKey': 'welcomeToAgroLink',
      'descriptionKey': 'welcomeDescription',
      'progress': 0.75,
      'icon': Iconsax.home,
      'color': AppColors.primaryGreen,
      'category': 'App Usage',
      'duration': '5 min',
      'isCompleted': false,
    },
    {
      'titleKey': 'findingExperts',
      'descriptionKey': 'findingExpertsDescription',
      'progress': 0.4,
      'icon': Iconsax.user,
      'color': AppColors.accentGreen,
      'category': 'App Usage',
      'duration': '8 min',
      'isCompleted': false,
    },
    {
      'titleKey': 'marketplaceGuide',
      'descriptionKey': 'marketplaceGuideDescription',
      'progress': 0.9,
      'icon': Iconsax.shop,
      'color': AppColors.orangeAccent,
      'category': 'App Usage',
      'duration': '10 min',
      'isCompleted': true,
    },
    {
      'titleKey': 'aiAssistant',
      'descriptionKey': 'aiAssistantDescription',
      'progress': 0.2,
      'icon': Iconsax.cpu,
      'color': AppColors.darkGreen,
      'category': 'App Usage',
      'duration': '6 min',
      'isCompleted': false,
    },
    {
      'titleKey': 'creatingPosts',
      'descriptionKey': 'creatingPostsDescription',
      'progress': 0.6,
      'icon': Iconsax.add_square,
      'color': AppColors.primaryGreen,
      'category': 'App Usage',
      'duration': '7 min',
      'isCompleted': false,
    },
  ];

  // Farming guides data
  final List<Map<String, dynamic>> _farmingGuides = [
    {
      'titleKey': 'tomatoCultivationGuide',
      'descriptionKey': 'tomatoCultivationDescription',
      'difficulty': 'Beginner',
      'duration': '3-4 months',
      'icon': '🍅',
      'color': Colors.red.shade100,
      'textColor': Colors.red.shade700,
      'category': 'Crop Guides',
      'rating': 4.8,
      'readers': 1250,
    },
    {
      'titleKey': 'wheatFarmingBestPractices',
      'descriptionKey': 'wheatFarmingDescription',
      'difficulty': 'Intermediate',
      'duration': '8-9 months',
      'icon': '🌾',
      'color': Colors.amber.shade100,
      'textColor': Colors.amber.shade700,
      'category': 'Crop Guides',
      'rating': 4.6,
      'readers': 890,
    },
    {
      'titleKey': 'dripIrrigationSystems',
      'descriptionKey': 'dripIrrigationDescription',
      'difficulty': 'Advanced',
      'duration': 'Setup: 1 week',
      'icon': '💧',
      'color': Colors.blue.shade100,
      'textColor': Colors.blue.shade700,
      'category': 'Irrigation',
      'rating': 4.9,
      'readers': 2100,
    },
    {
      'titleKey': 'rainwaterHarvesting',
      'descriptionKey': 'rainwaterHarvestingDescription',
      'difficulty': 'Intermediate',
      'duration': 'Setup: 2-3 weeks',
      'icon': '🌧️',
      'color': Colors.cyan.shade100,
      'textColor': Colors.cyan.shade700,
      'category': 'Irrigation',
      'rating': 4.7,
      'readers': 1450,
    },
    {
      'titleKey': 'organicPestManagement',
      'descriptionKey': 'organicPestManagementDescription',
      'difficulty': 'Beginner',
      'duration': 'Ongoing',
      'icon': '🛡️',
      'color': Colors.green.shade100,
      'textColor': Colors.green.shade700,
      'category': 'Pest Control',
      'rating': 4.5,
      'readers': 980,
    },
    {
      'titleKey': 'soilHealthFertilization',
      'descriptionKey': 'soilHealthDescription',
      'difficulty': 'Intermediate',
      'duration': 'Seasonal',
      'icon': '🌱',
      'color': Colors.brown.shade100,
      'textColor': Colors.brown.shade700,
      'category': 'Soil Health',
      'rating': 4.8,
      'readers': 1670,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredTutorials {
    if (_searchQuery.isEmpty && _selectedCategory == 'All') {
      return _tutorials;
    }

    return _tutorials.where((tutorial) {
      final localizations = AppLocalizations.of(context);
      final title = localizations != null
          ? _getLocalizedTutorialText(localizations, tutorial['titleKey'])
          : tutorial['titleKey'];
      final description = localizations != null
          ? _getLocalizedTutorialText(localizations, tutorial['descriptionKey'])
          : tutorial['descriptionKey'];

      final matchesSearch =
          _searchQuery.isEmpty ||
          title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _selectedCategory == 'allCategories' ||
          tutorial['category'] == _getCategoryValueFromKey(_selectedCategory);

      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<Map<String, dynamic>> get _filteredFarmingGuides {
    if (_searchQuery.isEmpty && _selectedCategory == 'All') {
      return _farmingGuides;
    }

    return _farmingGuides.where((guide) {
      final localizations = AppLocalizations.of(context);
      final title = localizations != null
          ? _getLocalizedGuideText(localizations, guide['titleKey'])
          : guide['titleKey'];
      final description = localizations != null
          ? _getLocalizedGuideText(localizations, guide['descriptionKey'])
          : guide['descriptionKey'];

      final matchesSearch =
          _searchQuery.isEmpty ||
          title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _selectedCategory == 'All' || guide['category'] == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  String _getLocalizedTutorialText(AppLocalizations localizations, String key) {
    switch (key) {
      case 'welcomeToAgroLink':
        return localizations.welcomeToAgroLink;
      case 'welcomeDescription':
        return localizations.welcomeDescription;
      case 'findingExperts':
        return localizations.findingExperts;
      case 'findingExpertsDescription':
        return localizations.findingExpertsDescription;
      case 'marketplaceGuide':
        return localizations.marketplaceGuide;
      case 'marketplaceGuideDescription':
        return localizations.marketplaceGuideDescription;
      case 'aiAssistant':
        return localizations.aiAssistant;
      case 'aiAssistantDescription':
        return localizations.aiAssistantDescription;
      case 'creatingPosts':
        return localizations.creatingPosts;
      case 'creatingPostsDescription':
        return localizations.creatingPostsDescription;
      default:
        return key;
    }
  }

  String _getLocalizedGuideText(AppLocalizations localizations, String key) {
    switch (key) {
      case 'tomatoCultivationGuide':
        return localizations.tomatoCultivationGuide;
      case 'tomatoCultivationDescription':
        return localizations.tomatoCultivationDescription;
      case 'wheatFarmingBestPractices':
        return localizations.wheatFarmingBestPractices;
      case 'wheatFarmingDescription':
        return localizations.wheatFarmingDescription;
      case 'dripIrrigationSystems':
        return localizations.dripIrrigationSystems;
      case 'dripIrrigationDescription':
        return localizations.dripIrrigationDescription;
      case 'rainwaterHarvesting':
        return localizations.rainwaterHarvesting;
      case 'rainwaterHarvestingDescription':
        return localizations.rainwaterHarvestingDescription;
      case 'organicPestManagement':
        return localizations.organicPestManagement;
      case 'organicPestManagementDescription':
        return localizations.organicPestManagementDescription;
      case 'soilHealthFertilization':
        return localizations.soilHealthFertilization;
      case 'soilHealthDescription':
        return localizations.soilHealthDescription;
      default:
        return key;
    }
  }

  String _getLocalizedCategoryText(AppLocalizations localizations, String key) {
    switch (key) {
      case 'allCategories':
        return localizations.allCategories;
      case 'appUsage':
        return localizations.appUsage;
      case 'cropGuides':
        return localizations.cropGuides;
      case 'seasonalTips':
        return localizations.seasonalTips;
      case 'bestPractices':
        return localizations.bestPractices;
      case 'pestControl':
        return localizations.pestControl;
      case 'irrigation':
        return localizations.irrigation;
      case 'soilHealth':
        return localizations.soilHealth;
      default:
        return key;
    }
  }

  String _getCategoryValueFromKey(String key) {
    final category = _categories.firstWhere(
      (cat) => cat['key'] == key,
      orElse: () => {'key': key, 'value': key},
    );
    return category['value']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: innerBoxIsScrolled ? 2 : 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppGradients.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      AppLocalizations.of(context)?.education ?? 'Education',
                      style: AppTextStyles.headline2.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)?.learnGrow ??
                          'Learn & Grow Together',
                      style: AppTextStyles.bodyText2.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            // Search Bar
            _buildSearchBar(),

            // Category Filter
            _buildCategoryFilter(),

            // Content
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText:
              AppLocalizations.of(context)?.searchTutorials ??
              'Search tutorials...',
          hintStyle: AppTextStyles.bodyText2.copyWith(
            color: AppColors.textLight,
          ),
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: AppColors.textLight,
            size: 20,
          ),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                  icon: Icon(
                    Iconsax.close_circle,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final categoryKey = category['key']!;
          final categoryValue = category['value']!;
          final isSelected = _selectedCategory == categoryKey;

          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                AppLocalizations.of(context) != null
                    ? _getLocalizedCategoryText(
                        AppLocalizations.of(context)!,
                        categoryKey,
                      )
                    : categoryValue,
                style: AppTextStyles.bodyText2.copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = selected ? categoryKey : 'allCategories';
                });
              },
              backgroundColor: Colors.grey.shade50,
              selectedColor: AppColors.primaryGreen,
              checkmarkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Tutorials Section
          _buildTutorialsSection(),

          const SizedBox(height: 32),

          // Farming Guides Section
          _buildFarmingGuidesSection(),
        ],
      ),
    );
  }

  Widget _buildTutorialsSection() {
    final tutorials = _filteredTutorials;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          '🚀 ${AppLocalizations.of(context)?.appTutorials ?? 'App Tutorials'}',
          '${tutorials.length} ${AppLocalizations.of(context)?.tutorialsAvailable ?? 'tutorials available'}',
        ),
        if (tutorials.isEmpty)
          _buildEmptyState(
            AppLocalizations.of(context)?.noTutorialsFound ??
                'No tutorials found',
            AppLocalizations.of(context)?.tryAdjustingSearch ??
                'Try adjusting your search or filters',
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: tutorials.length,
            itemBuilder: (context, index) =>
                _buildTutorialCard(tutorials[index]),
          ),
      ],
    );
  }

  Widget _buildFarmingGuidesSection() {
    final guides = _filteredFarmingGuides;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGridSectionHeader(
          '🌾 ${AppLocalizations.of(context)?.farmingGuides ?? 'Farming Guides'}',
          '${guides.length} ${AppLocalizations.of(context)?.guidesAvailable ?? 'guides available'}',
        ),
        if (guides.isEmpty)
          _buildEmptyState(
            AppLocalizations.of(context)?.noGuidesFound ?? 'No guides found',
            AppLocalizations.of(context)?.tryAdjustingSearch ??
                'Try adjusting your search or filters',
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: guides.length,
            itemBuilder: (context, index) =>
                _buildFarmingGuideCard(guides[index]),
          ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryGreen.withOpacity(0.1),
            AppColors.accentGreen.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.headline2.copyWith(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridSectionHeader(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryGreen.withOpacity(0.1),
            AppColors.accentGreen.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.headline2.copyWith(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialCard(Map<String, dynamic> tutorial) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showTutorialDetail(tutorial),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: tutorial['color'].withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    tutorial['icon'],
                    color: tutorial['color'],
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context) != null
                                  ? _getLocalizedTutorialText(
                                      AppLocalizations.of(context)!,
                                      tutorial['titleKey'],
                                    )
                                  : tutorial['titleKey'],
                              style: AppTextStyles.headline3.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (tutorial['isCompleted'])
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                AppLocalizations.of(context)?.completed ??
                                    'Completed',
                                style: AppTextStyles.bodyText3.copyWith(
                                  color: Colors.green.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context) != null
                            ? _getLocalizedTutorialText(
                                AppLocalizations.of(context)!,
                                tutorial['descriptionKey'],
                              )
                            : tutorial['descriptionKey'],
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: tutorial['progress'],
                              backgroundColor: AppColors.divider,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                tutorial['color'],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${(tutorial['progress'] * 100).toInt()}%',
                            style: AppTextStyles.bodyText3.copyWith(
                              color: tutorial['color'],
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            size: 14,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tutorial['duration'],
                            style: AppTextStyles.bodyText3.copyWith(
                              color: AppColors.textLight,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Iconsax.tag,
                            size: 14,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tutorial['category'],
                            style: AppTextStyles.bodyText3.copyWith(
                              color: AppColors.textLight,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  color: AppColors.textLight,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFarmingGuideCard(Map<String, dynamic> guide) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showFarmingGuideDetail(guide),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: guide['color'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          guide['icon'],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.star5, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          guide['rating'].toString(),
                          style: AppTextStyles.bodyText3.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Title
                Text(
                  AppLocalizations.of(context) != null
                      ? _getLocalizedGuideText(
                          AppLocalizations.of(context)!,
                          guide['titleKey'],
                        )
                      : guide['titleKey'],
                  style: AppTextStyles.headline3.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  AppLocalizations.of(context) != null
                      ? _getLocalizedGuideText(
                          AppLocalizations.of(context)!,
                          guide['descriptionKey'],
                        )
                      : guide['descriptionKey'],
                  style: AppTextStyles.bodyText2.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Difficulty and Duration
                Row(
                  children: [
                    _buildInfoChip(guide['difficulty'], guide['textColor']),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        guide['duration'],
                        style: AppTextStyles.bodyText3.copyWith(
                          color: AppColors.textLight,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Readers count
                Row(
                  children: [
                    Icon(Iconsax.eye, size: 12, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text(
                      '${guide['readers']} ${AppLocalizations.of(context)?.readers ?? 'readers'}',
                      style: AppTextStyles.bodyText3.copyWith(
                        color: AppColors.textLight,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyText3.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 9,
        ),
      ),
    );
  }

  Widget _buildEmptyState(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.search_normal,
              color: AppColors.primaryGreen,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.headline2.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showTutorialDetail(Map<String, dynamic> tutorial) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: tutorial['color'].withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              tutorial['icon'],
                              color: tutorial['color'],
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context) != null
                                      ? _getLocalizedTutorialText(
                                          AppLocalizations.of(context)!,
                                          tutorial['titleKey'],
                                        )
                                      : tutorial['titleKey'],
                                  style: AppTextStyles.headline2.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  tutorial['category'],
                                  style: AppTextStyles.bodyText2.copyWith(
                                    color: AppColors.primaryGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Progress
                      Text(
                        AppLocalizations.of(context)?.progress ?? 'Progress',
                        style: AppTextStyles.headline3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: tutorial['progress'],
                        backgroundColor: AppColors.divider,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          tutorial['color'],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(tutorial['progress'] * 100).toInt()}% Complete • ${tutorial['duration']}',
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Description
                      Text(
                        AppLocalizations.of(context)?.aboutTutorial ??
                            'About this tutorial',
                        style: AppTextStyles.headline3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context) != null
                            ? _getLocalizedTutorialText(
                                AppLocalizations.of(context)!,
                                tutorial['descriptionKey'],
                              )
                            : tutorial['descriptionKey'],
                        style: AppTextStyles.bodyText1.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Start tutorial
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tutorial['color'],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            tutorial['isCompleted']
                                ? AppLocalizations.of(
                                        context,
                                      )?.reviewTutorial ??
                                      'Review Tutorial'
                                : AppLocalizations.of(context)?.startTutorial ??
                                      'Start Tutorial',
                            style: AppTextStyles.bodyText1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFarmingGuideDetail(Map<String, dynamic> guide) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: guide['color'],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                guide['icon'],
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context) != null
                                      ? _getLocalizedGuideText(
                                          AppLocalizations.of(context)!,
                                          guide['titleKey'],
                                        )
                                      : guide['titleKey'],
                                  style: AppTextStyles.headline2.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.star5,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${guide['rating']} (${guide['readers']} ${AppLocalizations.of(context)?.readers ?? 'readers'})',
                                      style: AppTextStyles.bodyText2.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Difficulty and Duration
                      Row(
                        children: [
                          _buildInfoChip(
                            guide['difficulty'],
                            guide['textColor'],
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Iconsax.clock,
                            size: 16,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            guide['duration'],
                            style: AppTextStyles.bodyText2.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Description
                      Text(
                        AppLocalizations.of(context)?.guideOverview ??
                            'Guide Overview',
                        style: AppTextStyles.headline3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context) != null
                            ? _getLocalizedGuideText(
                                AppLocalizations.of(context)!,
                                guide['descriptionKey'],
                              )
                            : guide['descriptionKey'],
                        style: AppTextStyles.bodyText1.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Open guide
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: guide['textColor'],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)?.readGuide ??
                                'Read Guide',
                            style: AppTextStyles.bodyText1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
