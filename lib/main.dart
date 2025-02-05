import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens/login.dart';
import 'screens/user_dashboard.dart';
import 'screens/volunteer_dashboard.dart';
import 'screens/doctor_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TailMate',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: AuthHandler(), // 🔥 Handles Authentication Persistence
    );
  }
}

class AuthHandler extends StatelessWidget {
  const AuthHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData && snapshot.data != null) {
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(snapshot.data!.uid)
                .get(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (userSnapshot.hasData && userSnapshot.data!.exists) {
                String userType = userSnapshot.data!['userType'];

                if (userType == "Volunteer") {
                  return VolunteerDashboard();
                } else if (userType == "Doctor") {
                  return DoctorDashboard();
                } else {
                  return NormalUserDashboard();
                }
              } else {
                return const LoginPage(); // User type unknown, redirect to login
              }
            },
          );
        }

        return const LoginPage(); // Not signed in, show login
      },
    );
  }
}
