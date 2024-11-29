import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Import FirebaseAuth
import 'screens/login_screen.dart';  // Path to Login Screen
import 'screens/home_screen.dart';   // Path to Home Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthCheck(), // Handle navigation based on auth status
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is signed in when the app starts
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());  // Show a loading spinner
        }
        if (snapshot.hasData) {
          // If user is signed in, navigate to the Home Screen
          return HomeScreen();
        } else {
          // If user is not signed in, navigate to the Login Screen
          return LoginScreen();
        }
      },
    );
  }
}
