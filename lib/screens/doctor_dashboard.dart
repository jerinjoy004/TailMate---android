import 'package:flutter/material.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          "Welcome to the Doctor Dashboard",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
