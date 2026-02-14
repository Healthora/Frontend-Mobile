import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';
import 'package:medical/screen/auth/ForgotPasswordPage.dart';
import 'package:medical/screen/navigation/Navigation_Bar.dart';

class LoginRegistrationPage extends StatefulWidget {
  const LoginRegistrationPage({super.key});

  @override
  State<LoginRegistrationPage> createState() => _LoginRegistrationPageState();
}

class _LoginRegistrationPageState extends State<LoginRegistrationPage> {
  bool isLoginPage = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
      // Clear fields when switching
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      nameController.clear();
      isPasswordVisible = false;
      isConfirmPasswordVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.grey[200],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Main Content Card
                Positioned(
                  top: size.height * 0.03,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Back button and title
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    isLoginPage ? 'Sign In' : 'Sign Up',
                                    style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Scrollable content area
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.01),

                                  // Shield Icon with dots
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        height: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: AppColors.blue[50],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(
                                          size.width * 0.04,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: AppColors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.medical_services,
                                          color: AppColors.white,
                                          size: size.width * 0.12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: size.height * 0.02),
                                  // Welcome text
                                  Text(
                                    isLoginPage
                                        ? 'Welcome Back'
                                        : 'Create Account',
                                    style: TextStyle(
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: size.height * 0.008),

                                  Text(
                                    isLoginPage
                                        ? 'Your health, simplified and secure.'
                                        : 'Join us for a healthier life.',
                                    style: TextStyle(
                                      fontSize: size.width * 0.032,
                                      color: AppColors.grey[600],
                                    ),
                                  ),

                                  SizedBox(height: size.height * 0.03),

                                  // Toggle buttons
                                  Container(
                                    height: size.height * 0.05,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey[100],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (!isLoginPage) togglePage();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: isLoginPage
                                                    ? AppColors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                boxShadow: isLoginPage
                                                    ? [
                                                        BoxShadow(
                                                          color: AppColors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 8,
                                                          offset: const Offset(
                                                            0,
                                                            2,
                                                          ),
                                                        ),
                                                      ]
                                                    : null,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: isLoginPage
                                                        ? FontWeight.w600
                                                        : FontWeight.w500,
                                                    color: isLoginPage
                                                        ? AppColors.blue
                                                        : AppColors.grey[600],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (isLoginPage) togglePage();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: !isLoginPage
                                                    ? AppColors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                boxShadow: !isLoginPage
                                                    ? [
                                                        BoxShadow(
                                                          color: AppColors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 8,
                                                          offset: const Offset(
                                                            0,
                                                            2,
                                                          ),
                                                        ),
                                                      ]
                                                    : null,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Register',
                                                  style: TextStyle(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: !isLoginPage
                                                        ? FontWeight.w600
                                                        : FontWeight.w500,
                                                    color: !isLoginPage
                                                        ? AppColors.blue
                                                        : AppColors.grey[600],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: size.height * 0.03),

                                  // Input fields
                                  if (!isLoginPage) ...[
                                    _buildTextField(
                                      controller: nameController,
                                      hintText: 'Full Name',
                                      icon: Icons.person_outline,
                                      size: size,
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                  ],

                                  _buildTextField(
                                    controller: emailController,
                                    hintText: 'Email or Phone Number',
                                    icon: Icons.alternate_email,
                                    size: size,
                                  ),

                                  SizedBox(height: size.height * 0.02),

                                  _buildTextField(
                                    controller: passwordController,
                                    hintText: 'Password',
                                    icon: Icons.lock_outline,
                                    isPassword: true,
                                    isPasswordVisible: isPasswordVisible,
                                    onTogglePassword: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    size: size,
                                  ),

                                  if (!isLoginPage) ...[
                                    SizedBox(height: size.height * 0.02),
                                    _buildTextField(
                                      controller: confirmPasswordController,
                                      hintText: 'Confirm Password',
                                      icon: Icons.lock_outline,
                                      isPassword: true,
                                      isPasswordVisible:
                                          isConfirmPasswordVisible,
                                      onTogglePassword: () {
                                        setState(() {
                                          isConfirmPasswordVisible =
                                              !isConfirmPasswordVisible;
                                        });
                                      },
                                      size: size,
                                    ),
                                  ],

                                  if (isLoginPage) ...[
                                    SizedBox(height: size.height * 0.015),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Forgotpasswordpage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ] else
                                    SizedBox(height: size.height * 0.02),

                                  SizedBox(height: size.height * 0.01),

                                  // Login/Register Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: size.height * 0.065,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Navigation_Bar(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.blue,
                                        foregroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        isLoginPage ? 'Login' : 'Register',
                                        style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                  if (isLoginPage) ...[
                                    SizedBox(height: size.height * 0.02),

                                    // Login with OTP
                                    SizedBox(
                                      width: double.infinity,
                                      height: size.height * 0.065,
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.message_outlined,
                                          size: size.width * 0.05,
                                        ),
                                        label: Text(
                                          'Login with OTP',
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: AppColors.blue,
                                          side: const BorderSide(
                                            color: AppColors.blue,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Size size,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    return Container(
      height: size.height * 0.065,
      decoration: BoxDecoration(
        color: AppColors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grey[200]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        style: TextStyle(fontSize: size.width * 0.04),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grey[400],
            fontSize: size.width * 0.04,
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.grey[400],
            size: size.width * 0.055,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.grey[400],
                    size: size.width * 0.055,
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
        ),
      ),
    );
  }
}
