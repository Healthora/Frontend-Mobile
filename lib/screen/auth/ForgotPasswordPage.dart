import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';


class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
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
                          padding: EdgeInsets.only(
                            top: size.height * 0.08,
                            bottom: size.width * 0.02,
                          ),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w600,
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
                            'Enter your email so that we can send you password resent link.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              color: AppColors.grey[600],
                              height: size.height * 0.0015,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),

                        Container(
                          margin: EdgeInsets.all(size.width * 0.05),
                          height: size.height * 0.065,
                          decoration: BoxDecoration(
                            color: AppColors.grey[50],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: size.width * 0.04),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: AppColors.grey[400],
                                fontSize: size.width * 0.04,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
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
                        ),

                        SizedBox(
                          width: size.width * 0.7,
                          height: size.height * 0.065,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Send reset link',
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            "<-- Back to login",
                            style: TextStyle(
                              color: AppColors.blue[300],
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blue,
                              decorationThickness: 1,
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
