import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(result.user!.uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'role': 'user',
      'registrationDateTime': FieldValue.serverTimestamp(),
    });

    return result;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}