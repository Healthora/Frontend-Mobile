import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';
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
      backgroundColor: theme.scaffoldBackgroundColor, // Couleur de fond légère
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
            // Retour à la page d'accueil par défaut
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

              // =====================================
              // ICÔNE DE SUCCÈS VERTE
              // =====================================
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.teal.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: const BoxDecoration(
                    color: AppColors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: screenWidth * 0.08,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // =====================================
              // TITRE DE SUCCÈS
              // =====================================
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
                  color: AppColors.grey[600],
                  height: 1.5,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // =====================================
              // CARTE DÉTAILS DU RENDEZ-VOUS
              // =====================================
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
                    // --- PARTIE HAUT : INFO MEDECIN ---
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blue[100],
                            ),
                            child: Icon(
                              Icons.person,
                              color: AppColors.blue,
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
                                    color: AppColors.blue,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      height: 1,
                      thickness: 1,
                      color: isDark ? Colors.grey[800] : AppColors.grey[100],
                    ),

                    // --- PARTIE MILIEU : DATE, LIEU, TYPE ---
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
                            isDark,
                            theme,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          _buildDetailRow(
                            Icons.location_on,
                            'LIEU',
                            docLocation,
                            screenWidth,
                            screenHeight,
                            isDark,
                            theme,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          _buildDetailRow(
                            Icons.medical_services_outlined,
                            'TYPE DE CONSULTATION',
                            'En cabinet',
                            screenWidth,
                            screenHeight,
                            isDark,
                            theme,
                          ),
                        ],
                      ),
                    ),

                    // --- PARTIE BAS : CARTE GEOGRAPHIQUE ---
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF2C3E50)
                            : const Color(
                                0xFFE5E5E5,
                              ), // Fond gris clair pour la map
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Quadrillage Map Placeholder
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: CustomPaint(
                              size: Size.infinite,
                              painter: _ConfirmationMapPainter(),
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: AppColors.blue,
                            size: screenWidth * 0.08,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // =====================================
              // BOUTONS D'ACTION
              // =====================================

              // Bouton Ajouter au calendrier
              SizedBox(height: screenHeight * 0.015),

              // Bouton Voir mes rendez-vous
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Appointments Tab
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? Colors.grey[800]
                        : AppColors.grey[200],
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
                  color: AppColors.blue,
                  size: screenWidth * 0.05,
                ),
                label: Text(
                  'Retour à l\'accueil',
                  style: TextStyle(
                    color: AppColors.blue,
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
    bool isDark,
    ThemeData theme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : AppColors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isDark ? AppColors.grey[300] : AppColors.grey[700],
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
                  color: AppColors.grey[500],
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
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.05)
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
