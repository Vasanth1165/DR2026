import 'package:drfb/home_page.dart';
import 'package:drfb/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
class AuthChange extends StatefulWidget {
  const AuthChange({super.key});

  @override
  State<AuthChange> createState() => _AuthChangeState();
}

class _AuthChangeState extends State<AuthChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            return HomePage();
          }else{
            return SignUpPage();
          }
        }
    );
  }
}
