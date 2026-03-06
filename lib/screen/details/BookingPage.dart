import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';
import 'package:medical/screen/details/BookingConfirmationPage.dart';

class BookingPage extends StatefulWidget {
  final Map<String, dynamic>? doctor;

  const BookingPage({super.key, this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedDateIndex = 1; // "Mar 15" selectionné par défaut par exemple
  int _selectedTimeIndex = 2; // "09:00" selectionné par défaut par exemple

  final List<Map<String, String>> _dates = [
    {'day': 'Lun', 'date': '14'},
    {'day': 'Mar', 'date': '15'},
    {'day': 'Mer', 'date': '16'},
    {'day': 'Jeu', 'date': '17'},
    {'day': 'Ven', 'date': '18'},
    {'day': 'Sam', 'date': '19'},
    {'day': 'Dim', 'date': '20'},
  ];

  final List<String> _morningTimes = [
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
  ];

  final List<String> _afternoonTimes = [
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
  ];

  // Simulation d'horaires indisponibles
  final List<String> _unavailableTimes = ['10:30', '15:30'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final docName = widget.doctor?['name'] ?? 'Dr. Jean Martin';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: screenWidth * 0.05,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          docName,
          style: TextStyle(
            color: isDark ? AppColors.white : AppColors.black,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: AppColors.black,
                  size: screenWidth * 0.05,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //==============================================
              // DATE SELECTOR
              //==============================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Février 2026',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: AppColors.blue,
                    size: screenWidth * 0.055,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              SizedBox(
                height: screenHeight * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dates.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedDateIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.03),
                        width: screenWidth * 0.16,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.blue
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.blue.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                      isDark ? 0.3 : 0.03,
                                    ),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _dates[index]['day']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: isSelected
                                    ? AppColors.white.withOpacity(0.8)
                                    : AppColors.grey[500],
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              _dates[index]['date']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: isSelected
                                    ? AppColors.white
                                    : theme.textTheme.bodyLarge?.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              //==============================================
              // TIME SELECTOR
              //==============================================
              Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.orange,
                    size: screenWidth * 0.05,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Matin',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTimeGrid(_morningTimes, 0, screenWidth, isDark, theme),

              SizedBox(height: screenHeight * 0.03),

              Row(
                children: [
                  Icon(
                    Icons.wb_cloudy_outlined,
                    color: AppColors.blue,
                    size: screenWidth * 0.05,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Après-midi',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTimeGrid(
                _afternoonTimes,
                _morningTimes.length,
                screenWidth,
                isDark,
                theme,
              ),

              SizedBox(height: screenHeight * 0.04),

              //==============================================
              // NOTES ADDITIONNELLES
              //==============================================
              Text(
                'Notes additionnelles',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2C3E50) : AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  maxLines: 4,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  decoration: InputDecoration(
                    hintText:
                        'Ajouter une note pour le médecin (symptômes, antécédents...)',
                    hintStyle: TextStyle(
                      color: AppColors.grey[400],
                      fontSize: screenWidth * 0.035,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(screenWidth * 0.04),
                  ),
                ),
              ),

              SizedBox(
                height: screenHeight * 0.1,
              ), // Espacement pour le bouttom bar
            ],
          ),
        ),
      ),

      //==============================================
      // BOTTOM BAR CONFIRMATION
      //==============================================
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.grey[800]! : AppColors.grey[200]!,
              width: 1.5,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date & Heure',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: AppColors.grey[500],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.blue,
                            size: screenWidth * 0.04,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            '${_dates[_selectedDateIndex]['day']} ${_dates[_selectedDateIndex]['date']} Fév. à ${_getAllTimes()[_selectedTimeIndex]}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    // Aller à la page de confirmation
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingConfirmationPage(
                          doctor: widget.doctor,
                          date:
                              '${_dates[_selectedDateIndex]['date']} Fév 2026',
                          time: _getAllTimes()[_selectedTimeIndex],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Confirmer le rendez-vous',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _getAllTimes() {
    return [..._morningTimes, ..._afternoonTimes];
  }

  Widget _buildTimeGrid(
    List<String> times,
    int offsetIndex,
    double screenWidth,
    bool isDark,
    ThemeData theme,
  ) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.2,
        crossAxisSpacing: screenWidth * 0.02,
        mainAxisSpacing: screenWidth * 0.03,
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final globalIndex = offsetIndex + index;
        final timeStr = times[index];
        final isUnavailable = _unavailableTimes.contains(timeStr);
        final isSelected = _selectedTimeIndex == globalIndex && !isUnavailable;

        return GestureDetector(
          onTap: () {
            if (!isUnavailable) {
              setState(() {
                _selectedTimeIndex = globalIndex;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.blue
                  : (isUnavailable
                        ? (isDark ? Colors.grey[800] : AppColors.grey[100])
                        : theme.colorScheme.surface),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.blue
                    : (isUnavailable
                          ? Colors.transparent
                          : (isDark
                                ? Colors.grey[700]!
                                : AppColors.grey[200]!)),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              timeStr,
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected
                    ? AppColors.white
                    : (isUnavailable
                          ? AppColors.grey[500]
                          : theme.textTheme.bodyLarge?.color),
              ),
            ),
          ),
        );
      },
    );
  }
}
