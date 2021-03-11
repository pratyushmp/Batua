import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';
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
                  style: TextStyle(fontSize: 58,color: black_heading,fontWeight: FontWeight.w900,letterSpacing: 2.0),
                  children:[
                    TextSpan(text:'Hello \nThere '),
                    TextSpan(text:'.',style:TextStyle(color: secondary_color,fontWeight: FontWeight.w900)),
                  ]
              )
              ),
              SizedBox(height: 10.0),
              Text("Sign In and start saving",style:TextStyle(fontSize:18.0,letterSpacing:2.0,color: secondary_color,fontWeight: FontWeight.w800)),
              SizedBox(height: 35.0),
              Text("Email",style:TextStyle(fontSize:18.0,fontWeight: FontWeight.w800)),
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
                  hintText: "Type Something..",
                ),
              ),
              SizedBox(height: 25.0),
              Text("Password",style:TextStyle(fontSize:18.0,fontWeight: FontWeight.w800)),
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
              SizedBox(height: 10.0),
              Center(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                          onPressed:(){},
                          icon:Image(
                              height: 30.0,
                              width: 30.0,
                              image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png")),
                          label: Text("")
                      ),
                      SizedBox(width: 45.0),
                      TextButton.icon(
                          onPressed:(){},
                          icon:Image(
                              height: 30.0,
                              width: 30.0,
                              image: NetworkImage("https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512")),
                          label: Text("")
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: RichText(
                  text: TextSpan(
                      style:TextStyle(fontSize:18.0,color:secondary_color,fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(text:"Don't have an account? "),
                        TextSpan(
                            text: "Create one!",
                            recognizer:TapGestureRecognizer()..onTap = (){},
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
}
