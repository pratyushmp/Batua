import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:batua/Services/authentication_service.dart';
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
  final AuthenticationService _auth = AuthenticationService();
  final AuthService auth = AuthService();

  int activeIndex = 0;

  final tabs = [
    Home(),
    Myprofile(),
  ];

  final iconList = [Icons.access_time_rounded, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondary_color,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RouteConstants.createGoalPage,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 90,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? secondary_color : secondary_color;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            );
          },
          backgroundColor: Colors.white,
          gapLocation: GapLocation.center,
          activeIndex: activeIndex,
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          }),
      body: tabs[activeIndex],
    );
  }
}
