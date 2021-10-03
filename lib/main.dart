import 'package:batua/Services/authentication_service.dart';
import 'package:batua/models/user.dart';
import 'package:batua/utils/constants.dart';
import 'package:batua/utils/route_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: User(),
        )
      ],
      child: MaterialApp(
        title: 'Batua',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: primary_color,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: secondary_color
        ),
        initialRoute: RouteConstants.AUTH_WRAPPER,
        onGenerateRoute: RoutePage.generateRoute,
      ),
    );
  }
}
