

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  
  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

  // Create a credential from the access token
  final facebookAuthCredential = FacebookAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}


  Future<void> signOutFB() async {
    await FacebookAuth.instance.logOut();
  }
}
