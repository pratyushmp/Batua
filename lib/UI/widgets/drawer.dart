import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:batua/utils/constants.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Stack(
              // alignment: Alignment.center,
              children: [
                Positioned(
                    left: -15,
                    top: 20,
                    child: Container(
                      height: 100,
                      width: 280,
                      decoration: BoxDecoration(
                          color: secondary_color,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Rohith",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.4,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )),
                                SizedBox(
                                  height: 3,
                                ),
                                Expanded(
                                    child: Text("1234567890",
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15))),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          DrawerTile(name: "Home", icon: FontAwesomeIcons.home),
          Divider(),
          DrawerTile(name: "Notifications", icon: FontAwesomeIcons.bell),
          Divider(),
          DrawerTile(name: "FeedBack", icon: FontAwesomeIcons.solidCommentDots),
          Divider(),
          DrawerTile(name: "Settings", icon: FontAwesomeIcons.cog),
          Divider(),
          DrawerTile(name: "LogOut", icon: FontAwesomeIcons.signOutAlt),
          Divider(),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  String name;
  IconData icon;
  DrawerTile({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
      ),
    );
  }
}
