import 'package:batua/Services/authentication_service.dart';
import 'package:batua/Services/facebook_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Services/google_signin.dart';
import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Text Editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  final AuthService auth = new AuthService();

  String _email = '';
  String _password = '';
  String error = '';
  bool load = false;
  bool _isHidden = true;
  bool showSpinner = false;
  //Colors
  // ignore: non_constant_identifier_names
  Color textField_fill_color = const Color(0xFFEBEBEB);

  // ignore: non_constant_identifier_names
  Color black_heading = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 58,
                              height: 1.3,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.009),
                  Text("Sign In and start saving",
                      style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: secondary_color,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const Text("Email",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) {
                      setState(() => _email = value);
                    },
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textField_fill_color,
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textField_fill_color),
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textField_fill_color),
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: "Enter Email",
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text("Password",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) {
                      setState(() => _password = value);
                    },
                    controller: _passwordController,
                    obscureText: _isHidden,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      filled: true,
                      fillColor: textField_fill_color,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textField_fill_color),
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textField_fill_color),
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: "Enter Password",
                      suffixIcon: InkWell(
                        onTap: _togglePassword,
                        child: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility,
                          color: secondary_color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      if (_formkey.currentState!.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            _email, _password);
                        //print(result);
                        if (result == true) {
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.of(context).pushNamed(
                            RouteConstants.HOME_SCREEN,
                          );
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  backgroundColor: Colors.black54,
                                  title: Text(
                                    "Log-In Complete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    "Enjoy This App",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              });
                        } else if (result == false) {
                          setState(() {
                            showSpinner = false;
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black54,
                                  title: Text(
                                    "Log-in Error",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    "Email not Verified",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              });
                        } else {
                          setState(() {
                            showSpinner = false;
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black54,
                                  title: Text(
                                    "Log-in Error",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    "Email or Password Error",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              });
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: secondary_color,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 20, 40),
                      padding: const EdgeInsets.all(14.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                            color: primary_color)),
                  ),
                  const SizedBox(height: 15.0),
                  const Center(
                      child: Text(
                    "OR",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
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
                                    Navigator.of(context).pushReplacementNamed(
                                      RouteConstants.HOME_SCREEN,
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
                            onPressed: () async {
                              await auth.signInWithFacebook().then(
                                (result) async {
                                  if (result != null) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      RouteConstants.HOME_SCREEN,
                                      (route) => false,
                                    );
                                  }
                                },
                              );
                            },
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
        ),
      ),
    );
  }

  void goToSignUpScreen() {
    Navigator.of(context).pushNamed(
      RouteConstants.SIGNUP_SCREEN,
    );
  }

  void _togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
