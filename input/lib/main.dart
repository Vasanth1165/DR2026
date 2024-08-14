
import 'package:flutter/material.dart';
import 'package:input/button_selection.dart';
import 'package:input/drop_buttons.dart';
import 'package:input/firebase_options.dart';
import 'package:input/my_slider.dart';
import 'package:input/pickers.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropButton(),
    );
  }
}


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final key=GlobalKey<FormState>();

  final emailCtrl =TextEditingController();
  final passCtrl =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailCtrl,
                validator: (val){
                  if(val!.isEmpty){
                    return "Enter Email";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passCtrl,
                obscureText: true,
                validator: (val){
                  if(val!.isEmpty){
                    return "Enter Password";
                  }
                },
                decoration: InputDecoration(
                  labelText: "Password",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                if(key.currentState!.validate()){
                  debugPrint("${emailCtrl.text} ${passCtrl.text}");
                }
              },
              child: Container(
                width: 350,
                height: 55,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}




