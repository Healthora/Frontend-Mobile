import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';
import 'package:medical/screen/details/BookingPage.dart';

class DoctorDetailPage extends StatefulWidget {
  final Map<String, dynamic>? doctor;

  const DoctorDetailPage({super.key, this.doctor});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Default data if doctor is null
    final nom = widget.doctor?['name'] ?? 'Dr. Jean Martin';
    final specialite = widget.doctor?['specialty'] ?? 'Cardiologue Spécialisé';
    final location = widget.doctor?['location'] ?? 'Paris, France';
    final rating = widget.doctor?['rating']?.toString() ?? '4.8';
    final experience = widget.doctor?['experience']?.toString() ?? '10+ Ans';
    final patients = widget.doctor?['patients']?.toString() ?? '5k+';

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // ==========================================
            // BLUE HEADER BACKGROUND
            // ==========================================
            Container(
              height: screenHeight * 0.22,
              width: double.infinity,
              color: AppColors.blue,
            ),

            // ==========================================
            // MAIN CONTENT CARD
            // ==========================================
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.16),
              padding: EdgeInsets.only(
                top: screenHeight * 0.08,
              ), // Space for the avatar
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Doctor Name
                  Text(
                    nom,
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),

                  // Specialty
                  Text(
                    specialite,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // Location Pin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.grey[400],
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          color: AppColors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // ==========================================
                  // STATS CARDS
                  // ==========================================
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCardExpanded(
                          'EXPÉRIENCE',
                          experience,
                          Icons.business_center,
                          AppColors.blue,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                        _buildStatCardExpanded(
                          'PATIENTS',
                          patients,
                          Icons.people,
                          AppColors.blue,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                        _buildStatCardExpanded(
                          'AVIS',
                          '$rating/5',
                          Icons.star,
                          AppColors.blue,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // ==========================================
                  // TABS (À propos, Avis, Disponibilités)
                  // ==========================================

                  // ==========================================
                  // BIO & LOCATION (Static content for mock)
                  // ==========================================
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bio Title
                        Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),

                        // Bio Text with "Lire plus"
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: screenWidth * 0.033,
                              color: AppColors.grey[600],
                              height: 1.6,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Le $nom est un $specialite de renom avec plus de $experience. Spécialisé dans le diagnostic préventif et les soins personnalisés, il s\'engage à fournir des traitements de pointe à ses patients... ',
                              ),
                              TextSpan(
                                text: 'Lire plus',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Localisation Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Localisation',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                            Text(
                              'VOIR ITINÉRAIRE',
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),

                        // Address text
                        Text(
                          '15 Avenue de la République, 75011 Paris',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: theme.textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'Cabinet Médical - 2ème étage avec ascenseur',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: AppColors.grey[500],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Map Placeholder
                        Container(
                          width: double.infinity,
                          height: screenHeight * 0.2,
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF2C3E50)
                                : AppColors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CustomPaint(
                                  size: Size.infinite,
                                  painter: _DetailMapGridPainter(),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  decoration: BoxDecoration(
                                    color: AppColors.blue.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    color: AppColors.blue,
                                    size: screenWidth * 0.08,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom Padding
                        SizedBox(height: screenHeight * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // DOCTOR AVATAR (Overlaps blue header)
            // ==========================================
            Positioned(
              top:
                  screenHeight * 0.16 -
                  (screenWidth * 0.14), // Center vertically on the border
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth * 0.28,
                      height: screenWidth * 0.28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.scaffoldBackgroundColor,
                          width: 4,
                        ),
                        color: AppColors.blue[50], // If no image, looks nice
                      ),
                      child: ClipOval(
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.16,
                          color: AppColors.blue[200],
                        ),
                      ),
                    ),
                    // Verified Badge
                    Positioned(
                      bottom: screenWidth * 0.01,
                      right: screenWidth * 0.01,
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.005),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E1E1E)
                              : AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified,
                          color: AppColors.blue,
                          size: screenWidth * 0.065,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==========================================
            // TOP APP BAR BUTTONS
            // ==========================================
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical:
                      screenHeight *
                      0.01, // Reduce vertical padding to lift buttons
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(
                      Icons.arrow_back,
                      () => Navigator.pop(context),
                      screenWidth,
                    ),
                    Row(
                      children: [
                        _buildIconButton(Icons.share, () {}, screenWidth),
                        SizedBox(width: screenWidth * 0.03),
                        _buildIconButton(Icons.favorite, () {}, screenWidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ==========================================
      // STICKY BOTTOM RESERVATION BUTTON
      // ==========================================
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingPage(doctor: widget.doctor),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Réserver',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Icon(Icons.calendar_today_rounded, size: screenWidth * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget: App Bar Circular Buttons
  Widget _buildIconButton(
    IconData icon,
    VoidCallback onPressed,
    double screenWidth,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.white, size: screenWidth * 0.055),
        onPressed: onPressed,
      ),
    );
  }

  // Helper Widget: Stats Cards (Experience, Patients, Rating)
  Widget _buildStatCardExpanded(
    String label,
    String value,
    IconData icon,
    Color iconColor,
    double screenWidth,
    bool isDark,
    ThemeData theme,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: screenWidth * 0.06),
            SizedBox(height: screenWidth * 0.02),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.025,
                fontWeight: FontWeight.w700,
                color: AppColors.grey[500],
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: screenWidth * 0.015),
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Class for the Map Background placeholder
class _DetailMapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..strokeWidth = 1.5;

    for (var i = 0.0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
