import 'package:firebase_auth/firebase_auth.dart';

class LoginUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to log in with email and password
  Future<String?> login(String email, String password) async {
    try {
      // Attempt to sign in
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Return null for success
    } on FirebaseAuthException {
      // Return a custom error message for any authentication exception
      return 'Incorrect Email or Password.';
    } catch (e) {
      // Catch any unexpected error and return a generic message
      return 'An unexpected error occurred. Please try again later.';
    }
  }
}
