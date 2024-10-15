import 'dart:convert';
import 'package:api_integration/books_api.dart';
import 'package:api_integration/chat_bot.dart';
import 'package:api_integration/users_tabs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksApi(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final userCtrl= TextEditingController();

  Map<String,dynamic> userData ={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(
               height: 50,
             ),
             TextFormField(
               controller: userCtrl,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: "vasanth01827"
               ),
             ),
             SizedBox(
               height: 20,
             ),
             GestureDetector(
               onTap: () async{
                 if(userCtrl.text.isNotEmpty){
                   await getUserDetails(userCtrl.text.trim());
                 }
               },
               child: Container(
                 height: 55,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.blue
                 ),
                 child: Center(child: Text("Get User Details")),
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Visibility(
               visible: userData.isNotEmpty,
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                         children: [
                           Image(image: NetworkImage("${userData["avatar_url"] ?? ""}"),
                             height: 100,
                           width: 100,),
                           Text("${userData["login"] ?? "User NotFound"}"),
                         ],
                       ),
                       Column(
                         children: [
                           // Text(),
                           Text("${userData["followers"] ?? "User NotFound"}"),
                           Text("Followers")
                         ],
                       ),
                       Column(
                         children: [
                           // Text(),
                           Text("${userData["following"] ?? "User NotFound"}"),
                           Text("Following")
                         ],
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Center(
                     child: Text("Repos--${userData["public_repos"]??0}"),
                   )
                 ],
               ),
             )
           ],
         ),
      ),
    );
  }

  Future<Map<String,dynamic>> getUserDetails(String userId) async{
    try{
      Uri url= Uri.parse("https://api.github.com/users/$userId");
      final res = await http.get(url);
      print(res.body);
      if(res.statusCode==200){
        userData = jsonDecode(res.body);
        setState(() {

        });
        return jsonDecode(res.body);
      }
      return {};
    }catch(err){
      return {};
    }
  }
}



