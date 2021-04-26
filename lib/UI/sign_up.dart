import 'package:batua/Services/authentication_service.dart';
import 'package:batua/UI/loading.dart';
import 'package:batua/UI/user_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:batua/utils/constants.dart';

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
  final _formkey = GlobalKey<FormState>();
  String _error = '';
  String _password = '';
  bool load = false;
  String _email = '';
  bool ishidden = true;
  bool ishidden_ = true;
  final db = FirebaseFirestore.instance;
  final FirebaseAuth _fire = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  static Color textField_color2 = const Color(0x42000000).withOpacity(0.05);

  // ignore: non_constant_identifier_names
  static Color textField_color = Colors.grey.withOpacity(0.10);

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            body: ListView(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.003,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.000,
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
                      right: 68,
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
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
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
                          onChanged: (value) {
                            setState(() => _email = value);
                          },
                          validator: (value) =>
                              value.isEmpty ? 'Enter an Email' : null,
                          decoration: InputDecoration(
                              hintText: 'Type something...',
                              fillColor: textField_color,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textField_color),
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
                          obscureText: ishidden,
                          controller: _passwordController,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (value) {
                            setState(() => _password = value);
                          },
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    ishidden = !ishidden;
                                  });
                                },
                                child: Icon(
                                  ishidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: secondary_color,
                                ),
                              ),
                              hintText: 'Enter Password',
                              fillColor: textField_color,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textField_color),
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
                          obscureText: ishidden_,
                          controller: _confirmPasswordController,
                          validator: (val) => val != _password
                              ? 'Password does not match'
                              : null,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    ishidden_ = !ishidden_;
                                  });
                                },
                                child: Icon(
                                  ishidden_
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: secondary_color,
                                ),
                              ),
                              hintText: 'Confirm Password',
                              fillColor: textField_color,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textField_color),
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
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 20, bottom: 20),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.085,
                  // ignore: deprecated_member_use
                  child: TextButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                       
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(_email, _password);
                        if (result != null) {
                        final uid =  await _auth.getuid();
                       
                       db.collection('User Data').doc(uid).set({'Email':_email});
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserDetailsScreen(uid: uid,email: _email,))
                          );
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black54,
                                  title: Text(
                                    "Sign-Up Complete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    "Verification Link Sent to Your Registered Mail\nPlease Verify and Log-In",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black54,
                                  title: Text(
                                    "Sign-up Error",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    "Email Already Exist",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              });
                        }
                      }
                    },
  
                    style: TextButton.styleFrom(
                      primary: primary_color,
                      backgroundColor: secondary_color,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 20, 40),
                      padding: const EdgeInsets.all(14.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          );
    //     Padding(
    //       padding: const EdgeInsets.only(left:20.0,right: 20,top: 20),
    //       // ignore: sized_box_for_whitespace
    //       child: Container(
    //         height: MediaQuery.of(context).size.height*0.065,
    //         // ignore: deprecated_member_use
    //         child:  TextButton(
    //           onPressed: () {},
    //           style: TextButton.styleFrom(
    //             primary: primary_color,
    //             backgroundColor: secondary_color,
    //             minimumSize: Size(MediaQuery.of(context).size.width - 20, 40),
    //             padding: const EdgeInsets.all(14.0),
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(15.0)),
    //           ),
    //           child: const Text(
    //             'Sign Up',
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.w900,
    //             ),
    //           ),
    //         ),),),
    //
    //   ],
    // ),
    // );
  }

  void _togglepassword() {
    setState(() {
      ishidden = !ishidden;
    });
  }
}
