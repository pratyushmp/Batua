import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      if (user.emailVerified) {
        return true;
      } else {
        FirebaseAuth.instance.signOut();
        return false;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<dynamic> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      // Email Verification Sending
      user.sendEmailVerification();

      // Without that: If user sign up and close this app and then reopen the app,
      // Without verified log-in user navigate to the home page
      FirebaseAuth.instance.signOut();

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
