import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.reference().child("Users");

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addData(String data) {
    databaseRef.push().set({'email': data});
  }

  Future<String> getuid()async{
    return _auth.currentUser.uid;
  }

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
              email: email, password: password)).user;
      //addData(user.email);

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
