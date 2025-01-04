import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle login
  Future<User?> login(String email, String password, BuildContext context) async {
    try {
      // Sign in the user with Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the login is successful
      if (userCredential.user != null) {
        return userCredential.user; // Return the user on successful login
      }
    } catch (e) {
      // Show an error if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
    return null; // Return null if login fails
  }

  // Optionally, a function to log out
  Future<void> logout() async {
    await _auth.signOut();
  }
}
