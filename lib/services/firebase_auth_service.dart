import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Register method (already defined in your code)
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;  // Returns a User? (nullable)
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }

  // Login method - add this method to handle login
  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;  // Returns a User? (nullable)
    } catch (e) {
      print("Error logging in user: $e");
      return null;
    }
  }
}
