import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../l10n/app_localizations.dart';

const Color kPrimaryGreen = Color(0xFF1B710A);
const Color kAccentCoral = Color(0xFFF7A598);
const Color kSubtitleColor = Color(0xFF6A6A6A);

class PhoneRegistrationScreen extends StatelessWidget {
  const PhoneRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive positioning of header shapes
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- 1. Decorative Header Shapes ---
          // Top Left Coral Shape
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: screenWidth * 0.7,
              height: screenWidth * 0.7,
              decoration: BoxDecoration(
                color: kAccentCoral,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(screenWidth * 0.7),
                ),
              ),
            ),
          ),
          // Top Right Green Shape
          Positioned(
            top: -50,
            right: -100,
            child: Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: kPrimaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.5),
                ),
              ),
            ),
          ),

          // --- 2. Main Content and Back Button ---
          SafeArea(
            child: SingleChildScrollView(
              // Allow content to scroll if the keyboard appears
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button (positioned manually)
                  const SizedBox(height: 20),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.arrow_left,
                        size: 20,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Handle back action
                        Navigator.of(context).pop();
                        print('Back button pressed');
                      },
                      padding: const EdgeInsets.only(right: 2.0),
                    ),
                  ),

                  // Title and Subtitle
                  SizedBox(
                    height: screenWidth * 0.35,
                  ), // Space below the header shapes
                  Text(
                    AppLocalizations.of(context)?.registrationText ??
                        'Registration',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.enterPhoneToVerifyText ??
                        'Enter your phone number to verify\nyour account',
                    style: TextStyle(fontSize: 16, color: kSubtitleColor),
                  ),

                  // Phone Number Input Field
                  const SizedBox(height: 40),
                  TextFormField(
                    initialValue: '+1-555-0123',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1.5,
                        ), // Lighter border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kPrimaryGreen,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),

                  // SEND Button
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle send action
                        Navigator.of(context).pushReplacementNamed('/home');
                        print('SEND button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        AppLocalizations.of(context)?.sendText ?? 'SEND',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }
}
