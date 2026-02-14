import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header with Profile and Notification
            _buildHeader(context, screenWidth, screenHeight),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.025),

                      // Upcoming Appointment Section
                      _buildSectionHeader(
                        "Upcoming Appointment",
                        "View All",
                        screenWidth,
                      ),

                      SizedBox(height: screenHeight * 0.015),

                      _buildAppointmentCard(screenWidth, screenHeight),

                      SizedBox(height: screenHeight * 0.03),

                      // Map Section
                      _buildSectionHeader("Nearby Cabinets", "", screenWidth),

                      SizedBox(height: screenHeight * 0.015),

                      _buildMapContainer(context, screenWidth, screenHeight),

                      SizedBox(height: screenHeight * 0.03),
                    ],
                  ),
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
    return Container(
      margin: EdgeInsets.all(screenHeight * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Profile Circle
          Container(
            width: screenWidth * 0.13,
            height: screenWidth * 0.13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(color: AppColors.blue, width: 2),
            ),
            child: Icon(
              Icons.person,
              color: AppColors.blue,
              size: screenWidth * 0.07,
            ),
          ),

          SizedBox(width: screenWidth * 0.03),

          // Name and Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'GOOD MORNING',
                  style: TextStyle(
                    fontSize: screenWidth * 0.028,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.003),
                Text(
                  'Medelci Aymen',
                  style: TextStyle(
                    fontSize: screenWidth * 0.048,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),

          // Notification Button
          Container(
            width: screenWidth * 0.11,
            height: screenWidth * 0.11,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: screenWidth * 0.06,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                // Notification Badge
                Positioned(
                  top: screenWidth * 0.018,
                  right: screenWidth * 0.018,
                  child: Container(
                    width: screenWidth * 0.025,
                    height: screenWidth * 0.025,
                    decoration: BoxDecoration(
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
        TextButton(
          onPressed: () {},
          child: Text(
            action,
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentCard(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.045),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Doctor Image
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.teal[100]!, width: 3),
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.teal[300],
                  size: screenWidth * 0.08,
                ),
              ),
              SizedBox(width: screenWidth * 0.035),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Abdou Hadjou',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      'cardiologue • Clinique Les Oliviers',
                      style: TextStyle(
                        fontSize: screenWidth * 0.034,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.018),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.035),
            decoration: BoxDecoration(
              color: AppColors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.022),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    size: screenWidth * 0.045,
                    color: AppColors.blue,
                  ),
                ),
                SizedBox(width: screenWidth * 0.025),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today, 10:30 AM',
                      style: TextStyle(
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Consultation',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.018),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.017,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Check your appointment',
                    style: TextStyle(
                      fontSize: screenWidth * 0.034,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                flex: 2,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red[500],
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.017,
                    ),
                    side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'annuler ',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapContainer(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      height: screenHeight * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Map placeholder with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.blue[100]!,
                    AppColors.blue[200]!,
                    AppColors.teal[100]!,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: screenWidth * 0.15,
                      color: Colors.blue[700],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Cabinet Map',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'View cabinets around you',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Location markers simulation
            Positioned(
              top: screenHeight * 0.08,
              left: screenWidth * 0.15,
              child: _buildMapMarker(screenWidth, AppColors.red),
            ),
            Positioned(
              top: screenHeight * 0.15,
              right: screenWidth * 0.2,
              child: _buildMapMarker(screenWidth, AppColors.blue),
            ),
            Positioned(
              bottom: screenHeight * 0.1,
              left: screenWidth * 0.25,
              child: _buildMapMarker(screenWidth, AppColors.teal),
            ),

            // View All Button at bottom
            Positioned(
              bottom: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to full map page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.blue,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined, size: screenWidth * 0.05),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'View Full Map',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
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

  Widget _buildMapMarker(double screenWidth, Color color) {
    return Container(
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
    );
  }
}
