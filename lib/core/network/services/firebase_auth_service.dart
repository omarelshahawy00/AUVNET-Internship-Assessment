import 'package:firebase_auth/firebase_auth.dart';

import 'package:nawel/core/errors/firebase_exp.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  
  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

}
