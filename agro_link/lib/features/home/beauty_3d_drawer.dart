import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';
import '../../services/fake_data_service.dart';
import '../../core/routing/route_names.dart';

class Beauty3DDrawer extends StatefulWidget {
  final VoidCallback? onClose;

  const Beauty3DDrawer({super.key, this.onClose});

  @override
  State<Beauty3DDrawer> createState() => _Beauty3DDrawerState();
}

class _Beauty3DDrawerState extends State<Beauty3DDrawer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  final Map<String, String> _userData = FakeDataService.getAllFakeUserData();

  bool get _isRTL {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.languageCode == 'ar' || locale.languageCode == 'ku';
  }

  BorderRadius get _drawerBorderRadius {
    return _isRTL
        ? const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Adjust slide animation direction for RTL
    _slideAnimation = Tween<double>(begin: _isRTL ? 1.0 : -1.0, end: 0.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    // Adjust rotation direction for RTL
    _rotationAnimation = Tween<double>(begin: _isRTL ? 0.15 : -0.15, end: 0.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..translate(
              _slideAnimation.value * MediaQuery.of(context).size.width * 0.85,
            )
            ..scale(_scaleAnimation.value)
            ..rotateY(_rotationAnimation.value),
          alignment: _isRTL ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4CAF50),
                  Color(0xFF45a049),
                  Color(0xFF388e3c),
                ],
              ),
              borderRadius: _drawerBorderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(_isRTL ? -5 : 5, 0),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(_isRTL ? -2 : 2, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header Section
                _buildHeader(),

                // Stats Section
                _buildStats(),

                const SizedBox(height: 20),

                // Menu Items
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: _isRTL
                          ? const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                    ),
                    child: _buildMenuItems(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // Close Button
          Align(
            alignment: _isRTL ? Alignment.topLeft : Alignment.topRight,
            child: IconButton(
              onPressed: widget.onClose,
              icon: const Icon(
                Iconsax.close_square,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Profile Picture
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(45),
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Iconsax.user, size: 40, color: Colors.white),
            ),
          ),

          const SizedBox(height: 20),

          // User Name
          Text(
            _userData['fullName'] ?? 'John Farmer',
            style: AppTextStyles.headline2.copyWith(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // User Email
          Text(
            _userData['email'] ?? 'john.farmer@example.com',
            style: AppTextStyles.bodyText2.copyWith(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('12', AppLocalizations.of(context)?.posts ?? 'Posts'),
          _buildStatItem(
            '156',
            AppLocalizations.of(context)?.followers ?? 'Followers',
          ),
          _buildStatItem(
            '89',
            AppLocalizations.of(context)?.following ?? 'Following',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.headline3.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.bodyText3.copyWith(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems() {
    final menuItems = [
      {
        'icon': Iconsax.edit,
        'title': AppLocalizations.of(context)?.editProfile ?? 'Edit Profile',
        'onTap': () => _navigateToProfile(),
      },
      {
        'icon': Iconsax.setting,
        'title': AppLocalizations.of(context)?.settings ?? 'Settings',
        'onTap': () => _showMessage('Settings - Coming Soon!'),
      },
      {
        'icon': Iconsax.message_question,
        'title': AppLocalizations.of(context)?.helpSupport ?? 'Help & Support',
        'onTap': () => _showMessage('Help & Support - Coming Soon!'),
      },
      {
        'icon': Iconsax.message_question,
        'title': AppLocalizations.of(context)?.language ?? 'Language',
        'onTap': () => _navigateToLanguage(),
      },
      {
        'icon': Iconsax.logout,
        'title': AppLocalizations.of(context)?.logout ?? 'Logout',
        'onTap': () => _logout(),
        'isDestructive': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        final isDestructive = item['isDestructive'] as bool? ?? false;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: isDestructive
                ? Colors.red.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(
              item['icon'] as IconData,
              color: isDestructive ? Colors.red : AppColors.primaryGreen,
              size: 24,
            ),
            title: Text(
              item['title'] as String,
              style: AppTextStyles.bodyText1.copyWith(
                color: isDestructive ? Colors.red : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Iconsax.arrow_right_3,
              size: 16,
              color: isDestructive ? Colors.red : AppColors.textSecondary,
            ),
            onTap: item['onTap'] as VoidCallback,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }

  void _navigateToProfile() {
    widget.onClose?.call();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.pushNamed(context, '/profile');
      }
    });
  }

  void _navigateToLanguage() {
    widget.onClose?.call();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.pushNamed(context, RouteNames.selectLanguage);
      }
    });
  }

  void _logout() {
    widget.onClose?.call();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(RouteNames.welcome, (route) => false);
      }
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
