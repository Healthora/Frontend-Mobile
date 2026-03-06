import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final nom = widget.doctor?['name'] ?? 'Dr. Jean Martin';
    final specialite = widget.doctor?['specialty'] ?? 'Cardiologue Spécialisé';
    final location = widget.doctor?['location'] ?? 'Paris, France';
    final rating = widget.doctor?['rating']?.toString() ?? '4.8';
    final experience = widget.doctor?['experience']?.toString() ?? '10+ Ans';
    final patients = widget.doctor?['patients']?.toString() ?? '5k+';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Blue Header Background
            Container(
              height: screenHeight * 0.22,
              width: double.infinity,
              color: theme.colorScheme.primary,
            ),

            // Main Content Card
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.16),
              padding: EdgeInsets.only(top: screenHeight * 0.08),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    nom,
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    specialite,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: theme.iconTheme.color?.withOpacity(0.5),
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          color: theme.textTheme.bodySmall?.color?.withOpacity(
                            0.7,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
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
                          theme.colorScheme.primary,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                        _buildStatCardExpanded(
                          'PATIENTS',
                          patients,
                          Icons.people,
                          theme.colorScheme.primary,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                        _buildStatCardExpanded(
                          'AVIS',
                          '$rating/5',
                          Icons.star,
                          theme.colorScheme.primary,
                          screenWidth,
                          isDark,
                          theme,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: screenWidth * 0.033,
                              color: theme.textTheme.bodySmall?.color
                                  ?.withOpacity(0.8),
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
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
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
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),
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
                            color: theme.textTheme.bodySmall?.color
                                ?.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          width: double.infinity,
                          height: screenHeight * 0.2,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: theme.dividerColor),
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
                                    color: theme.colorScheme.primary
                                        .withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    color: theme.colorScheme.primary,
                                    size: screenWidth * 0.08,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Doctor Avatar
            Positioned(
              top: screenHeight * 0.16 - (screenWidth * 0.14),
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
                        color: theme.colorScheme.primary.withOpacity(0.6),
                      ),
                      child: ClipOval(
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.16,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: screenWidth * 0.01,
                      right: screenWidth * 0.01,
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.005),
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.065,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top App Bar Buttons
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopBarButton(
                      Icons.arrow_back,
                      () => Navigator.pop(context),
                      screenWidth,
                    ),
                    Row(
                      children: [
                        _buildTopBarButton(Icons.share, () {}, screenWidth),
                        SizedBox(width: screenWidth * 0.03),
                        _buildTopBarButton(Icons.favorite, () {}, screenWidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
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

  Widget _buildTopBarButton(
    IconData icon,
    VoidCallback onPressed,
    double screenWidth,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: screenWidth * 0.055),
        onPressed: onPressed,
      ),
    );
  }

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
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
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
