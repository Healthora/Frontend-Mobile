import 'package:flutter/material.dart';
import 'package:medical/screen/auth/ForgotPasswordPage.dart';
import 'package:medical/screen/auth/OtpPage.dart';
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
                          color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Center(
                            child: Text(
                              isLoginPage ? 'Connexion' : 'Inscription',
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ),
                        ),
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
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        height: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary
                                              .withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(
                                          size.width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.medical_services,
                                          color: theme.colorScheme.onPrimary,
                                          size: size.width * 0.12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  Text(
                                    isLoginPage
                                        ? 'Bon retour'
                                        : 'Créer un compte',
                                    style: TextStyle(
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.bold,
                                      color: theme.textTheme.bodyLarge?.color,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.008),
                                  Text(
                                    isLoginPage
                                        ? 'Votre santé, simplifiée et sécurisée.'
                                        : 'Rejoignez-nous pour une vie plus saine.',
                                    style: TextStyle(
                                      fontSize: size.width * 0.032,
                                      color: theme.textTheme.bodySmall?.color
                                          ?.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  Container(
                                    height: size.height * 0.05,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.grey[800]
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        _buildToggleItem(
                                          'Connexion',
                                          isLoginPage,
                                          () {
                                            if (!isLoginPage) togglePage();
                                          },
                                          size,
                                          theme,
                                        ),
                                        _buildToggleItem(
                                          'Inscription',
                                          !isLoginPage,
                                          () {
                                            if (isLoginPage) togglePage();
                                          },
                                          size,
                                          theme,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  if (!isLoginPage) ...[
                                    _buildTextField(
                                      context,
                                      nameController,
                                      'Nom complet',
                                      Icons.person_outline,
                                      size,
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                  ],
                                  _buildTextField(
                                    context,
                                    emailController,
                                    'Email ou numéro de téléphone',
                                    Icons.alternate_email,
                                    size,
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  _buildTextField(
                                    context,
                                    passwordController,
                                    'Mot de passe',
                                    Icons.lock_outline,
                                    size,
                                    isPassword: true,
                                    isPasswordVisible: isPasswordVisible,
                                    onTogglePassword: () => setState(
                                      () => isPasswordVisible =
                                          !isPasswordVisible,
                                    ),
                                  ),
                                  if (!isLoginPage) ...[
                                    SizedBox(height: size.height * 0.02),
                                    _buildTextField(
                                      context,
                                      confirmPasswordController,
                                      'Confirmer le mot de passe',
                                      Icons.lock_outline,
                                      size,
                                      isPassword: true,
                                      isPasswordVisible:
                                          isConfirmPasswordVisible,
                                      onTogglePassword: () => setState(
                                        () => isConfirmPasswordVisible =
                                            !isConfirmPasswordVisible,
                                      ),
                                    ),
                                  ],
                                  if (isLoginPage) ...[
                                    SizedBox(height: size.height * 0.015),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Forgotpasswordpage(),
                                          ),
                                        ),
                                        child: Text(
                                          'Mot de passe oublié ?',
                                          style: TextStyle(
                                            color: theme.colorScheme.primary,
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ] else
                                    SizedBox(height: size.height * 0.02),
                                  SizedBox(height: size.height * 0.01),
                                  SizedBox(
                                    width: double.infinity,
                                    height: size.height * 0.065,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navigation_Bar(),
                                            ),
                                          ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        foregroundColor:
                                            theme.colorScheme.onPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        isLoginPage
                                            ? 'Connexion'
                                            : 'Inscription',
                                        style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isLoginPage) ...[
                                    SizedBox(height: size.height * 0.02),
                                    SizedBox(
                                      width: double.infinity,
                                      height: size.height * 0.065,
                                      child: OutlinedButton.icon(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const OtpPage(),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.message_outlined,
                                          size: size.width * 0.05,
                                        ),
                                        label: Text(
                                          'Se connecter avec OTP',
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              theme.colorScheme.primary,
                                          side: BorderSide(
                                            color: theme.colorScheme.primary,
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

  Widget _buildToggleItem(
    String title,
    bool isSelected,
    VoidCallback onTap,
    Size size,
    ThemeData theme,
  ) {
    final isDark = theme.brightness == Brightness.dark;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? const Color(0xFF2C3E50) : Colors.white)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.04,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? (isDark ? Colors.white : theme.colorScheme.primary)
                    : theme.textTheme.bodySmall?.color?.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    IconData icon,
    Size size, {
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: size.height * 0.065,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: theme.dividerColor),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        style: TextStyle(
          fontSize: size.width * 0.04,
          color: theme.textTheme.bodyLarge?.color,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.textTheme.bodySmall?.color?.withOpacity(0.4),
            fontSize: size.width * 0.04,
          ),
          prefixIcon: Icon(
            icon,
            color: theme.iconTheme.color?.withOpacity(0.4),
            size: size.width * 0.055,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: theme.iconTheme.color?.withOpacity(0.4),
                    size: size.width * 0.055,
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
        ),
      ),
    );
  }
}
