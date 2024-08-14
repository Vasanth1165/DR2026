import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            FirebaseAuth auth= await FirebaseAuth.instance;
            await auth.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome to Firebase",style: TextStyle(fontSize: 32)),),
          SizedBox(
            height: 20,
          ),
          Text("${_auth.currentUser!.email}",style: TextStyle(fontSize: 32),),
          SizedBox(
            height: 20,
          ),
          Text("${_auth.currentUser!.uid}",style: TextStyle(fontSize: 32),),
          SizedBox(
            height: 20,
          ),
          Text("${_auth.currentUser!.emailVerified}",style: TextStyle(fontSize: 32),),
          SizedBox(
            height: 20,
          ),
          // Text("${_auth.currentUser}",style: TextStyle(fontSize: 32),)
        ],
      ),
    );
  }
}
