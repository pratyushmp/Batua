import 'package:batua/loading.dart';
import 'package:flutter/material.dart';
import 'package:batua/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthenticationService _auth =
      AuthenticationService(FirebaseAuth.instance);
  final _formkey = GlobalKey<FormState>();
  String error = '';
  String password = '';
  bool load = false;
  // ignore: non_constant_identifier_names
  static Color textField_color2 = const Color(0x42000000).withOpacity(0.05);
  // ignore: non_constant_identifier_names
  static Color textField_color = Colors.grey.withOpacity(0.10);

  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            body: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: const Text(
                          'Get \nStarted',
                          style: TextStyle(
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 72,
                        right: 75,
                        child: Text(
                          '!',
                          style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: secondary_color),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Text(
                      'Sign Up and start saving!',
                      style: TextStyle(
                          color: secondary_color,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 15),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 22.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextFormField(
                            controller: _emailController,
                            //onChanged: (value) { setState(() => email = value);},
                            validator: (value) =>
                                value.isEmpty ? 'Enter an Email' : null,
                            decoration: InputDecoration(
                                hintText: 'Type something...',
                                fillColor: textField_color,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_color),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: textField_color2),
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 15),
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 22),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                fillColor: textField_color,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_color),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: textField_color2),
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 15),
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text(
                            'Confirm Password',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 6),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (val) => val != password
                                ? 'Password does not match'
                                : null,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                fillColor: textField_color,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textField_color),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: textField_color2),
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 4),
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => load = true);
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);
                          if (result != null) {
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              load = false;
                              error = 'Please supply a valid email';
                            });
                          }
                        }
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: secondary_color,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: primary_color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
