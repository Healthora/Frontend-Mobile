import 'package:flutter/material.dart';
import 'package:medical/screen/details/BookingConfirmationPage.dart';

class BookingPage extends StatefulWidget {
  final Map<String, dynamic>? doctor;

  const BookingPage({super.key, this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedDateIndex = 1;
  int _selectedTimeIndex = 2;

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
              color: theme.colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: theme.iconTheme.color,
                size: screenWidth * 0.05,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          docName,
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color,
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
                color: theme.colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: theme.iconTheme.color,
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
                    color: theme.colorScheme.primary,
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
                      onTap: () => setState(() => _selectedDateIndex = index),
                      child: Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.03),
                        width: screenWidth * 0.16,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: theme.colorScheme.primary
                                        .withOpacity(0.3),
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
                                    ? theme.colorScheme.onPrimary.withOpacity(
                                        0.8,
                                      )
                                    : theme.textTheme.bodySmall?.color,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              _dates[index]['date']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: isSelected
                                    ? theme.colorScheme.onPrimary
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
              _buildSectionTitle(
                Icons.wb_sunny_outlined,
                Colors.orange,
                'Matin',
                theme,
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTimeGrid(_morningTimes, 0, screenWidth, isDark, theme),
              SizedBox(height: screenHeight * 0.03),
              _buildSectionTitle(
                Icons.wb_cloudy_outlined,
                theme.colorScheme.primary,
                'Après-midi',
                theme,
                screenWidth,
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
              Text(
                'Notes additionnelles',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildNoteField(theme, isDark, screenWidth),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(
        theme,
        isDark,
        screenWidth,
        screenHeight,
      ),
    );
  }

  Widget _buildSectionTitle(
    IconData icon,
    Color color,
    String title,
    ThemeData theme,
    double screenWidth,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: screenWidth * 0.05),
        SizedBox(width: screenWidth * 0.02),
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildNoteField(ThemeData theme, bool isDark, double screenWidth) {
    return Container(
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
        border: Border.all(color: theme.dividerColor),
      ),
      child: TextField(
        maxLines: 4,
        style: TextStyle(color: theme.textTheme.bodyLarge?.color),
        decoration: InputDecoration(
          hintText:
              'Ajouter une note pour le médecin (symptômes, antécédents...)',
          hintStyle: TextStyle(
            color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
            fontSize: screenWidth * 0.035,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(screenWidth * 0.04),
        ),
      ),
    );
  }

  Widget _buildBottomBar(
    ThemeData theme,
    bool isDark,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.dividerColor, width: 1.5)),
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
                        color: theme.textTheme.bodySmall?.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: theme.colorScheme.primary,
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmationPage(
                        doctor: widget.doctor,
                        date: '${_dates[_selectedDateIndex]['date']} Fév 2026',
                        time: _getAllTimes()[_selectedTimeIndex],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
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
    );
  }

  List<String> _getAllTimes() => [..._morningTimes, ..._afternoonTimes];

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
            if (!isUnavailable)
              setState(() => _selectedTimeIndex = globalIndex);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primary
                  : (isUnavailable
                        ? (isDark ? Colors.grey[800] : Colors.grey[100])
                        : theme.colorScheme.surface),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.dividerColor,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              timeStr,
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : (isUnavailable
                          ? theme.textTheme.bodySmall?.color?.withOpacity(0.5)
                          : theme.textTheme.bodyLarge?.color),
              ),
            ),
          ),
        );
      },
    );
  }
}
