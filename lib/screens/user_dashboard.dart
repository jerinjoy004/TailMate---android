import 'package:flutter/material.dart';

class NormalUserDashboard extends StatelessWidget {
  const NormalUserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          "Welcome to the User Dashboard",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
