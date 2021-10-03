

import 'package:batua/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  Text textBuilder({required String text}) => Text(
        text,
        style: TextStyle(
          color: secondary_color,
        ),
      );
  Icon iconBuilder({IconData? iconData}) => Icon(
        iconData,
        color: secondary_color,
      );

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primary_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  tooltip: 'Go Back',
                  padding: const EdgeInsets.all(20),
                  icon: Icon(
                    Icons.arrow_back,
                    color: secondary_color,
                  ),
                  alignment: Alignment.topLeft,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: secondary_color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * 0.01,
            ),
            ListTile(
              onTap: () {},
              title: textBuilder(text: 'Edit Profile'),
              trailing: iconBuilder(
                iconData: Icons.edit_outlined,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: textBuilder(text: 'Help & Legal'),
              trailing: iconBuilder(
                iconData: Icons.help_outline_outlined,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: textBuilder(text: 'Privacy Policy'),
              trailing: iconBuilder(
                iconData: Icons.privacy_tip_outlined,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: textBuilder(text: 'About Us'),
              trailing: iconBuilder(
                iconData: Icons.info_outline,
              ),
            ),
            SizedBox(
              height: _height * 0.45,
            ),
            const Text(
              'Made in 🇮🇳 with ❤️ by Open-Source',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
