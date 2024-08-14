import 'package:flutter/material.dart';
import 'package:input/button_selection.dart';
import 'package:input/my_slider.dart';
import 'package:input/pickers.dart';
class DropButton extends StatefulWidget {
  const DropButton({super.key});

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  
  final dropvalues=["+91","+1","+44","+82"];
  final popValues =[
    {
      "label": "pickers",
      "onTap" : MyPickers()
    },
    {
      "label": "Selections",
      "onTap" : ButtonSelection()
    },
    {
      "label" : "Sliders",
      "onTap": MySlider()
    }
  ];
  final controller = TextEditingController();
  String? selectedEntry;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder:(context)=> popValues.map<PopupMenuEntry>(
                      (e) => PopupMenuItem(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>e["onTap"] as Widget)
                          );
                        },
                          child: Text(e["label"].toString())
                      )
              ).toList())
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownMenu(
            selectedTrailingIcon: Icon(Icons.add_card),
            controller: controller,
            onSelected: (val){
              // selectedEntry = val;
              // print(selectedEntry);
              setState(() {
                
              });
              print(controller.text);
            },
              dropdownMenuEntries: dropvalues.map(
                      (e) => DropdownMenuEntry(value: e, label: e)
              ).toList())
        ],
      ),
    );
  }
}

