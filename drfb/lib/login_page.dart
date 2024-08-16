import 'dart:io';

import 'package:drfb/auth_change.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(hintText: "Pasword"),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (passCtrl.text.trim().isNotEmpty &&
                    passCtrl.text.trim().length >= 6 &&
                    emailCtrl.text.trim().isNotEmpty) {
                  logintoAccount();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill the form")));
                }
              },
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text("Log in"),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create account?"),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> logintoAccount() async {
    FirebaseAuth auth = await FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(
            email: emailCtrl.text.trim(), password: passCtrl.text.trim())
        .then((value) {
      print("Loged in with ${emailCtrl.text} at ${DateTime.now()}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthChange()));
    }).onError((error, stackTrace) {
      if (error is SocketException) {
        print("Please connect to the network");
      } else if (error is FirebaseAuthException) {
        print("issue with Auth ${error.message}");
        authErrors(error.code);
      } else {
        print("issue ${error}");
      }
    });
  }

  void authErrors(String code){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(code.replaceAll("-", " ").toString())));
  }
}
