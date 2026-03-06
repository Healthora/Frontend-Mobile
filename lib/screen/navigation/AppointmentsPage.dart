import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';

class Appointmentspage extends StatefulWidget {
  const Appointmentspage({super.key});

  @override
  State<Appointmentspage> createState() => _AppointmentspageState();
}

class _AppointmentspageState extends State<Appointmentspage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTab = _tabController.index;
      });
    });
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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,

        title: Text(
          'Mes Rendez-vous',
          style: TextStyle(
            color: isDark ? AppColors.white : AppColors.black,
            fontSize: screenWidth * 0.048,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: theme.colorScheme.surface,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.015,
            ),
            child: Row(
              children: [
                _buildTab('À venir', 0, screenWidth, isDark),
                SizedBox(width: screenWidth * 0.03),
                _buildTab('Passés', 1, screenWidth, isDark),
                SizedBox(width: screenWidth * 0.03),
                _buildTab('Annulés', 2, screenWidth, isDark),
              ],
            ),
          ),

          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpcomingAppointments(context, screenWidth, screenHeight),
                _buildPastAppointments(context, screenWidth, screenHeight),
                _buildCancelledAppointments(context, screenWidth, screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // TAB BUTTON
  // ============================================================================

  Widget _buildTab(String title, int index, double screenWidth, bool isDark) {
    final isSelected = _selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.025),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue[50] : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.036,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? AppColors.blue
                  : (isDark ? AppColors.grey[400] : AppColors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // UPCOMING APPOINTMENTS
  // ============================================================================

  Widget _buildUpcomingAppointments(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CETTE SEMAINE
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05,
              screenHeight * 0.02,
              screenWidth * 0.05,
              screenHeight * 0.015,
            ),
            child: Text(
              'CETTE SEMAINE',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w600,
                color: AppColors.grey[400],
                letterSpacing: 0.5,
              ),
            ),
          ),

          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Jean Dupont',
            specialty: 'Cardiologue',
            date: '12 Oct. 2023',
            time: '14:30',
            badge: 'AUJOURD\'HUI',
            badgeColor: AppColors.blue,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),

          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Sarah Lavoie',
            specialty: 'Généraliste',
            date: '13 Oct. 2023',
            time: '09:00',
            badge: 'DEMAIN',
            badgeColor: AppColors.grey[400]!,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),

          // LA SEMAINE PROCHAINE
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05,
              screenHeight * 0.025,
              screenWidth * 0.05,
              screenHeight * 0.015,
            ),
            child: Text(
              'LA SEMAINE PROCHAINE',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w600,
                color: AppColors.grey[400],
                letterSpacing: 0.5,
              ),
            ),
          ),

          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Marc Morel',
            specialty: 'Ophtalmologue',
            date: '19 Oct. 2023',
            time: '11:15',
            badge: null,
            badgeColor: null,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),

          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  // ============================================================================
  // PAST APPOINTMENTS
  // ============================================================================

  Widget _buildPastAppointments(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05,
              screenHeight * 0.02,
              screenWidth * 0.05,
              screenHeight * 0.015,
            ),
            child: Text(
              'OCTOBRE 2023',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w600,
                color: AppColors.grey[400],
                letterSpacing: 0.5,
              ),
            ),
          ),

          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Ahmed Benali',
            specialty: 'Pédiatre',
            date: '05 Oct. 2023',
            time: '10:00',
            badge: null,
            badgeColor: null,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            isPast: true,
          ),

          _buildAppointmentCard(
            context: context,
            doctorName: 'Dr. Emma Wilson',
            specialty: 'Dermatologue',
            date: '02 Oct. 2023',
            time: '15:30',
            badge: null,
            badgeColor: null,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            isPast: true,
          ),

          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  // ============================================================================
  // CANCELLED APPOINTMENTS
  // ============================================================================

  Widget _buildCancelledAppointments(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: screenWidth * 0.2,
              color: AppColors.grey[300],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Aucun rendez-vous annulé',
              style: TextStyle(
                fontSize: screenWidth * 0.042,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Vos rendez-vous annulés apparaîtront ici',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: isDark ? AppColors.grey[400] : AppColors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // APPOINTMENT CARD
  // ============================================================================

  Widget _buildAppointmentCard({
    required BuildContext context,
    required String doctorName,
    required String specialty,
    required String date,
    required String time,
    required String? badge,
    required Color? badgeColor,
    required double screenWidth,
    required double screenHeight,
    bool isPast = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.008,
      ),
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
        children: [
          // Doctor Info Row
          Row(
            children: [
              // Doctor Avatar
              Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : AppColors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Icon(
                    Icons.person,
                    size: screenWidth * 0.06,
                    color: isDark ? AppColors.grey[300] : AppColors.grey[400],
                  ),
                ),
              ),

              SizedBox(width: screenWidth * 0.03),

              // Doctor Name and Specialty
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.042,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.003),
                    Text(
                      specialty,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: isDark
                            ? AppColors.grey[400]
                            : AppColors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Badge (AUJOURD'HUI, DEMAIN)
              if (badge != null)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.025,
                    vertical: screenHeight * 0.006,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      fontSize: screenWidth * 0.028,
                      fontWeight: FontWeight.w600,
                      color: badgeColor,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Date and Time Row
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: screenWidth * 0.04,
                color: AppColors.blue,
              ),
              SizedBox(width: screenWidth * 0.015),
              Text(
                date,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: isDark ? AppColors.grey[300] : AppColors.grey[700],
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Icon(
                Icons.access_time,
                size: screenWidth * 0.04,
                color: AppColors.blue,
              ),
              SizedBox(width: screenWidth * 0.015),
              Text(
                time,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: isDark ? AppColors.grey[300] : AppColors.grey[700],
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Action Buttons
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _showCancelDialog(context, doctorName);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark
                        ? AppColors.grey[300]
                        : AppColors.grey[700],
                    side: BorderSide(
                      color: isDark ? Colors.grey[700]! : AppColors.grey[300]!,
                      width: 1.5,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.014,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Annuler',
                    style: TextStyle(
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(width: screenWidth * 0.03),

              // View Details Button
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    _showDetailsDialog(
                      context,
                      doctorName,
                      specialty,
                      date,
                      time,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.014,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Voir détails',
                    style: TextStyle(
                      fontSize: screenWidth * 0.036,
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

  // ============================================================================
  // DIALOGS
  // ============================================================================

  void _showCancelDialog(BuildContext context, String doctorName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Annuler le rendez-vous'),
        content: Text(
          'Êtes-vous sûr de vouloir annuler votre rendez-vous avec $doctorName ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Non', style: TextStyle(color: AppColors.grey[600])),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rendez-vous annulé'),
                  backgroundColor: AppColors.red,
                ),
              );
            },
            child: const Text(
              'Oui, annuler',
              style: TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailsDialog(
    BuildContext context,
    String doctorName,
    String specialty,
    String date,
    String time,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Détails du rendez-vous'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Médecin: $doctorName'),
            const SizedBox(height: 8),
            Text('Spécialité: $specialty'),
            const SizedBox(height: 8),
            Text('Date: $date'),
            const SizedBox(height: 8),
            Text('Heure: $time'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}
