import 'package:flutter/material.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  final _nameController = TextEditingController(text: 'Medelci Aymen');
  final _emailController = TextEditingController(
    text: 'aymenmedelci@email.com',
  );
  final _phoneController = TextEditingController(text: '+213 555 12 34 56');
  final _descriptionController = TextEditingController(
    text: 'Asthme léger, allergie au pollen.',
  );
  String _selectedGender = 'Homme';
  DateTime _selectedDate = DateTime(1998, 5, 15);
  final String _patientId = 'PAT-2026-X89Z';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              surface: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Informations Personnelles',
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Informations enregistrées')),
              );
            },
            child: Text(
              'Enregistrer',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
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
              // ID Badge
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.vpn_key_outlined,
                        size: screenWidth * 0.04,
                        color: theme.colorScheme.primary,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'ID patient : $_patientId',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              _buildFieldLabel('Nom Complet', screenWidth, theme),
              _buildTextField(
                _nameController,
                Icons.person_outline,
                theme,
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),

              _buildFieldLabel('Email', screenWidth, theme),
              _buildTextField(
                _emailController,
                Icons.email_outlined,
                theme,
                screenWidth,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: screenHeight * 0.02),

              _buildFieldLabel('Numéro de téléphone', screenWidth, theme),
              _buildTextField(
                _phoneController,
                Icons.phone_outlined,
                theme,
                screenWidth,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Genre', screenWidth, theme),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: theme.dividerColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedGender,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: ['Homme', 'Femme'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: theme.textTheme.bodyLarge?.color,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedGender = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel(
                          'Date de naissance',
                          screenWidth,
                          theme,
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: theme.dividerColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                                  style: TextStyle(
                                    color: theme.textTheme.bodyLarge?.color,
                                  ),
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: theme.colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              _buildFieldLabel(
                'Description des antécédents médicaux',
                screenWidth,
                theme,
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 4,
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontSize: screenWidth * 0.038,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Ajoutez une description...',
                    hintStyle: TextStyle(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label, double screenWidth, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * 0.032,
          fontWeight: FontWeight.w600,
          color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    IconData icon,
    ThemeData theme,
    double screenWidth, {
    TextInputType inputType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
          fontSize: screenWidth * 0.038,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: screenWidth * 0.05,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
