import 'package:flutter/material.dart';
import 'package:medical/screen/details/DoctorDetailPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    _buildQuickStats(screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.025),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader(
                            context,
                            'Prochain Rendez-vous',
                            'Voir tout',
                            screenWidth,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          _buildAppointmentCard(
                            context,
                            screenWidth,
                            screenHeight,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: _buildSectionHeader(
                            context,
                            'Médecins Recommandés',
                            'Voir tout',
                            screenWidth,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        _buildRecommendedDoctors(
                          context,
                          screenWidth,
                          screenHeight,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader(
                            context,
                            'Cabinets Proches',
                            'Voir la carte',
                            screenWidth,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          _buildNearbyCabinets(
                            context,
                            screenWidth,
                            screenHeight,
                          ),
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

  Widget _buildHeader(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.04),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.018,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: theme.colorScheme.primary,
              size: screenWidth * 0.06,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bonjour',
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Text(
                  'Medelci Aymen',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.11,
            height: screenWidth * 0.11,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: screenWidth * 0.055,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  child: Container(
                    width: screenWidth * 0.022,
                    height: screenWidth * 0.022,
                    decoration: const BoxDecoration(
                      color: Colors.red,
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

  Widget _buildQuickStats(double screenWidth, double screenHeight) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.event_available,
                  title: 'Rendez-vous',
                  value: '12',
                  color: theme.colorScheme.primary,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.medical_services_outlined,
                  title: 'Prescriptions',
                  value: '5',
                  color: Colors.teal,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required double screenWidth,
    required double screenHeight,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
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
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: screenHeight * 0.002),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String action,
    double screenWidth,
  ) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.048,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        if (action.isNotEmpty)
          TextButton(
            onPressed: () {},
            child: Text(
              action,
              style: TextStyle(
                fontSize: screenWidth * 0.036,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: screenWidth * 0.14,
                height: screenWidth * 0.14,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: theme.colorScheme.primary,
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
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      'Cardiologue',
                      style: TextStyle(
                        fontSize: screenWidth * 0.034,
                        color: theme.textTheme.bodySmall?.color?.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.035),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: screenWidth * 0.045,
                  color: theme.colorScheme.primary,
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
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        'Consultation',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: theme.textTheme.bodySmall?.color?.withOpacity(
                            0.7,
                          ),
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
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Détails',
                    style: TextStyle(
                      fontSize: screenWidth * 0.032,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
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

  Widget _buildRecommendedDoctors(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final doctors = [
      {
        'name': 'Dr. Abdou Hadjou',
        'specialty': 'Cardiologue',
        'location': 'Kiffan',
        'rating': 4.9,
        'reviews': 120,
        'distance': '1.2 km',
        'availability': 'Disponible demain',
        'availabilityColor': Colors.teal,
      },
      {
        'name': 'Dr. Sarah Mansour',
        'specialty': 'Cardiologue',
        'location': 'IMAMA',
        'rating': 4.8,
        'reviews': 84,
        'distance': '0.8 km',
        'availability': 'Disponible aujourd\'hui',
        'availabilityColor': Colors.teal,
      },
      {
        'name': 'Dr. Marc Lefebvre',
        'specialty': 'Cardiologue',
        'location': 'Boulogne',
        'rating': 5.0,
        'reviews': 210,
        'distance': '2.5 km',
        'availability': 'Dispo le 24 Mai',
        'availabilityColor': Colors.grey,
      },
    ];

    return SizedBox(
      height: screenHeight * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          final isLast = index == doctors.length - 1;
          final availColor = doctor['availabilityColor'] as Color;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailPage(doctor: doctor),
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.52,
              margin: EdgeInsets.only(right: isLast ? 0 : screenWidth * 0.03),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.13,
                        height: screenWidth * 0.13,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.065,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenWidth * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
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
                  Text(
                    doctor['name'] as String,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Text(
                    doctor['specialty'] as String,
                    style: TextStyle(
                      fontSize: screenWidth * 0.032,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.006),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: screenWidth * 0.033,
                        color: theme.iconTheme.color?.withOpacity(0.4),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Expanded(
                        child: Text(
                          '${doctor['location']} • ${doctor['distance']}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.029,
                            color: theme.textTheme.bodySmall?.color
                                ?.withOpacity(0.6),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: availColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      doctor['availability'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.028,
                        fontWeight: FontWeight.w600,
                        color: availColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNearbyCabinets(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: screenHeight * 0.28,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary.withOpacity(isDark ? 0.2 : 0.05),
                    theme.colorScheme.primary.withOpacity(isDark ? 0.3 : 0.1),
                    Colors.teal.withOpacity(isDark ? 0.2 : 0.05),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: _MapGridPainter(
                  color: theme.colorScheme.primary.withOpacity(0.05),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.06,
              left: screenWidth * 0.15,
              child: _buildCabinetMarker(
                context,
                'Clinique Les Oliviers',
                '1.2 km',
                screenWidth,
                theme.colorScheme.primary,
              ),
            ),
            Positioned(
              top: screenHeight * 0.12,
              right: screenWidth * 0.18,
              child: _buildCabinetMarker(
                context,
                'Cabinet Dr. Mansouri',
                '2.5 km',
                screenWidth,
                Colors.teal,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.08,
              left: screenWidth * 0.25,
              child: _buildCabinetMarker(
                context,
                'Centre Médical',
                '3.1 km',
                screenWidth,
                theme.colorScheme.primary,
              ),
            ),
            Positioned(
              top: screenHeight * 0.09,
              right: screenWidth * 0.35,
              child: Container(
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
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
            Positioned(
              top: screenHeight * 0.015,
              left: screenWidth * 0.05,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.008,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
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
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Text(
                      '3 Cabinets à proximité',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyLarge?.color,
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

  Widget _buildCabinetMarker(
    BuildContext context,
    String name,
    String distance,
    double screenWidth,
    Color color,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.08,
          height: screenWidth * 0.08,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
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
            color: Colors.white,
            size: screenWidth * 0.04,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenWidth * 0.01,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
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
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                distance,
                style: TextStyle(
                  fontSize: screenWidth * 0.024,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final Color color;
  _MapGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
