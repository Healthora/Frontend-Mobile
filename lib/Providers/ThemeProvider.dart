import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical/Static/AppColors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  // Toggles the theme and saves it to SharedPreferences
  Future<void> toggleTheme(bool isDark) async {
    _isDarkMode = isDark;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  // Loads the theme from SharedPreferences on app start
  Future<void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  // Define Light Theme
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.grey[100], // Background
    primaryColor: AppColors.blue,
    colorScheme: const ColorScheme.light(
      primary: AppColors.blue,
      secondary: AppColors.blue,
      surface: Colors.white, // Card background
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
  );

  // Define Dark Theme
  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212), // Dark Background
    primaryColor: Colors.blue[300],
    colorScheme: ColorScheme.dark(
      primary: Colors.blue[300]!,
      secondary: Colors.blue[300]!,
      surface: const Color(0xFF1E1E1E), // Darker card background
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.grey[300]),
      bodyMedium: TextStyle(color: Colors.grey[300]),
    ),
    iconTheme: IconThemeData(color: Colors.grey[300]),
  );
}
