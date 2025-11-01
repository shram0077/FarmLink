import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'john.farmer@example.com');
    _passwordController = TextEditingController(text: 'password123');
  }

  @override
  void dispose() {
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
            // Header with decorative shapes and back button
            _buildHeader(screenHeight, screenWidth),

            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)?.login ?? 'Login',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  _buildTextField(label: 'E-mail', hint: 'Your email or phone'),
                  SizedBox(height: screenHeight * 0.02),
                  _buildPasswordField(),
                  SizedBox(height: screenHeight * 0.01),
                  _buildForgotPasswordLink(),
                  SizedBox(height: screenHeight * 0.04),
                  _buildLoginButton(),
                  SizedBox(height: screenHeight * 0.02),
                  _buildSignUpLink(context),
                  SizedBox(height: screenHeight * 0.05),
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

  // Header with decorative shapes and back button
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
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Iconsax.arrow_left, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Text field widget
  Widget _buildTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label == 'E-mail'
              ? (AppLocalizations.of(context)?.email ?? 'E-mail')
              : label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
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
          AppLocalizations.of(context)?.password ?? 'Password',
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
            hintText: 'Password',
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

  // Forgot Password link
  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: Text(
          AppLocalizations.of(context)?.forgotPassword ?? 'Forgot password?',
          style: const TextStyle(
            color: Color(0xFF4CAF50),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Main "LOGIN" button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle login action with fake data
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
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Link to sign up page
  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${AppLocalizations.of(context)?.dontHaveAccount ?? "Don't have an account?"} ",
          style: TextStyle(color: Colors.grey[600], fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to Sign Up screen
          },
          child: Text(
            AppLocalizations.of(context)?.signup ?? 'Sign Up',
            style: const TextStyle(
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
            'Sign in with',
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
            label: AppLocalizations.of(context)?.facebook ?? 'Facebook',
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
            label: AppLocalizations.of(context)?.google ?? 'Google',
            color: const Color(0xFFDB4437),
            onTap: () {
              // Handle Google sign in
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
