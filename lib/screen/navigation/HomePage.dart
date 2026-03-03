import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(context, screenWidth, screenHeight),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    // Quick Stats Cards
                    _buildQuickStats(screenWidth, screenHeight),

                    SizedBox(height: screenHeight * 0.025),

                    // Upcoming Appointment Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader(
                            'Prochain Rendez-vous',
                            'Voir tout',
                            screenWidth,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          _buildAppointmentCard(screenWidth, screenHeight),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Recommended Doctors Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: _buildSectionHeader(
                            'Médecins Recommandés',
                            'Voir tout',
                            screenWidth,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        _buildRecommendedDoctors(screenWidth, screenHeight),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Nearby Cabinets Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader(
                            'Cabinets Proches',
                            'Voir la carte',
                            screenWidth,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          _buildNearbyCabinets(screenWidth, screenHeight),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // HEADER SECTION
  // ============================================================================

  Widget _buildHeader(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.04),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.018,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: AppColors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: AppColors.blue,
              size: screenWidth * 0.06,
            ),
          ),

          SizedBox(width: screenWidth * 0.03),

          // Greeting and Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bonjour',
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    color: AppColors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Text(
                  'Medelci Aymen',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon
          Container(
            width: screenWidth * 0.11,
            height: screenWidth * 0.11,
            decoration: BoxDecoration(
              color: AppColors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: screenWidth * 0.055,
                    color: AppColors.grey[700],
                  ),
                ),
                // Notification Badge
                Positioned(
                  top: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  child: Container(
                    width: screenWidth * 0.022,
                    height: screenWidth * 0.022,
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // QUICK STATS SECTION
  // ============================================================================

  Widget _buildQuickStats(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: Icons.event_available,
              title: 'Rendez-vous',
              value: '12',
              color: AppColors.blue,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: _buildStatCard(
              icon: Icons.medical_services_outlined,
              title: 'Prescriptions',
              value: '5',
              color: AppColors.teal,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.025),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: screenWidth * 0.055),
          ),
          SizedBox(height: screenHeight * 0.012),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.065,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.002),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: AppColors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // SECTION HEADER
  // ============================================================================

  Widget _buildSectionHeader(String title, String action, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.048,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        if (action.isNotEmpty)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenWidth * 0.01,
              ),
            ),
            child: Text(
              action,
              style: TextStyle(
                fontSize: screenWidth * 0.036,
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  // ============================================================================
  // APPOINTMENT CARD
  // ============================================================================

  Widget _buildAppointmentCard(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Doctor Info
          Row(
            children: [
              Container(
                width: screenWidth * 0.14,
                height: screenWidth * 0.14,
                decoration: BoxDecoration(
                  color: AppColors.blue[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.blue,
                  size: screenWidth * 0.07,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Abdou Hadjou',
                      style: TextStyle(
                        fontSize: screenWidth * 0.042,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      'Cardiologue',
                      style: TextStyle(
                        fontSize: screenWidth * 0.034,
                        color: AppColors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Appointment Details
          Container(
            padding: EdgeInsets.all(screenWidth * 0.035),
            decoration: BoxDecoration(
              color: AppColors.blue[50],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: screenWidth * 0.045,
                  color: AppColors.blue,
                ),
                SizedBox(width: screenWidth * 0.025),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aujourd\'hui, 10h30',
                        style: TextStyle(
                          fontSize: screenWidth * 0.036,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        'Consultation',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: AppColors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Détails',
                    style: TextStyle(
                      fontSize: screenWidth * 0.032,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // RECOMMENDED DOCTORS SECTION
  // ============================================================================

  Widget _buildRecommendedDoctors(double screenWidth, double screenHeight) {
    final doctors = [
      {
        'name': 'Dr. Abdou Hadjou',
        'specialty': 'Cardiologue',
        'location': 'Kiffan',
        'rating': 4.9,
        'reviews': 120,
        'distance': '1.2 km',
        'availability': 'Disponible demain',
        'availabilityColor': AppColors.teal,
      },
      {
        'name': 'Dr. Sarah Mansour',
        'specialty': 'Cardiologue',
        'location': 'IMAMA',
        'rating': 4.8,
        'reviews': 84,
        'distance': '0.8 km',
        'availability': 'Disponible aujourd\'hui',
        'availabilityColor': AppColors.teal,
      },
      {
        'name': 'Dr. Marc Lefebvre',
        'specialty': 'Cardiologue',
        'location': 'Boulogne',
        'rating': 5.0,
        'reviews': 210,
        'distance': '2.5 km',
        'availability': 'Dispo le 24 Mai',
        'availabilityColor': AppColors.grey[500]!,
      },
    ];

    return SizedBox(
      height: screenHeight * 0.25, // Compact height for square cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          final isLast = index == doctors.length - 1;
          return Container(
            width: screenWidth * 0.52,
            margin: EdgeInsets.only(right: isLast ? 0 : screenWidth * 0.03),
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Avatar + Rating
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.13,
                      height: screenWidth * 0.13,
                      decoration: BoxDecoration(
                        color: AppColors.blue[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: AppColors.blue,
                        size: screenWidth * 0.065,
                      ),
                    ),
                    const Spacer(),
                    // Rating badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenWidth * 0.008,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: screenWidth * 0.035,
                            color: Colors.amber[700],
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            '${doctor['rating']}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.012),

                // Doctor Name
                Text(
                  doctor['name'] as String,
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: screenHeight * 0.003),

                // Specialty
                Text(
                  doctor['specialty'] as String,
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    color: AppColors.grey[600],
                  ),
                ),

                SizedBox(height: screenHeight * 0.006),

                // Location + Distance
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: screenWidth * 0.033,
                      color: AppColors.grey[400],
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Text(
                        '${doctor['location']} • ${doctor['distance']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.029,
                          color: AppColors.grey[500],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Availability Badge
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
                  decoration: BoxDecoration(
                    color: (doctor['availabilityColor'] as Color).withOpacity(
                      0.1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    doctor['availability'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.028,
                      fontWeight: FontWeight.w600,
                      color: doctor['availabilityColor'] as Color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ============================================================================
  // NEARBY CABINETS SECTION - MAP VIEW
  // ============================================================================

  Widget _buildNearbyCabinets(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight * 0.28,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Map Background with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.blue[50]!,
                    AppColors.blue[100]!,
                    AppColors.teal[50]!,
                  ],
                ),
              ),
            ),

            // Map Grid Pattern (optional, for visual effect)
            Positioned.fill(child: CustomPaint(painter: _MapGridPainter())),

            // Cabinet Markers
            Positioned(
              top: screenHeight * 0.06,
              left: screenWidth * 0.15,
              child: _buildCabinetMarker(
                'Clinique Les Oliviers',
                '1.2 km',
                screenWidth,
                AppColors.blue,
              ),
            ),
            Positioned(
              top: screenHeight * 0.12,
              right: screenWidth * 0.18,
              child: _buildCabinetMarker(
                'Cabinet Dr. Mansouri',
                '2.5 km',
                screenWidth,
                AppColors.teal,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.08,
              left: screenWidth * 0.25,
              child: _buildCabinetMarker(
                'Centre Médical',
                '3.1 km',
                screenWidth,
                AppColors.blue,
              ),
            ),

            // Current Location Marker
            Positioned(
              top: screenHeight * 0.09,
              right: screenWidth * 0.35,
              child: Container(
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.red.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),

            // View Full Map Button
            Positioned(
              bottom: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to full map page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.014),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined, size: screenWidth * 0.045),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'Voir la carte complète',
                      style: TextStyle(
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Info Badge at Top
            Positioned(
              top: screenHeight * 0.015,
              left: screenWidth * 0.05,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.008,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: screenWidth * 0.04,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Text(
                      '3 Cabinets à proximité',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cabinet Marker Widget
  Widget _buildCabinetMarker(
    String name,
    String distance,
    double screenWidth,
    Color color,
  ) {
    return Column(
      children: [
        // Marker Pin
        Container(
          width: screenWidth * 0.08,
          height: screenWidth * 0.08,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.local_hospital,
            color: AppColors.white,
            size: screenWidth * 0.04,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        // Info Card
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenWidth * 0.01,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: screenWidth * 0.026,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                distance,
                style: TextStyle(
                  fontSize: screenWidth * 0.024,
                  color: AppColors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// MAP GRID PAINTER (for visual effect)
// ============================================================================

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    // Draw vertical lines
    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Draw horizontal lines
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
