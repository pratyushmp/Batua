import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//files
import 'sign_up.dart';
import 'utils/constants.dart';
import 'google_signin.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Text Editing controllers
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  //Colors
  Color textField_fill_color = const Color(0xFFEBEBEB);
  Color black_heading=const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:35.0),
              RichText(text: TextSpan(
                  style: TextStyle(fontSize: 58,color: black_heading,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),
                  children:[
                    TextSpan(text:'Hello \nThere'),
                    TextSpan(text:' .',style:TextStyle(color: secondary_color,fontWeight: FontWeight.w900)),
                  ]
              )
              ),
              SizedBox(height: 10.0),
              Text("Sign In and start saving",style:TextStyle(fontSize:18.0,letterSpacing:2.0,color: secondary_color,fontWeight: FontWeight.w900)),
              SizedBox(height: 35.0),
              Text("Email",style:TextStyle(fontSize:18.0,fontWeight: FontWeight.w900)),
              SizedBox(height: 15.0),
              TextField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textField_fill_color,
                  contentPadding: EdgeInsets.only(left: 10.0),
                  enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: textField_fill_color),borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: textField_fill_color),borderRadius: BorderRadius.circular(12.0)),
                  hintText: "Enter Email",
                ),
              ),
              SizedBox(height: 25.0),
              Text("Password",style:TextStyle(fontSize:18.0,fontWeight: FontWeight.w900)),
              SizedBox(height: 15.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.0),
                  filled: true,
                  fillColor: textField_fill_color,
                  enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: textField_fill_color),borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: textField_fill_color),borderRadius: BorderRadius.circular(12.0)),
                  hintText: "Enter Password",
                ),
              ),
              SizedBox(height: 35.0),
              FlatButton(
                onPressed: (){},
                color: secondary_color,
                padding: EdgeInsets.all(14.0),
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0)),
                child: Text("LOGIN",style:TextStyle(fontSize:16.0,fontWeight: FontWeight.w900,color: primary_color)),
              ),
              SizedBox(height: 15.0),
              Center(child: Text("OR",style: TextStyle(fontSize:18.0,fontWeight: FontWeight.w900),)),
              Center(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed:(){
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
                                };
                              },
                            );
                          },
                          icon:FaIcon(FontAwesomeIcons.google,size: 30.0,color: black_heading),
                      ),
                      SizedBox(width: 45.0),
                      IconButton(
                          onPressed:(){},
                          icon:FaIcon(FontAwesomeIcons.facebook,size: 30.0,color: black_heading),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: RichText(
                  text: TextSpan(
                      style:TextStyle(fontSize:16.0,color:secondary_color,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),
                      children: [
                        TextSpan(text:"Don't have an account? "),
                        TextSpan(
                            text: "Create one!",
                            recognizer:TapGestureRecognizer()..onTap = goToSignUpScreen,
                            style: TextStyle(decoration: TextDecoration.underline,)
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void goToSignUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpScreen();}));
  }
}
