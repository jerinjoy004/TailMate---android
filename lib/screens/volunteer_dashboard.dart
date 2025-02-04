import 'package:flutter/material.dart';

class VolunteerDashboard extends StatelessWidget {
  const VolunteerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volunteer Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          "Welcome to the Volunteer Dashboard",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
