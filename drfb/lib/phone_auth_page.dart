import 'package:drfb/otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatelessWidget {
  final phCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: phCtrl,
            // initialValue: "+919177522410",
            decoration: InputDecoration(
              hintText: "+91 6023557262",
              border: OutlineInputBorder()
            ),
          ),
          ElevatedButton(onPressed: () async{
            if(phCtrl.text.length>10){
              FirebaseAuth _auth = await FirebaseAuth.instance;
              await _auth.verifyPhoneNumber(
                  phoneNumber: phCtrl.text.trim(),
                  verificationCompleted: (verify){},
                  verificationFailed: (err){
                    print(err);
                  },
                  codeSent: (val,num){
                    Navigator.pushReplacement(
                        context,MaterialPageRoute(
                        builder: (context)=> OtPView(
                            verifyId: val)
                    ));
                  },
                  codeAutoRetrievalTimeout: (val){

                  }
              );
            }
          }, child: Text("send OTP"))
        ],
      ),
    );
  }
}
