import 'package:flutter/material.dart';
import 'package:batua/utils/constants.dart' as constants;

class UserDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserDetailsScreenState();
  }
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final double _height = _mediaQuery.size.height;
    final double _width = _mediaQuery.size.width;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextFormField(
                controller: _emailController,
                onChanged: (value) {},
                decoration: constants.inputDecoration.copyWith(
                  hintText: 'Email(to be autofilled and disabled)',
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
                controller: _phoneController,
                onChanged: (value) {},
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
                onPressed: () {
                  print(_nameController.text);
                  print(_emailController.text);
                  print(_phoneController.text);
                  Navigator.of(context).pushNamed(
                    constants.RouteConstants.HOME_SCREEN,
                  );
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
