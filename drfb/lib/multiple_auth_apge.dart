
import 'package:drfb/otp_view.dart';
import 'package:drfb/phone_auth_page.dart';
import 'package:drfb/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MultiAuthPage extends StatefulWidget {
  const MultiAuthPage({super.key});

  @override
  State<MultiAuthPage> createState() => _MultiAuthPageState();
}

class _MultiAuthPageState extends State<MultiAuthPage> {
  // final controller = TextEditingController();
  String otp ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
            }, child: Text("Email/Password")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: (){
            anoLogin();
          }, child: Text("Anonymous")),
          SizedBox(
            height: 20,
          ),
          // ElevatedButton(onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> OtPView()));
          // }, child: Text("OTP VIEW")),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneAuthPage()));
          }, child: Text("Phone"))


        ],
      ),
    );
  }

  Future<void> anoLogin() async{
    FirebaseAuth _auth =await FirebaseAuth.instance;
    await _auth.signInAnonymously();
  }
}
