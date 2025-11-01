import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/expert.dart';
import '../../../core/routing/route_names.dart';

class ExpertProfile extends StatelessWidget {
  final Expert expert;

  const ExpertProfile({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.appName ?? 'Agro link',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            // TODO: Handle back navigation
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Expert Avatar
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(expert.imageUrl),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 16),
            // Expert Name
            Text(
              expert.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // Details Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    context,
                    title:
                        AppLocalizations.of(context)?.callForAdvice ??
                        'Call for Advice',
                    subtitle:
                        expert.phoneNumber ??
                        AppLocalizations.of(context)?.notAvailable ??
                        'Not available',
                    icon: Iconsax.call,
                  ),
                  const Divider(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamed(RouteNames.chat, arguments: expert);
                    },
                    child: _buildInfoRow(
                      context,
                      title:
                          AppLocalizations.of(context)?.chatForAdvice ??
                          'Chat for Advice',
                      subtitle:
                          expert.email ??
                          AppLocalizations.of(context)?.notAvailable ??
                          'Not available',
                      icon: Iconsax.message,
                    ),
                  ),
                  const Divider(height: 30),
                  _buildInfoRow(
                    context,
                    title: AppLocalizations.of(context)?.location ?? 'Location',
                    subtitle: expert.address,
                    icon: Iconsax.location,
                  ),
                  const Divider(height: 30),
                  _buildDescriptionRow(
                    context,
                    title:
                        AppLocalizations.of(context)?.workDescription ??
                        'Work Description',
                    description: expert.workDescription,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build a row with a title, subtitle, and an icon.
  Widget _buildInfoRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Icon(icon, color: Colors.black54),
      ],
    );
  }

  /// Helper method for the description section which has a different layout.
  Widget _buildDescriptionRow(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
