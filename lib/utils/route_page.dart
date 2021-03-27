import 'package:batua/UI/auth_wrapper.dart';
import 'package:batua/UI/home_screen.dart';
import 'package:batua/UI/login_screen.dart';
import 'package:batua/UI/sign_up.dart';
import 'package:batua/UI/user_details_screen.dart';
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
