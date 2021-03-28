import 'dart:convert' as JSON;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';




class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    final User user = authResult.user;
    print(user.uid);
    return authResult;
  }

  Future<void> signOutFB() async {
    await FacebookAuth.instance.logOut();
  }
}