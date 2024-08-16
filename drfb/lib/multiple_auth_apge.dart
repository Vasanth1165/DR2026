import 'package:drfb/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MultiAuthPage extends StatelessWidget {
  const MultiAuthPage({super.key});

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
          }, child: Text("Anonymous"))
        ],
      ),
    );
  }
  Future<void> anoLogin() async{
    FirebaseAuth _auth =await FirebaseAuth.instance;
    await _auth.signInAnonymously();
  }
}
