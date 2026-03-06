import 'package:flutter/material.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
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
                          padding: EdgeInsets.only(
                            top: size.height * 0.08,
                            bottom: size.width * 0.02,
                          ),
                          child: Text(
                            'Mot de passe oublié',
                            style: TextStyle(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w600,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1,
                          ),
                          child: Text(
                            'Entrez votre adresse email afin que nous puissions vous envoyer un lien de réinitialisation.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              color: theme.textTheme.bodySmall?.color
                                  ?.withOpacity(0.6),
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        Container(
                          margin: EdgeInsets.all(size.width * 0.05),
                          height: size.height * 0.065,
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[800] : Colors.grey[50],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: theme.dividerColor),
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                            decoration: InputDecoration(
                              hintText: "Adresse email",
                              hintStyle: TextStyle(
                                color: theme.textTheme.bodySmall?.color
                                    ?.withOpacity(0.4),
                                fontSize: size.width * 0.04,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: theme.iconTheme.color?.withOpacity(0.4),
                                size: size.width * 0.055,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.015,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          height: size.height * 0.065,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Envoyer le lien',
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "<-- Retour à la connexion",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: theme.colorScheme.primary,
                              fontSize: size.width * 0.04,
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
}
