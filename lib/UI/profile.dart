import 'package:batua/Services/authentication_service.dart';
import 'package:batua/utils/constants.dart';
import'package:flutter/material.dart';


class Myprofile extends StatelessWidget {

final AuthenticationService _auth = AuthenticationService();

//Textfield
Widget SingleTextBox(String name){
  return Column(
    children: [
      Container(
          height: 50,                
          width: 390,
          decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12)
              ),
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Text(name,style: TextStyle(
              fontSize: 16,
              color: secondary_color
            ),),
          ),
        ),
     SizedBox(height: 20,)     
    ],
  );
}
//app settings button
Widget AppSettingsButton(){
  return Column(
    children: [
      Row(                   
          children: [
            GestureDetector(
              // ignore: prefer_const_constructors
              child: Row(
              
                // ignore: prefer_const_literals_to_create_immutables
                children: [                        
                  Text('App Settings',style: TextStyle(
                    fontSize: 18,
                    color: secondary_color
                  ),),
                  SizedBox(width: 180,),
                  Icon(Icons.arrow_forward,color: secondary_color)
                ],
              )
              ),
          ],
        ),
      SizedBox(height: 20,),
    ],
  );
}
// help & legal button
Widget HelpLegalButton(){
  return Column(
    children: [
      Row(                   
          children: [
            GestureDetector(
              // ignore: prefer_const_constructors
              child: Row(
              
                // ignore: prefer_const_literals_to_create_immutables
                children: [                        
                  Text('Help & Legal',style: TextStyle(
                    fontSize: 18,
                    color: secondary_color
                  ),),
                  SizedBox(width: 180,),
                  Icon(Icons.arrow_forward,color: secondary_color,)
                ],
              )
              ),
          ],
        ),
      SizedBox(height: 20,),
    ],
  );
}
// signoutbutton
Widget SignoutButton(BuildContext ctx){
  return Column(
    children: [
      SizedBox(height: 20,),
      TextButton(
          onPressed: ()async{
            await _auth.signOut();
          }, 
          child: Text("Sign Out",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                      color: primary_color)),
          style: TextButton.styleFrom(
                backgroundColor: secondary_color,
                minimumSize:
                    Size(MediaQuery.of(ctx).size.width - 50, 40),
                padding: const EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
          ),
       SizedBox(height: 20,),
    ],
  );
}
// edit profile
Widget EditProfile(){
  return Column(
    children: [
      Row(                   
          children: [
            GestureDetector(
              // ignore: prefer_const_constructors
              child: Row(
              
                // ignore: prefer_const_literals_to_create_immutables
                children: [                        
                  Text('Edit Profile',style: TextStyle(
                    fontSize: 18,
                    color: secondary_color
                  ),),
                  SizedBox(width: 200,),
                  Icon(Icons.arrow_forward,color: secondary_color)
                ],
              )
              ),
          ],
        ),
     
    ],
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Center(child:Column(
                  children: [
                    const SizedBox(height: 30),
                    CircleAvatar(
                    backgroundImage: AssetImage('images/pr.png'),                      
                    backgroundColor: Colors.white,  
                    radius: 95,
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      
                      children: [
                        Text('Account Details',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,                   
                        ),),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    EditProfile(),
                    SizedBox(height: 25,child: Divider(color: Colors.black,thickness: 0.5,),),
                    SingleTextBox('Name Surname'),
                    SingleTextBox('Mobile Number'),
                    SingleTextBox('Email'),
                    SizedBox(height: 30,child: Divider(color: Colors.black,thickness: 0.5,),),
                    AppSettingsButton(),
                    SizedBox(height: 30,child: Divider(color: Colors.black,thickness: 0.5,),),
                    HelpLegalButton(),
                    SignoutButton(context)
                  ],
                ) ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}