import 'package:flutter/material.dart';
import 'package:medical/screen/navigation/AppointmentsPage.dart';
import 'package:medical/screen/navigation/Homepage.dart';
import 'package:medical/screen/navigation/ProfilePage.dart';
import 'package:medical/screen/navigation/SearchPage.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({super.key});

  @override
  State<Navigation_Bar> createState() => _Navigation_Bar();
}

class _Navigation_Bar extends State<Navigation_Bar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Appointmentspage(),
    const Searchpage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing based on screen dimensions
    final horizontalPadding = screenWidth * 0.06; // 5% of screen width
    final bottomPadding = screenHeight * 0.03; // 2% of screen height
    final navBarHeight = screenHeight * 0.08; // 9% of screen height
    final borderRadius =
        navBarHeight * 0.5; // Half of height for perfect rounded edges
    final iconSize = screenWidth * 0.06; // 6.5% of screen width
    final fontSize = screenWidth * 0.03; // 3% of screen width

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Set scaffold background
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: bottomPadding,
        ),
        child: Container(
          height: navBarHeight.clamp(60.0, 85.0), // Min 60, max 85
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(borderRadius.clamp(30.0, 42.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.home_rounded,
                  label: 'Accueil',
                  index: 0,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _buildNavItem(
                  icon: Icons.calendar_today_rounded,
                  label: 'Rendez-vous',
                  index: 1,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _buildNavItem(
                  icon: Icons.search_rounded,
                  label: 'Recherche',
                  index: 2,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _buildNavItem(
                  icon: Icons.person,
                  label: 'Profil',
                  index: 3,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required double iconSize,
    required double fontSize,
  }) {
    final theme = Theme.of(context);

    final bool isSelected = _selectedIndex == index;
    final Color itemColor = isSelected
        ? theme.colorScheme.primary
        : theme.textTheme.bodySmall?.color?.withOpacity(0.5) ?? Colors.grey;

    // Responsive padding
    final horizontalPadding = MediaQuery.of(context).size.width * 0.03;
    final verticalPadding = MediaQuery.of(context).size.height * 0.008;

    return Flexible(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.clamp(8.0, 16.0),
            vertical: verticalPadding.clamp(6.0, 10.0),
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: itemColor,
                size: isSelected
                    ? (iconSize * 1.15).clamp(22.0, 32.0)
                    : iconSize.clamp(20.0, 28.0),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.003),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: isSelected
                        ? (fontSize * 1.1).clamp(10.0, 14.0)
                        : fontSize.clamp(9.0, 13.0),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
