import 'package:flutter/material.dart';
import 'package:medical/screen/details/PatientInfoPage.dart';
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
            _buildProfileHeader(screenWidth, screenHeight, theme),

            SizedBox(height: screenHeight * 0.02),

            // Mon Compte Section
            _buildSectionTitle('MON COMPTE', screenWidth, theme),
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Informations personnelles',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientInfoPage(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Historique médical',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            // Mes Données Section
            _buildSectionTitle('MES DONNÉES', screenWidth, theme),
            _buildMenuItem(
              icon: Icons.description_outlined,
              title: 'Documents & Ordonnances',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.message,
              title: 'Messages et mails ',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            // Préférences Section
            _buildSectionTitle('PRÉFÉRENCES', screenWidth, theme),
            _buildMenuItemWithSwitch(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              value: notificationsEnabled,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onChanged: (value) =>
                  setState(() => notificationsEnabled = value),
            ),
            _buildMenuItemWithSwitch(
              icon: Icons.dark_mode_outlined,
              title: 'Mode sombre',
              value: isDark,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onChanged: (value) => themeProvider.toggleTheme(value),
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: "Centre d'aide",
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              theme: theme,
              onTap: () {},
            ),

            SizedBox(height: screenHeight * 0.03),

            // Logout Button
            _buildLogoutButton(screenWidth, screenHeight, theme),

            SizedBox(height: screenHeight * 0.02),

            // Version
            Text(
              'Version 2.4.0 (922)',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
              ),
            ),

            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(
    double screenWidth,
    double screenHeight,
    ThemeData theme,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
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
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                'Medelci Aymen',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'aymenmedelci@email.com',
                style: TextStyle(
                  fontSize: screenWidth * 0.038,
                  color: theme.colorScheme.onPrimary.withOpacity(0.9),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('12', 'RENDEZ-VOUS', screenWidth, theme),
                    Container(
                      width: 1,
                      height: screenHeight * 0.05,
                      color: theme.colorScheme.onPrimary.withOpacity(0.2),
                    ),
                    _buildStatItem('5', 'MÉDECINS', screenWidth, theme),
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

  Widget _buildStatItem(
    String value,
    String label,
    double screenWidth,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: screenWidth * 0.065,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.028,
            color: theme.colorScheme.onPrimary.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth, ThemeData theme) {
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
          color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
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
    required ThemeData theme,
    required VoidCallback onTap,
  }) {
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
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: theme.colorScheme.primary,
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
                  color: theme.iconTheme.color?.withOpacity(0.4),
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
    required ThemeData theme,
    required ValueChanged<bool> onChanged,
  }) {
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
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
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
              activeTrackColor: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(
    double screenWidth,
    double screenHeight,
    ThemeData theme,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showLogoutDialog(context, theme),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red[400],
                  size: screenWidth * 0.05,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Se déconnecter',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Se déconnecter'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
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
              style: TextStyle(color: Colors.red[400]),
            ),
          ),
        ],
      ),
    );
  }
}
