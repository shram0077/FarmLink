import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/providers/language_provider.dart';
import '../../l10n/app_localizations.dart';
import '../navigation/main_navigation_screen.dart';

class SelecteLanguage extends StatefulWidget {
  const SelecteLanguage({super.key});

  @override
  State<SelecteLanguage> createState() => _SelecteLanguageState();
}

class _SelecteLanguageState extends State<SelecteLanguage> {
  // Define the primary green color from the screenshot for reuse.
  final Color _primaryColor = const Color(0xFF006400); // A dark green color

  @override
  void initState() {
    super.initState();
    // Check if language is already selected and navigate accordingly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      if (languageProvider.currentLanguage != 'en') {
        // Language already selected, navigate to main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make the layout responsive to different screen sizes.
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top-left decorative green circle shape
          Positioned(
            top: -screenHeight * 0.15,
            left: -screenWidth * 0.4,
            child: Container(
              height: screenHeight * 0.4,
              width: screenHeight * 0.4,
              decoration: BoxDecoration(
                color: _primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom-right decorative green circle shape
          Positioned(
            bottom: -screenHeight * 0.2,
            right: -screenWidth * 0.3,
            child: Container(
              height: screenHeight * 0.4,
              width: screenHeight * 0.4,
              decoration: BoxDecoration(
                color: _primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content aligned in the center
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/farmlink_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Welcome Text
                  Text(
                    AppLocalizations.of(context)?.welcomeSelectLanguage ??
                        'Welcome',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: _primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle Text
                  Text(
                    AppLocalizations.of(context)?.pleaseSelectLanguage ??
                        'Please Select Your Language',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  const SizedBox(height: 60),
                  // Language Buttons
                  _buildLanguageButton('Kurdish'),
                  const SizedBox(height: 20),
                  _buildLanguageButton('Arabic'),
                  const SizedBox(height: 20),
                  _buildLanguageButton('English'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// A helper method to create styled language buttons to avoid code repetition.
  Widget _buildLanguageButton(String language) {
    return ElevatedButton(
      onPressed: () {
        String languageCode = 'en';
        if (language == 'Kurdish') languageCode = 'ku';
        if (language == 'Arabic') languageCode = 'ar';

        final languageProvider = Provider.of<LanguageProvider>(
          context,
          listen: false,
        );
        languageProvider.changeLanguage(languageCode);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        );
        // TODO: Add navigation or language selection logic here
        print('$language selected');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        elevation: 5, // Adds a subtle shadow
      ),
      child: Text(
        language,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
