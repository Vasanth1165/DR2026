import 'package:flutter/material.dart';
import 'package:stf/anime.dart';
import 'package:stf/animeswitch.dart';
import 'package:stf/smooth.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSwitch(),
    );
  }
}

class MyListItem extends StatelessWidget {
  MyListItem({super.key});
  // list of items
  final items=<Item>[
    Item(colorName: "Black", color: const Color(0xff000000), colorCode: "000000"),
    Item(colorName: "green", color: const Color(0xff72BD20), colorCode: "72BD20"),
    Item(colorName: "yellow", color: const Color(0xffffbb00), colorCode: "FFBB00"),
    Item(colorName: "Dark Green", color: const Color(0xff008737), colorCode: "008737")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: List.generate(
            items.length, (index) =>
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PrItem(item: items[index])));
              },
              child: Container(
                color: items[index].color,
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(items[index].colorCode,style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),),
                ),
              ),
            )),
      ),
    );
  }
}

// model for the item
class Item{
  final String colorName;
  final Color color;
  final String colorCode;
  Item({
    required this.colorName,
    required this.color,
    required this.colorCode
});
}


// preview item screen
class PrItem extends StatelessWidget {
  final Item item;
  const PrItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: AppBar(
        title: Text(item.colorName),
      ),
      body: Center(
        child: Text(
          item.colorCode,
          style: const TextStyle(
            fontSize: 64,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}



// class MyStf extends StatefulWidget {
//   const MyStf({super.key});
//
//   @override
//   State<MyStf> createState() => _MyStfState();
// }
//
// class _MyStfState extends State<MyStf> {
//
//   int x=0;
//
//   @override
//   void initState() {
//     super.initState();
//     // tapped();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   tapped(){
//     setState(() {
//       x++;
//       // Timer(Duration(seconds: 1),(){
//       //   x++;
//       //   tapped();
//       // });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("build step $x");
//     return Scaffold(
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: (){
//               Navigator.push(
//                   context, MaterialPageRoute(
//                   builder: (context)=>
//                       SecondScr(count: x)));
//             },
//             child: Icon(Icons.pages),
//           ),
//           FloatingActionButton(
//             onPressed: tapped,
//             child: Icon(Icons.add),
//           )
//         ],
//       ),
//       body: Center(
//         child: Text("count $x",style: TextStyle(fontSize: 32),),
//       ),
//     );
//   }
// }
//
//
//
// class SecondScr extends StatelessWidget {
//   final int count;
//   final String? roll;
//   final String? name;
//   SecondScr(
//       {super.key, required this.count,this.roll,this.name});
//
//   int x=0;
//
//   @override
//   Widget build(BuildContext context) {
//     print("second step $x");
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           x++;
//           print(x);
//         },
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(count.toString(), style: TextStyle(fontSize: 250),),
//           ),
//           Text(name ?? "VASANTH", style: TextStyle(fontSize: 32),),
//           Text(roll ?? "19A91A0264", style: TextStyle(fontSize: 32),),
//         ],
//       ),
//     );
//   }
// }

