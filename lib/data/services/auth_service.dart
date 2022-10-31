import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_auth.currentUser != null) {
        return _auth.currentUser!;
      } else {
        throw Exception('User is null');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception(
            'Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email.');
      } else if (e.code == 'user-disabled') {
        throw Exception('User disabled.');
      }
      throw Exception(e.message);
    }
  }

  Future<User> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_auth.currentUser != null) {
        return _auth.currentUser!;
      } else {
        throw Exception('User is null');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception(
            'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email.');
      }
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
