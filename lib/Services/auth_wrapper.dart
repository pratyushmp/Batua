import 'package:batua/UI/home_screen.dart';
import 'package:batua/UI/home_view.dart';
import 'package:batua/UI/login_screen.dart';
import 'package:batua/UI/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Login screen
    if (user == null) {
      return HomeScreen();
    } else {
      return Myprofile();
    }
  }
}
