import 'dart:math';

import 'package:flutter/material.dart';
class MyPickers extends StatefulWidget {
  const MyPickers({super.key});

  @override
  State<MyPickers> createState() => _MyPickersState();
}

class _MyPickersState extends State<MyPickers> {
  TimeOfDay? time;

  List<String> rolls=[
    "22MH1A42J0",
    "22A91A05B4",
    "22P31A1205",
    "22A91A05J1",
    "22A91A05B5",
    "22A91A0593",
    "22MH1A4922",
    "22MH1A4938",
    "22MH1A0568",
    "23MH5A0315",
    "22MH1A0565",
    "23MH5A0319",
    "22A91A0529",
    "22P31A04H1",
    "22MH1A0508",
    "22P31A4413",
    "22A91A0565",
    "22A91A05F4",
    "22A91A05C3",
    "22A91A05F3",
    "22A91A05A3",
    "22MH1A05I3",
    "22A91A05G1",
    "22A91A05E3",
    "22A91A05G2",
    "22MH1A0518",
    "22A91A05A1",
    "22A91A0552",
    "22A91A0511",
    "22A91A05C6",
    "22MH1A4904",
    "22P31A0411",
    "22A91A05H5",
    "22A91A61F3",
    "22A91A0571",
    "22MH1A05G7",
    "22A91A0570",
    "22P31A0589",
    "22A91A0514",
    "22A91A05F5",
    "22A91A05D0",
    "22MH1A05L2",
    "22A91A05E2",
    "22A91A05G8",
    "22P31A0586",
    "22A91A6119",
    "22A91A0536",
    "22P31A4417",
    "22A91A05A9",
    "22A91A05E9",
    "22P31A05C1"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: () async{
            showBottomSheet(context: context, builder:(context){
              return const Text("Hello",style: TextStyle(fontSize: 300),);
            });
            // await ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Button is CLicked")));
          }, child: const Text("snackbar"))
        ],
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: List.generate(5, (index) => Text(randomRoll(),style: TextStyle(fontSize: 32),))
      // )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Row(
      //       children: [
      //         IconButton(
      //             onPressed: () async {
      //           //  DateTime? date = await showDatePicker(
      //           //     context: context,
      //           //     initialDate: DateTime.now(),
      //           //     firstDate: DateTime.now(),
      //           //     lastDate: DateTime(DateTime.now().year+1)
      //           // );
      //           //  if(date!=null){
      //           //    print(date.toString().split(" ")[0]);
      //           //  }

      //            // DateTimeRange? dateRange = await showDateRangePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year+1));
      //            //
      //            // if(dateRange!=null){
      //            //   print(dateRange.start);
      //            // }

      //            time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
      //            setState(() {

      //            });
      //         }, icon: const Icon(Icons.date_range_sharp),),
      //         Text(time==null ? "": time.toString())
      //       ],
      //     )
      //   ],
      // ),
    );
  }

  String randomRoll(){
    var ran= Random();
    int n = ran.nextInt(rolls.length);
    String str = rolls[n];
    rolls.remove(str);
    return str;
  }
}
