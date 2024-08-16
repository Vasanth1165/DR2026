import 'dart:io';

import 'package:drfb/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Pasword"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                if(passCtrl.text.trim().isNotEmpty
                    &&  emailCtrl.text.trim().isNotEmpty){
                  createAccount();
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please fill the form")));
                }
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Text("Sign Up"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                }, child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> createAccount() async{
    FirebaseAuth auth= await FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim()
    ).then((value){
      print("Acount created with ${emailCtrl.text}");
    }).onError((error, stackTrace){
      if(error is SocketException){
        print("Please connect to the network");
      }else if( error is FirebaseAuthException){
        print("issue ${error.code}");
        authErrors(error.code);
      }else{
        print("issue ${error}");
      }
    });
  }

  void authErrors(String code){
    if(code == "email-already-in-use"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already in Use")));
    }else{
      String mess= code.replaceAll("-", " ").toString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mess)));

    }
  }
}
