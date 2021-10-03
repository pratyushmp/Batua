

import 'package:batua/Services/authentication_service.dart';
import 'package:batua/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo() async {
    final uid = await _auth.getuid();
    return FirebaseFirestore.instance.collection('User Data').doc(uid).get();
  }

  Widget singleTextBox({
    required String text,
    required double height,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: height / 14,
      width: height / 2.16,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: secondary_color,
        ),
      ),
    );
  }

  SizedBox sizedBoxBuilder(double height) => SizedBox(height: height / 56);
  Divider dividerBuilder() =>
      const Divider(color: Colors.black, thickness: 0.5);

  Widget appSettingsButton(BuildContext ctx) {
    return ListTile(
      onTap: () => Navigator.of(ctx).pushNamed(
        RouteConstants.SettingsScreen,
      ),
      title: Text(
        'App Settings',
        style: TextStyle(
          color: secondary_color,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward,
        color: secondary_color,
      ),
    );
  }

  Widget signOutButton(BuildContext ctx, double height) {
    return TextButton(
      onPressed: () async {
        await _auth.signOut();
      },
      style: TextButton.styleFrom(
        backgroundColor: secondary_color,
        minimumSize: Size(
          height / 2,
          height / 14,
        ),
        padding: const EdgeInsets.all(14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        "Sign Out",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
          color: primary_color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserInfo(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    sizedBoxBuilder(_height * 2),
                    const CircleAvatar(
                      backgroundImage: AssetImage('images/pr.png'),
                      backgroundColor: Colors.white,
                      radius: 95,
                    ),
                    sizedBoxBuilder(_height * 2),
                    const Text(
                      'Account Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    dividerBuilder(),
                    sizedBoxBuilder(_height),
                    singleTextBox(
                      text: snapshot.data!.data()!['Name'].toString() ??
                          'No data provided',
                      height: _height,
                    ),
                    sizedBoxBuilder(_height),
                    singleTextBox(
                      text: snapshot.data!.data()!['Email'].toString() ??
                          'No data provided',
                      height: _height,
                    ),
                    sizedBoxBuilder(_height),
                    singleTextBox(
                      text: snapshot.data!.data()!['Mobile Number'].toString() ==
                              ''
                          ? 'No data provided'
                          : snapshot.data!.data()!['Mobile Number'].toString(),
                      height: _height,
                    ),
                    sizedBoxBuilder(_height),
                    dividerBuilder(),
                    appSettingsButton(context),
                    dividerBuilder(),
                    signOutButton(context, _height),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
