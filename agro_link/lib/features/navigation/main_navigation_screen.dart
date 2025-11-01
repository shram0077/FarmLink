import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../notifications/notifications_screen.dart';
import '../create_post/create_post_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CreatePostScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> get _navItems {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      // Fallback to English if localizations not available
      return const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          label: 'Home',
          backgroundColor: AppColors.primaryGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.add_square),
          label: 'Create',
          backgroundColor: AppColors.accentGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.notification),
          label: 'Notifications',
          backgroundColor: AppColors.orangeAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: 'Profile',
          backgroundColor: AppColors.darkGreen,
        ),
      ];
    }

    return [
      BottomNavigationBarItem(
        icon: const Icon(Iconsax.home),
        label: localizations.home,
        backgroundColor: AppColors.primaryGreen,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Iconsax.add_square),
        label: localizations.create,
        backgroundColor: AppColors.accentGreen,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Iconsax.notification),
        label: localizations.notifications,
        backgroundColor: AppColors.orangeAccent,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Iconsax.user),
        label: localizations.profile,
        backgroundColor: AppColors.darkGreen,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryGreen,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryGreen,
          ),
          unselectedLabelStyle: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
          ),
          elevation: 8,
          items: _navItems,
        ),
      ),
    );
  }
}
