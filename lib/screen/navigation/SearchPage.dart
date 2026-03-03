import 'package:flutter/material.dart';
import 'package:medical/Static/AppColors.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedLocation = 'Tlemcen';
  String _selectedDate = 'Aujourd\'hui';
  String _selectedPrice = 'reviews';
  String _selectedRating = 'specialité';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.grey[50],

      body: SafeArea(
        child: Column(
          children: [
            // Search Bar and Filters
            Container(
              color: AppColors.white,
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                children: [
                  // Search Bar
                  _buildSearchBar(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.05),
                  // Filters
                  _buildFilters(context, screenWidth, screenHeight),
                ],
              ),
            ),

            // Results Count
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '24 médecins trouvés',
                  style: TextStyle(
                    fontSize: screenWidth * 0.036,
                    color: AppColors.grey[600],
                  ),
                ),
              ),
            ),

            // Doctors List
            Expanded(child: _buildDoctorsList(screenWidth, screenHeight)),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // SEARCH BAR
  // ============================================================================

  Widget _buildSearchBar(double screenWidth, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey[200]!, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'rechercher un médecin',
          hintStyle: TextStyle(
            color: AppColors.grey[600],
            fontSize: screenWidth * 0.04,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
            size: screenWidth * 0.06,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.grey[400],
                    size: screenWidth * 0.05,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.015,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  // ============================================================================
  // FILTERS
  // ============================================================================

  Widget _buildFilters(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Location Filter
          _buildFilterChip(
            icon: Icons.location_on,
            label: _selectedLocation,
            color: AppColors.blue,
            screenWidth: screenWidth,
            onTap: () => _showLocationPicker(context),
          ),
          SizedBox(width: screenWidth * 0.02),
          // Date Filter
          _buildFilterChip(
            icon: null,
            label: _selectedDate,
            color: AppColors.grey[700]!,
            screenWidth: screenWidth,
            onTap: () => _showDatePicker(context),
          ),
          SizedBox(width: screenWidth * 0.02),
          // Price Filter
          _buildFilterChip(
            icon: null,
            label: _selectedPrice,
            color: AppColors.grey[700]!,
            screenWidth: screenWidth,
            onTap: () => _showPricePicker(context),
          ),
          SizedBox(width: screenWidth * 0.02),
          // Rating Filter
          _buildFilterChip(
            icon: null,
            label: _selectedRating,
            color: AppColors.grey[700]!,
            screenWidth: screenWidth,
            onTap: () => _showRatingPicker(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required IconData? icon,
    required String label,
    required Color color,
    required double screenWidth,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: icon != null ? color : AppColors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.white, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.01),
            ],
            Text(
              label,
              style: TextStyle(
                color: icon != null ? AppColors.white : AppColors.black,
                fontSize: screenWidth * 0.034,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            Icon(
              Icons.keyboard_arrow_down,
              color: icon != null ? AppColors.white : AppColors.black,
              size: screenWidth * 0.045,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // DOCTORS LIST
  // ============================================================================

  Widget _buildDoctorsList(double screenWidth, double screenHeight) {
    final doctors = [
      {
        'name': 'Dr. Jean Dupont',
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
      {
        'name': 'Dr. Emma Wilson',
        'specialty': 'Cardiologue',
        'location': 'Paris 16e',
        'rating': 4.7,
        'reviews': 95,
        'distance': '1.8 km',
        'availability': 'Disponible demain',
        'availabilityColor': AppColors.teal,
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return _buildDoctorCard(
          doctor as Map<String, dynamic>,
          screenWidth,
          screenHeight,
        );
      },
    );
  }

  // ============================================================================
  // DOCTOR CARD
  // ============================================================================

  Widget _buildDoctorCard(
    Map<String, dynamic> doctor,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Doctor Info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Avatar
              Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: screenWidth * 0.1,
                ),
              ),

              SizedBox(width: screenWidth * 0.03),

              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            doctor['name'] as String,
                            style: TextStyle(
                              fontSize: screenWidth * 0.042,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Text(
                          doctor['distance'] as String,
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: AppColors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      '${doctor['specialty']} • ${doctor['location']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.034,
                        color: AppColors.grey[600],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[700],
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '${doctor['rating']}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.034,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '(${doctor['reviews']} avis)',
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: AppColors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Availability and Button Row
          Row(
            children: [
              // Availability Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenHeight * 0.006,
                ),
                decoration: BoxDecoration(
                  color: (doctor['availabilityColor'] as Color).withOpacity(
                    0.1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: doctor['availabilityColor'] as Color,
                      size: screenWidth * 0.035,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      doctor['availability'] as String,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: doctor['availabilityColor'] as Color,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Book Appointment Button
              ElevatedButton(
                onPressed: () {
                  _showBookingDialog(context, doctor['name'] as String);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.012,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Prendre RDV',
                  style: TextStyle(
                    fontSize: screenWidth * 0.036,
                    fontWeight: FontWeight.w600,
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
  // FILTER DIALOGS
  // ============================================================================

  void _showLocationPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choisir une localisation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Tlemcen ', 'Sba', 'Oran', 'Alger', 'Moughnia'].map(
              (location) => ListTile(
                title: Text(location),
                onTap: () {
                  setState(() {
                    _selectedLocation = location;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Disponibilité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Aujourd\'hui', 'Demain', 'Cette semaine', 'Ce mois'].map(
              (date) => ListTile(
                title: Text(date),
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPricePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Fourchette de prix',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Tous', '< 50€', '50€ - 100€', '> 100€'].map(
              (price) => ListTile(
                title: Text(price),
                onTap: () {
                  setState(() {
                    _selectedPrice = price == 'Tous' ? 'Prix' : price;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRatingPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Note minimale',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Tous', '4.5+', '4.0+', '3.5+'].map(
              (rating) => ListTile(
                title: Text(rating),
                onTap: () {
                  setState(() {
                    _selectedRating = rating == 'Tous' ? 'Avis' : rating;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // BOOKING DIALOG
  // ============================================================================

  void _showBookingDialog(BuildContext context, String doctorName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Prendre rendez-vous'),
        content: Text('Réserver un rendez-vous avec $doctorName ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Annuler',
              style: TextStyle(color: AppColors.grey[600]),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rendez-vous réservé avec succès !'),
                  backgroundColor: AppColors.teal,
                ),
              );
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }
}
