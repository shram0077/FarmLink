import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../core/providers/language_provider.dart';
import '../../l10n/app_localizations.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String _selectedLanguage = 'en'; // Default to English

  @override
  void initState() {
    super.initState();
    // Get current locale from provider
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    _selectedLanguage = languageProvider.currentLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.selectLanguage ?? 'Select Language',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)?.changeLanguage ??
                  'Choose your preferred language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 20),
            _buildLanguageOption(
              languageCode: 'en',
              languageName: 'English',
              nativeName: 'English',
              flag: '🇺🇸',
              isSelected: _selectedLanguage == 'en',
            ),
            const SizedBox(height: 12),
            _buildLanguageOption(
              languageCode: 'ar',
              languageName: 'العربية',
              nativeName: 'Arabic',
              flag: '🇸🇦',
              isSelected: _selectedLanguage == 'ar',
            ),
            const SizedBox(height: 12),
            _buildLanguageOption(
              languageCode: 'ku',
              languageName: 'کوردی سۆرانی',
              nativeName: 'Kurdish Sorani',
              flag: '🇮🇶',
              isSelected: _selectedLanguage == 'ku',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final languageProvider = Provider.of<LanguageProvider>(
                    context,
                    listen: false,
                  );
                  if (_selectedLanguage != languageProvider.currentLanguage) {
                    // Change locale using provider
                    languageProvider.changeLanguage(_selectedLanguage);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${AppLocalizations.of(context)?.languageChanged ?? 'Language changed to'} ${_getLanguageName(_selectedLanguage)}',
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)?.ok ?? 'Apply',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String languageCode,
    required String languageName,
    required String nativeName,
    required String flag,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF4CAF50) : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Text(flag, style: const TextStyle(fontSize: 24)),
        title: Text(
          languageName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        subtitle: Text(
          nativeName,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: isSelected
            ? const Icon(
                Iconsax.tick_circle,
                color: Color(0xFF4CAF50),
                size: 24,
              )
            : Icon(Iconsax.tick_circle, color: Colors.grey[400], size: 20),
        onTap: () {
          setState(() {
            _selectedLanguage = languageCode;
          });
        },
      ),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'ku':
        return 'کوردی سۆرانی';
      default:
        return 'English';
    }
  }
}
