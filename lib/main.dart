import 'package:batua/Screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:batua/utils/constants.dart';

void main() {
  runApp(Batua());
}

class Batua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Batua',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: login());
  }
}
