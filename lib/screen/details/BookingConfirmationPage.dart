import 'package:flutter/material.dart';
import 'package:medical/screen/navigation/Navigation_Bar.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Map<String, dynamic>? doctor;
  final String date;
  final String time;

  const BookingConfirmationPage({
    super.key,
    this.doctor,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final docName = doctor?['name'] ?? 'Dr. Sarah Martin';
    final docSpecialty = doctor?['specialty'] ?? 'OPHTALMOLOGUE';
    final docLocation =
        doctor?['location'] ??
        'Cabinet Médical, 12 rue de la Paix, 75002 Paris';

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: theme.iconTheme.color,
            size: screenWidth * 0.06,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Navigation_Bar()),
              (route) => false,
            );
          },
        ),
        title: Text(
          'Confirmation',
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: screenWidth * 0.08,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                'Rendez-vous confirmé !',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                'Votre consultation a bien été enregistrée. Un email de confirmation vous a été envoyé.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primary.withOpacity(0.1),
                            ),
                            child: Icon(
                              Icons.person,
                              color: theme.colorScheme.primary,
                              size: screenWidth * 0.08,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  docName,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: theme.textTheme.bodyLarge?.color,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  docSpecialty.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, thickness: 1, color: theme.dividerColor),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            Icons.calendar_today,
                            'DATE ET HEURE',
                            '$date • $time',
                            screenWidth,
                            screenHeight,
                            theme,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          _buildDetailRow(
                            Icons.location_on,
                            'LIEU',
                            docLocation,
                            screenWidth,
                            screenHeight,
                            theme,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          _buildDetailRow(
                            Icons.medical_services_outlined,
                            'TYPE DE CONSULTATION',
                            'En cabinet',
                            screenWidth,
                            screenHeight,
                            theme,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF2C3E50)
                            : const Color(0xFFE5E5E5),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: CustomPaint(
                              size: Size.infinite,
                              painter: _ConfirmationMapPainter(
                                color: isDark
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.blue.withOpacity(0.05),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: theme.colorScheme.primary,
                            size: screenWidth * 0.08,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Appointments Tab logic here if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    foregroundColor: theme.textTheme.bodyLarge?.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Voir mes rendez-vous',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Navigation_Bar(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(
                  Icons.home,
                  color: theme.colorScheme.primary,
                  size: screenWidth * 0.05,
                ),
                label: Text(
                  'Retour à l\'accueil',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String title,
    String value,
    double screenWidth,
    double screenHeight,
    ThemeData theme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: screenWidth * 0.045,
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.028,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                value,
                style: TextStyle(
                  fontSize: screenWidth * 0.038,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfirmationMapPainter extends CustomPainter {
  final Color color;
  _ConfirmationMapPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    for (var i = 0.0; i < size.width; i += 30) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += 30) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
