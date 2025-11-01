import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // IMPORTANT: Make sure you have an image in 'assets/images/background.jpg'
                // Or replace this with your desired background image path.
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.withOpacity(0.4),
                  Colors.white.withOpacity(0.1),
                  Colors.green.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // UI Elements
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                children: [
                  // Skip Button
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text(
                        AppLocalizations.of(context)?.skip ?? 'Skip',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.1),
                  // Welcome Text
                  Text(
                    AppLocalizations.of(context)?.welcome ?? 'Welcome to',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)?.appName ?? 'FarmLink',
                    style: const TextStyle(
                      color: Color.fromARGB(
                        255,
                        142,
                        254,
                        37,
                      ), // A nice green color
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),

                  SizedBox(height: screenHeight * 0.05),

                  // Sign in with Divider
                  _buildSignInDivider(context),

                  SizedBox(height: screenHeight * 0.03),

                  // Social Login Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildSocialButton(
                          icon: Iconsax.user,
                          label:
                              AppLocalizations.of(context)?.facebook ??
                              'Facebook',
                          color: const Color(0xFF1877F2),
                          onTap: () {
                            // Handle Facebook sign in
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: _buildSocialButton(
                          icon: Iconsax.user,
                          label:
                              AppLocalizations.of(context)?.google ?? 'Google',
                          color: const Color(0xFFDB4437),
                          onTap: () {
                            // Handle Google sign in
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Action Buttons
                  _buildActionButton(
                    text:
                        AppLocalizations.of(context)?.startWithEmail ??
                        'Start with Email',
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildActionButton(
                    text:
                        AppLocalizations.of(context)?.startWithPhone ??
                        'Start with Phone',
                    onTap: () {
                      Navigator.pushNamed(context, '/phone-registration');
                    },
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Sign In Link
                  _buildSignInLink(context),

                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for "sign in with" divider
  Widget _buildSignInDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white54)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            AppLocalizations.of(context)?.signInWith ?? 'sign in with',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.white54)),
      ],
    );
  }

  // Helper widget for social login buttons (Facebook, Google)
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: color, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              // Frosted glass blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(),
              ),
              // Semi-transparent background + gradient
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.25),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for the "Already have an account?" link
  Widget _buildSignInLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${AppLocalizations.of(context)?.alreadyHaveAccount ?? 'Already have an account?'} ",
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            AppLocalizations.of(context)?.login ?? 'SignIn',
            style: const TextStyle(
              color: Color(0xFF4CAF50), // Green color to match the title
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
