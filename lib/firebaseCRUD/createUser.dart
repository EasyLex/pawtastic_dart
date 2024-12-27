import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After user is created, store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'password': password, // In real scenarios, hash the password
        'created_at': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error creating user: ${e.toString()}');
    }
  }
}
