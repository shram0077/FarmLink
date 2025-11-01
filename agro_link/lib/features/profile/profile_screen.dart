import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';
import '../../services/fake_data_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeData = FakeDataService.getAllFakeUserData();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.profile ?? 'Profile',
          style: AppTextStyles.headline2.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              margin: const EdgeInsets.all(AppConstants.paddingMedium),
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadius * 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: AppColors.primaryGreen,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Iconsax.user,
                      size: 40,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // User Name
                  Text(
                    fakeData['fullName'] ?? 'John Farmer',
                    style: AppTextStyles.headline2.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // User Email
                  Text(
                    fakeData['email'] ?? 'john.farmer@example.com',
                    style: AppTextStyles.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem(
                        AppLocalizations.of(context)?.posts ?? 'Posts',
                        '12',
                      ),
                      _buildStatItem(
                        AppLocalizations.of(context)?.followers ?? 'Followers',
                        '156',
                      ),
                      _buildStatItem(
                        AppLocalizations.of(context)?.following ?? 'Following',
                        '89',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Profile Options
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadius * 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Iconsax.edit,
                    title:
                        AppLocalizations.of(context)?.editProfile ??
                        'Edit Profile',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    icon: Iconsax.setting,
                    title: AppLocalizations.of(context)?.settings ?? 'Settings',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    icon: Iconsax.message_question,
                    title:
                        AppLocalizations.of(context)?.helpSupport ??
                        'Help & Support',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    icon: Iconsax.message_question,
                    title: AppLocalizations.of(context)?.language ?? 'Language',
                    onTap: () {
                      Navigator.pushNamed(context, '/select-language');
                    },
                  ),
                  _buildDivider(),
                  _buildProfileOption(
                    icon: Iconsax.logout,
                    title: AppLocalizations.of(context)?.logout ?? 'Logout',
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil('/welcome', (route) => false);
                    },
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.paddingLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.headline3.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.bodyText3.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.textPrimary),
      title: Text(
        title,
        style: AppTextStyles.bodyText1.copyWith(
          color: textColor ?? AppColors.textPrimary,
        ),
      ),
      trailing: Icon(
        Iconsax.arrow_right_3,
        size: 16,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
        vertical: AppConstants.paddingMedium,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.divider,
      indent: AppConstants.paddingLarge,
      endIndent: AppConstants.paddingLarge,
    );
  }
}
