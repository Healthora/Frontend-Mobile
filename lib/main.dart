import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medical/Providers/ThemeProvider.dart';
import 'package:medical/screen/auth/LoginRegistrationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            home: LoginRegistrationPage(),
          );
        },
      ),
    );
  }
}
