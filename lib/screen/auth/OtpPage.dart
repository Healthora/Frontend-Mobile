import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical/Static/AppColors.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isOtpSent = false;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: size.height * 0.03,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(
                            isDark ? 0.3 : 0.1,
                          ),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          // Back button and title
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.08,
                              bottom: size.width * 0.02,
                            ),
                            child: Text(
                              isOtpSent
                                  ? 'Vérification OTP'
                                  : 'Connexion avec OTP',
                              style: TextStyle(
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.w600,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),

                          // Subtitle
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1,
                            ),
                            child: Text(
                              isOtpSent
                                  ? 'Veuillez entrer le code à 6 chiffres envoyé à votre numéro.'
                                  : 'Entrez votre numéro de téléphone pour recevoir un code de vérification.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                color: isDark
                                    ? AppColors.grey[400]
                                    : AppColors.grey[600],
                                height: size.height * 0.0015,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),

                          if (!isOtpSent)
                            Container(
                              margin: EdgeInsets.all(size.width * 0.05),
                              height: size.height * 0.065,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey[800]
                                    : AppColors.grey[50],
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.grey[700]!
                                      : Colors.grey[200]!,
                                ),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: theme.textTheme.bodyLarge?.color,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Numéro de téléphone",
                                  hintStyle: TextStyle(
                                    color: AppColors.grey[400],
                                    fontSize: size.width * 0.04,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone_outlined,
                                    color: AppColors.grey[400],
                                    size: size.width * 0.055,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04,
                                    vertical: size.height * 0.02,
                                  ),
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  6,
                                  (index) => _buildOtpBox(context, index, size),
                                ),
                              ),
                            ),

                          SizedBox(height: size.height * 0.04),

                          SizedBox(
                            width: size.width * 0.7,
                            height: size.height * 0.065,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!isOtpSent) {
                                  setState(() {
                                    isOtpSent = true;
                                  });
                                } else {
                                  // Verify OTP Action
                                  // Example: Navigator.pushReplacement(...)
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blue,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                isOtpSent
                                    ? 'Vérifier le code'
                                    : 'Envoyer le code OTP',
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextButton(
                            onPressed: () {
                              if (isOtpSent) {
                                setState(() {
                                  isOtpSent = false;
                                  // Clear OTP fields when going back
                                  for (var controller in _otpControllers) {
                                    controller.clear();
                                  }
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              isOtpSent
                                  ? "<-- Changer de numéro"
                                  : "<-- Retour à la connexion",
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.blue[200]
                                    : AppColors.blue[300],
                                decoration: TextDecoration.underline,
                                decorationColor: isDark
                                    ? AppColors.blue[200]
                                    : AppColors.blue,
                                decorationThickness: 1,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ), // Extra padding for scroll
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, int index, Size size) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: size.width * 0.12,
      height: size.width * 0.14,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : AppColors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : AppColors.blue.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withOpacity(isDark ? 0.0 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.white : AppColors.blue,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) => _onOtpChanged(value, index),
        ),
      ),
    );
  }
}
