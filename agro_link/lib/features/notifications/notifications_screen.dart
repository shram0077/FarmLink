import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';

// --- UI/UX: Create a model to separate data from UI ---
class _Notification {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  _Notification({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isUnread,
  });
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // --- UI/UX: Move hardcoded data into scalable lists ---
  static final List<_Notification> _todayNotifications = [
    _Notification(
      icon: Iconsax.discount_shape,
      iconColor: AppColors.orangeAccent,
      title: 'Special Sale Alert!',
      subtitle: 'Up to 70% off on selected farming equipment',
      time: '2 hours ago',
      isUnread: true,
    ),
    _Notification(
      icon: Iconsax.user_add,
      iconColor: AppColors.accentGreen,
      title: 'New Follower',
      subtitle: 'Ahmad Hassan started following you',
      time: '4 hours ago',
      isUnread: true,
    ),
    _Notification(
      icon: Iconsax.like_1,
      iconColor: AppColors.primaryGreen,
      title: 'Post Liked',
      subtitle: 'Your post about organic farming got 15 likes',
      time: '6 hours ago',
      isUnread: false,
    ),
  ];

  static final List<_Notification> _yesterdayNotifications = [
    _Notification(
      icon: Iconsax.message,
      iconColor: AppColors.darkGreen,
      title: 'New Comment',
      subtitle: 'Sarah commented on your farming tips post',
      time: '1 day ago',
      isUnread: false,
    ),
    _Notification(
      icon: Iconsax.share,
      iconColor: AppColors.lightGreen,
      title: 'Post Shared',
      subtitle: 'Your irrigation system post was shared',
      time: '1 day ago',
      isUnread: false,
    ),
    _Notification(
      icon: Iconsax.star,
      iconColor: AppColors.orangeAccent,
      title: 'Achievement Unlocked',
      subtitle: 'You earned the "Expert Farmer" badge',
      time: '2 days ago',
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // --- APP BAR (UNCHANGED) ---
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
          AppLocalizations.of(context)?.notifications ?? 'Notifications',
          style: AppTextStyles.headline2.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      // --- BODY (Refactored to build from lists) ---
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        children: [
          // Today's Notifications
          Text(
            AppLocalizations.of(context)?.today ?? 'Today',
            style: AppTextStyles.headline3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),

          // UI/UX: Dynamically build list from data model
          ..._todayNotifications
              .map(
                (notification) => _buildNotificationItem(context, notification),
              )
              .toList(),

          const SizedBox(height: AppConstants.paddingLarge),

          // Yesterday's Notifications
          Text(
            AppLocalizations.of(context)?.yesterday ?? 'Yesterday',
            style: AppTextStyles.headline3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),

          // UI/UX: Dynamically build list from data model
          ..._yesterdayNotifications
              .map(
                (notification) => _buildNotificationItem(context, notification),
              )
              .toList(),
        ],
      ),
    );
  }

  /// --- UI/UX: Refactored to use Card and ListTile ---
  Widget _buildNotificationItem(
    BuildContext context,
    _Notification notification,
  ) {
    final bool isUnread = notification.isUnread;

    return Card(
      elevation: 2,
      shadowColor: AppColors.shadowColor.withOpacity(0.5),
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      // UI/UX: Set card color and border based on unread status
      color: isUnread ? AppColors.primaryGreen.withOpacity(0.05) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        side: BorderSide(
          color: isUnread
              ? AppColors.primaryGreen.withOpacity(0.2)
              : AppColors.borderColor,
          width: 1.0,
        ),
      ),
      child: ListTile(
        // UI/UX: Add ripple effect on tap
        onTap: () {
          // TODO: Handle notification tap
        },
        contentPadding: const EdgeInsets.all(AppConstants.paddingSmall),
        // UI/UX: `leading` is the idiomatic way to add the icon
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: notification.iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            notification.icon,
            color: notification.iconColor,
            size: 24,
          ),
        ),
        // UI/UX: `title` handles main text
        title: Text(
          notification.title,
          style: AppTextStyles.bodyText1.copyWith(
            color: AppColors.textPrimary,
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // UI/UX: `subtitle` is perfect for secondary text + time
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.subtitle,
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              notification.time,
              style: AppTextStyles.caption.copyWith(color: AppColors.textLight),
            ),
          ],
        ),
        // UI/UX: `trailing` is the correct place for the unread dot
        trailing: isUnread
            ? Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        isThreeLine: true, // Allows subtitle to be taller without layout issues
      ),
    );
  }
}
