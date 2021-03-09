import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .08),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Hello\nThere ",
                    style: TextStyle(fontSize: 84, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontSize: 100,
                        color: secondary_color,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                // Container(child: Icon(Icons.circle))
              ],
            ),
            Container(
              child: Text(
                "Sign in and start saving",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: secondary_color,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              child: Text(
                "Email",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.008),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TextField(
                cursorHeight: 32,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            Container(
              child: Text(
                "Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.008),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TextField(
                cursorHeight: 32,
                decoration: InputDecoration(hintText: "Enter Password"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.008),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                padding: EdgeInsets.all(15),
                color: secondary_color,
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.008),
            Center(
              child: Container(
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset("assets/download.png"),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                  icon: Image.asset("assets/fb.png"),
                  onPressed: () {},
                  iconSize: 40,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Dont have anh account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: secondary_color,
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                      child: Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                      color: secondary_color,
                    ),
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
