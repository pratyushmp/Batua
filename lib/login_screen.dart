import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication_service.dart';
import 'google_signin.dart';
import 'home_screen.dart';
import 'loading.dart';
import 'sign_up.dart';
import 'utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Text Editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final AuthenticationService _auth =
      AuthenticationService(FirebaseAuth.instance);

  String error = '';
  bool load = false;
  //Colors
  // ignore: non_constant_identifier_names
  Color textField_fill_color = const Color(0xFFEBEBEB);
  // ignore: non_constant_identifier_names
  Color black_heading = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            backgroundColor: primary_color,
            body: SingleChildScrollView(
              child: SafeArea(
                minimum: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35.0),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 58,
                                color: black_heading,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins'),
                            children: [
                          const TextSpan(text: 'Hello \nThere'),
                          TextSpan(
                              text: ' .',
                              style: TextStyle(
                                  color: secondary_color,
                                  fontWeight: FontWeight.w900)),
                        ])),
                    const SizedBox(height: 10.0),
                    Text("Sign In and start saving",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            color: secondary_color,
                            fontWeight: FontWeight.w900)),
                    const SizedBox(height: 35.0),

                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Email",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: _emailController,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textField_fill_color,
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_fill_color),
                                  borderRadius: BorderRadius.circular(12.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_fill_color),
                                  borderRadius: BorderRadius.circular(12.0)),
                              hintText: "Enter Email",
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          const Text("Password",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              filled: true,
                              fillColor: textField_fill_color,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_fill_color),
                                  borderRadius: BorderRadius.circular(12.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_fill_color),
                                  borderRadius: BorderRadius.circular(12.0)),
                              hintText: "Enter Password",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => load = true);
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);

                          if (result == null) {
                            setState(() {
                              load = false;
                              error =
                                  'Could not sign in with those credentials';
                            });
                          }
                        }
                      },
                      color: secondary_color,
                      padding: const EdgeInsets.all(14.0),
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text("LOGIN",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: primary_color)),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    const SizedBox(height: 15.0),
                    const Center(
                        child: Text(
                      "OR",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900),
                    )),
                    Center(
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                signInWithGoogle().then(
                                  (result) {
                                    if (result != null) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return HomeScreen();
                                          },
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.google,
                                  size: 30.0, color: black_heading),
                            ),
                            const SizedBox(width: 45.0),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.facebook,
                                  size: 30.0, color: black_heading),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 16.0,
                                color: secondary_color,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins'),
                            children: [
                              const TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                  text: "Create one!",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = goToSignUpScreen,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ))
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  void goToSignUpScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpScreen();
    }));
  }
}
