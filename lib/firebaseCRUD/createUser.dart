import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String username,
    required String email,
    required String address,
    required String password,
  }) async {
    try {
      // Create user with Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = userCredential.user!.uid;

      // Store user details in Firestore
      await _firestore.collection('users').doc(userId).set({
        'username': username,
        'email': email,
        'password': password,
        'created_at': Timestamp.now(),
      });

      // Add the first address to a subcollection called 'addresses' with a custom key
      final addressCollection = _firestore
          .collection('users')
          .doc(userId)
          .collection('addresses');

      // Get the current count of addresses
      final snapshot = await addressCollection.get();
      final addressCount = snapshot.docs.length + 1; // Increment for new address

      // Add address as "address1", "address2", etc.
      await addressCollection.doc('address$addressCount').set({
        'address': address,
        'added_at': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error creating user: ${e.toString()}');
    }
  }

  // Function to add additional addresses for an existing user
  Future<void> addAddress({
    required String address,
    required String userId,
  }) async {
    try {
      // Reference to the addresses subcollection
      final addressCollection = _firestore
          .collection('users')
          .doc(userId)
          .collection('addresses');

      // Get the current count of addresses
      final snapshot = await addressCollection.get();
      final addressCount = snapshot.docs.length + 1; // Increment for new address

      // Add address as "address1", "address2", etc.
      await addressCollection.doc('address$addressCount').set({
        'address': address,
        'added_at': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error adding address: ${e.toString()}');
    }
  }
}
