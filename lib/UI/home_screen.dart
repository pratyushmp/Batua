import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:batua/Services/facebook_auth.dart';
import 'package:batua/UI/home_view.dart';
import 'package:batua/UI/profile.dart';
import 'package:batua/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService auth = AuthService();

  int activeIndex = 0;

  final tabs = [
    Home(),
    Myprofile(),
  ];

  final iconList = [Icons.access_time, Icons.person_outline];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondary_color,
        onPressed: () {
          Navigator.of(context).pushNamed(
            RouteConstants.createGoalPage,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        height: 90,
        inactiveColor: lightVioletColor,
        activeColor: secondary_color,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        activeIndex: activeIndex,
      ),
      body: tabs[activeIndex],
    );
  }
}
