import 'package:batua/auth_wrapper.dart';
import 'package:batua/home_screen.dart';
import 'package:batua/login_screen.dart';
import 'package:batua/sign_up.dart';
import 'package:batua/user_details_screen.dart';
import 'package:batua/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.HOME_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (ctx, firstAni, secondAni) => HomeScreen(),
        );
      case RouteConstants.LOGIN_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (ctx, firstAni, secondAni) => LoginScreen(),
        );
      case RouteConstants.SIGNUP_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (ctx, firstAni, secondAni) => SignUpScreen(),
        );
      case RouteConstants.USER_DETAIL_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (ctx, firstAni, secondAni) => UserDetailsScreen(),
        );
      case RouteConstants.AUTH_WRAPPER:
        return PageRouteBuilder(
          pageBuilder: (ctx, firstAni, secondAni) => AuthWrapper(),
        );
    }
  }
}
