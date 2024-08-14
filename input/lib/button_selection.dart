import 'package:flutter/material.dart';

class ButtonSelection extends StatefulWidget {
  const ButtonSelection({super.key});

  @override
  State<ButtonSelection> createState() => _ButtonSelectionState();
}
enum GenderSelection {male,female}

class _ButtonSelectionState extends State<ButtonSelection> {
  bool isVerified= false;
  bool isadded = false;
  bool isGroup= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Checkbox(value: isVerified, onChanged: (val){
              isVerified =val!;
              setState(() {

              });

            }),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity(
              vertical: -4,
              horizontal: -4
            ),
              title: Text("Permissions"),value: isVerified, onChanged: (val){}),
          // Radio(value: isadded, groupValue: !isGroup, onChanged: (val){
          //   setState(() {
          //     isadded=!isadded;
          //   });
          // }),
          // Radio(value: isadded, groupValue: GenderSelection.female, onChanged: (val){
          //   setState(() {
          //     isadded= val!;
          //   });
          // }),
          // RadioMenuButton(
          //     value: isadded,
          //     groupValue: GenderSelection.male,
          //     onChanged: (val){
          //       setState(() {
          //
          //       });
          //     },
          //     child: Text("Male")
          // ),
          // RadioMenuButton(
          //     value: isadded,
          //     groupValue: GenderSelection.female,
          //     onChanged: (val){},
          //     child: Text("Female")
          // ),

        ],
      ),
    );
  }
}
