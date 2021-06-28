import 'package:batua/Services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:batua/utils/constants.dart' as constants;

class UserDetailsScreen extends StatefulWidget {
  final String uid;
  final String email;
  const UserDetailsScreen({Key key, this.uid, this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _UserDetailsScreenState(uid: uid, email: email);
  }
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String uid;
  String email;
  _UserDetailsScreenState({this.uid, this.email});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _name = '';
  String _phone = '';
  String _email = '';

  final db = FirebaseFirestore.instance;
  final AuthenticationService _auth = AuthenticationService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final double _height = _mediaQuery.size.height;
    final double _width = _mediaQuery.size.width;

    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Stack(
              children: [
                // Profile picture
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: _height * 0.2,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white54,
                      size: 100,
                    ),
                  ),
                ),

                // Plus button
                Positioned(
                  right: _width * 0.35,
                  top: _height * 0.16,
                  child: Container(
                    height: _height * 0.05,
                    width: _height * 0.05,
                    decoration: const BoxDecoration(
                      color: Color(0xff00B0FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Name text
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
            child: Text(
              'Name',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Name Textfield
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 22.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: _height * 0.1,
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    val = _name;
                  });
                },
                validator: (name) {
                  if (name.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: constants.inputDecoration.copyWith(
                  hintText: 'Name',
                ),
              ),
            ),
          ),

          // Email text
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
            child: Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Email Textfield
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 22),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: constants.textField_color2,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          // Phone Number text
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
            child: Text(
              'Phone Number',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Phone Number TextField
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 22),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextFormField(
                // validator: (val){
                //   if(val.length < 10){
                //     return "Enter valid phone number";
                //   }

                controller: _phoneController,
                onChanged: (value) {
                  setState(() {
                    value = _phone;
                  });
                },
                decoration: constants.inputDecoration.copyWith(
                  hintText: '(Optional)',
                ),
              ),
            ),
          ),

          // Let's Go Button
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    db.collection('User Data').doc(uid).set({
                      'Name': _nameController.text,
                      'Email': email,
                      'Mobile Number': _phoneController.text,
                    });
                    Navigator.of(context).pushNamed(
                      constants.RouteConstants.LOGIN_SCREEN,
                    );
                  }

                  // print(_nameController.text);
                  //print(email);
                  // print(_phoneController.text);
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: constants.secondary_color,
                child: Text(
                  'Let\'s Go ->',
                  style: TextStyle(
                    fontSize: 20,
                    color: constants.primary_color,
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
