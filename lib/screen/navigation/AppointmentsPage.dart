import 'package:flutter/material.dart';

class Appointmentspage extends StatefulWidget {
  const Appointmentspage({super.key});

  @override
  State<Appointmentspage> createState() => _AppointmentspageState();
}

class _AppointmentspageState extends State<Appointmentspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Appointments Page!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
