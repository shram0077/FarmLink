import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'John Farmer');
    _emailController = TextEditingController(text: 'john.farmer@example.com');
    _passwordController = TextEditingController(text: 'password123');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with decorative shapes
            _buildHeader(screenHeight, screenWidth),

            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)?.signUpTitle ?? 'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  _buildTextField(
                    label:
                        AppLocalizations.of(context)?.fullNameLabel ??
                        'Full name',
                    hint: 'Try Temp',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(
                    label: AppLocalizations.of(context)?.emailLabel ?? 'E-mail',
                    hint: 'trytempII@gmail.com',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildPasswordField(),
                  SizedBox(height: screenHeight * 0.04),
                  _buildSignUpButton(),
                  SizedBox(height: screenHeight * 0.02),
                  _buildLoginLink(context),
                  SizedBox(height: screenHeight * 0.04),
                  _buildSignInDivider(),
                  SizedBox(height: screenHeight * 0.03),
                  _buildSocialLoginButtons(screenWidth),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header with decorative shapes
  Widget _buildHeader(double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.2,
      child: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.1,
            left: -screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -screenHeight * 0.05,
            right: -screenWidth * 0.25,
            child: Container(
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Text field widget
  Widget _buildTextField({required String label, required String hint}) {
    TextEditingController? controller;
    if (label == (AppLocalizations.of(context)?.fullNameLabel ?? 'Full name')) {
      controller = _nameController;
    } else if (label == (AppLocalizations.of(context)?.emailLabel ?? 'E-mail'))
      controller = _emailController;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF4CAF50)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }

  // Password field widget
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)?.passwordLabel ?? 'Password',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 20),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF4CAF50)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  // Main "SIGN UP" button
  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          shadowColor: Colors.green.withOpacity(0.4),
        ),
        child: Text(
          AppLocalizations.of(context)?.signUpButton ?? 'SIGN UP',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Link to login page
  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${AppLocalizations.of(context)?.alreadyHaveAccount ?? "Already have an account?"} ",
          style: TextStyle(color: Colors.grey[600], fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Color(0xFF4CAF50),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  // Divider with text
  Widget _buildSignInDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            AppLocalizations.of(context)?.signUpWithText ?? 'Sign up with',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  // Social login buttons
  Widget _buildSocialLoginButtons(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildSocialButton(
            icon: Iconsax.user,
            label: 'Facebook',
            color: const Color(0xFF1877F2),
            onTap: () {
              Navigator.pushNamed(context, '/phone-registration');
            },
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: _buildSocialButton(
            icon: Iconsax.user,
            label: 'Google',
            color: const Color(0xFFDB4437),
            onTap: () {
              Navigator.pushNamed(context, '/phone-registration');
            },
          ),
        ),
      ],
    );
  }

  // Reusable social button widget
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: color, size: 20),
      label: Text(label, style: const TextStyle(color: Colors.black87)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
