import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';
import 'package:provider/provider.dart';
import 'package:medical/Providers/ThemeProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            _buildProfileHeader(screenWidth, screenHeight),

            SizedBox(height: screenHeight * 0.02),

            // Mon Compte Section
            _buildSectionTitle('MON COMPTE', screenWidth),
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Informations personnelles',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Historique médical',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            // Mes Données Section
            _buildSectionTitle('MES DONNÉES', screenWidth),
            _buildMenuItem(
              icon: Icons.description_outlined,
              title: 'Documents & Ordonnances',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.credit_card,
              title: 'Moyens de paiement',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            // Préférences Section
            _buildSectionTitle('PRÉFÉRENCES', screenWidth),
            _buildMenuItemWithSwitch(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              value: notificationsEnabled,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            _buildMenuItemWithSwitch(
              icon: Icons.dark_mode_outlined,
              title: 'Mode sombre',
              value: isDark,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: "Centre d'aide",
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.03),

            // Logout Button
            _buildLogoutButton(screenWidth, screenHeight),

            SizedBox(height: screenHeight * 0.02),

            // Version
            Text(
              'Version 2.4.0 (922)',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                color: Colors.grey[400],
              ),
            ),

            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(double screenWidth, double screenHeight) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [
                  const Color(0xFF1E3A8A),
                  const Color(0xFF1E40AF),
                ] // Dark mode blue gradient
              : [Colors.blue[600]!, Colors.blue[400]!],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              // Profile Title
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // Name
              Text(
                'Medelci Aymen ',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: screenHeight * 0.005),

              // Email
              Text(
                'aymenmedelci@email.com',
                style: TextStyle(
                  fontSize: screenWidth * 0.038,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // Stats Row
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('12', 'RENDEZ-VOUS', screenWidth),
                    Container(
                      width: 1,
                      height: screenHeight * 0.05,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    _buildStatItem('5', 'MÉDECINS', screenWidth),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.015),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, double screenWidth) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: screenWidth * 0.065,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.028,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.02,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.032,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required double screenWidth,
    required double screenHeight,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.005,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.018,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF2C3E50)
                        : Colors.blue[50], // Icon background adaptive
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: isDark
                        ? theme.primaryColor
                        : Colors.blue[600], // Icon color
                    size: screenWidth * 0.055,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: isDark ? Colors.grey[600] : Colors.grey[400],
                  size: screenWidth * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemWithSwitch({
    required IconData icon,
    required String title,
    required bool value,
    required double screenWidth,
    required double screenHeight,
    ThemeData?
    theme, // Added theme as parameter slightly optionally or forced in this use case
    required ValueChanged<bool> onChanged,
  }) {
    theme ??= Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.005,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.012,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.025),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF2C3E50)
                    : Colors.blue[50], // Fix background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isDark ? theme.primaryColor : Colors.blue[600],
                size: screenWidth * 0.055,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Show logout confirmation dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Se déconnecter'),
                content: const Text(
                  'Êtes-vous sûr de vouloir vous déconnecter ?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle logout
                    },
                    child: Text(
                      'Déconnecter',
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ],
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red[600],
                  size: screenWidth * 0.05,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Se déconnecter',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
