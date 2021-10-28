import 'package:batua/models/icon_item.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Color primary_color = const Color(0xFFf5f6fb);
Color lightVioletColor = const Color(0xff9d92f0);
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

MaterialColor primarySwatch = MaterialColor(
  primary_color.value,
  const <int, Color>{
    50: const Color(0xffdddde2), //10%
    100: const Color(0xffc4c5c9), //20%
    200: const Color(0xffacacb0), //30%
    300: const Color(0xff939497), //40%
    400: const Color(0xff7b7b7e), //50%
    500: const Color(0xff626264), //60%
    600: const Color(0xff494a4b), //70%
    700: const Color(0xff313132), //80%
    800: const Color(0xff181919), //90%
    900: const Color(0xff000000), //100%
  },
);

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

final List<IconItem> iconItemList = <IconItem>[
  IconItem(
    footer: 'Laptop',
    iconData: Icons.laptop,
  ),
  IconItem(
    footer: 'House',
    iconData: Icons.house,
  ),
  IconItem(
    footer: 'Shopping',
    iconData: Icons.shopping_bag,
  ),
  IconItem(
    footer: 'Bike',
    iconData: Icons.pedal_bike,
  ),
  IconItem(
    footer: 'Watch',
    iconData: Icons.watch,
  ),
  IconItem(
    footer: 'Savings',
    iconData: Icons.monetization_on,
  ),
  IconItem(
    footer: 'Anything else',
    iconData: Icons.category,
  ),
];

class RouteConstants {
  static const LOGIN_SCREEN = '/login-screen';
  static const USER_DETAIL_SCREEN = '/user-detail-screen';
  static const SIGNUP_SCREEN = '/signup-screen';
  static const HOME_SCREEN = '/home-screen';
  static const AUTH_WRAPPER = '/auth-wrapper';
  static const createGoalPage2 = '/create-goal-page-2';
  static const SettingsScreen = '/settings-screen';
  static const createGoalPage1 = '/create-goal-page-1';
}
