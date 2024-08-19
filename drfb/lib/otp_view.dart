import 'package:drfb/auth_change.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OtPView extends StatelessWidget {
  final String verifyId;
  OtPView({super.key,required this.verifyId});

  String otp="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  List.generate(6, (index) => SizedBox(
              width: 55,
              height: 55,
              child: TextField(
                // maxLength: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                onChanged: (val){
                  if(val.isNotEmpty){
                    if(index!=5){
                      otp=otp+val;
                      print(otp);
                      FocusScope.of(context).nextFocus();
                    }else{
                      otp=otp+val;
                      print(otp);
                    }
                  }else if(val.isEmpty){
                    if(index!=0){
                      FocusScope.of(context).previousFocus();
                    }else{
                      otp="";
                    }
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "0",
                    border: OutlineInputBorder()
                ),
              ),
            ),)
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () async{
            FirebaseAuth auth = FirebaseAuth.instance;
            print("OTP-------------------$otp");
            PhoneAuthCredential credential =PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

            await auth.signInWithCredential(credential)
                .then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AuthChange()));
                })
                .onError((error, stackTrace){

            });

          }, child: Text("Verify OTP"))
        ],
      )
    );
  }
}
