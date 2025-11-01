import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../l10n/app_localizations.dart';

const Color kPrimaryGreen = Color(0xFF1B710A);
const Color kAccentCoral = Color(0xFFF7A598);
const Color kSubtitleColor = Color(0xFF6A6A6A);
const Color kPinBoxBorder = Color(0xFFE0E0E0);

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  // State to hold the 4-digit verification code
  final List<String> _code = ['', '', '', ''];
  final int _codeLength = 4;

  // Handles input from the custom numpad
  void _handleNumpadKey(String key) {
    setState(() {
      if (key == 'BACK') {
        // Find the last non-empty digit and clear it
        for (int i = _codeLength - 1; i >= 0; i--) {
          if (_code[i].isNotEmpty) {
            _code[i] = '';
            break;
          }
        }
      } else if (key.isNotEmpty) {
        // Find the first empty slot and fill it with the number key
        for (int i = 0; i < _codeLength; i++) {
          if (_code[i].isEmpty) {
            _code[i] = key;
            break;
          }
        }
      }

      // Check if the code is complete after every input
      if (!_code.contains('')) {
        print('Code complete: ${_code.join()}');
        // Navigate to home after successful verification
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- 1. Decorative Header Shapes (Reused) ---
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

          // --- 2. Main Content and Numpad Area ---
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  // Top section containing text and PIN input
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back Button
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
                                Navigator.of(context).pop();
                              },
                              padding: const EdgeInsets.only(right: 2.0),
                            ),
                          ),

                          // Title and Subtitle
                          SizedBox(height: screenWidth * 0.35),
                          Text(
                            AppLocalizations.of(
                                  context,
                                )?.verificationCodeText ??
                                'Verification Code',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)?.pleaseTypeCodeText ??
                                'Please type the verification code sent to\ntrytempii@gmail.com',
                            style: TextStyle(
                              fontSize: 16,
                              color: kSubtitleColor,
                            ),
                          ),

                          // PIN Input Fields
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(_codeLength, (index) {
                              // Determine if this box is the currently active one (first empty slot)
                              final isActive = index == _code.indexOf('');

                              return PinInputBox(
                                digit: _code[index],
                                isActive: isActive,
                              );
                            }),
                          ),

                          // Resend Link
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "${AppLocalizations.of(context)?.dontReceiveCode ?? "I don't receive a code! "} ",
                                style: const TextStyle(
                                  color: kSubtitleColor,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        AppLocalizations.of(
                                          context,
                                        )?.sendText ??
                                        'Please resend',
                                    style: TextStyle(
                                      color: kPrimaryGreen,
                                      fontWeight: FontWeight.bold,
                                      // Underline can be added here if needed:
                                      // decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // --- 3. Custom Numpad ---
                CustomNumpad(
                  onKeyPressed: _handleNumpadKey,
                  bottomPadding:
                      safeAreaBottom + 16, // Add padding for safe area
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Widget for the single PIN digit box
class PinInputBox extends StatelessWidget {
  final String digit;
  final bool isActive;

  const PinInputBox({super.key, required this.digit, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isActive ? kPrimaryGreen : kPinBoxBorder,
          width: isActive ? 2.5 : 1.5,
        ),
      ),
      child: Text(
        digit,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: kPrimaryGreen,
        ),
      ),
    );
  }
}

// Custom Widget for the full Numpad
class CustomNumpad extends StatelessWidget {
  final Function(String) onKeyPressed;
  final double bottomPadding;

  const CustomNumpad({
    super.key,
    required this.onKeyPressed,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    // Defines the layout of the 12 keys (10 numbers, empty space, backspace)
    final List<String> keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '',
      '0',
      'BACK',
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, bottomPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5), // Shadow pointing upwards
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.0, // Control button height/width ratio
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: keys.length,
        itemBuilder: (context, index) {
          final key = keys[index];
          if (key.isEmpty) {
            // Empty space for the bottom-left corner
            return const SizedBox.shrink();
          }

          final isBackspace = key == 'BACK';

          return NumpadKey(
            label: isBackspace ? '' : key,
            icon: isBackspace ? Iconsax.back_square : null,
            onTap: () => onKeyPressed(isBackspace ? 'BACK' : key),
          );
        },
      ),
    );
  }
}

// Custom Widget for a single Numpad button
class NumpadKey extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const NumpadKey({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kPinBoxBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: icon != null
              ? Icon(icon, size: 28, color: Colors.black)
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
