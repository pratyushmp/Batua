import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Color primary_color = const Color(0xFFf5f6fb);
// ignore: non_constant_identifier_names
Color secondary_color = const Color(0xFF4731ee);
// ignore: non_constant_identifier_names
Color text_accent_primary = const Color(0xFF8E94AD);
// ignore: non_constant_identifier_names
Color text_accent_secondary = const Color(0xFFDBDEEB);
// ignore: non_constant_identifier_names
Color textField_color2 = const Color(0x42000000).withOpacity(0.05);
// ignore: non_constant_identifier_names
Color textField_color = Colors.grey.withOpacity(0.10);

InputDecoration inputDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Color(0x42000000),
  ),
  fillColor: textField_color,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: textField_color),
    borderRadius: BorderRadius.circular(20.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: textField_color2),
    borderRadius: BorderRadius.circular(20.0),
  ),
);

class RouteConstants {
  static const LOGIN_SCREEN = '/login-screen';
  static const USER_DETAIL_SCREEN = '/user-detail-screen';
  static const SIGNUP_SCREEN = '/signup-screen';
  static const HOME_SCREEN = '/home-screen';
  static const AUTH_WRAPPER = '/auth-wrapper';
  static const createGoalPage = '/create-goal-page';
  static const SettingsScreen = '/settings-screen';
}
