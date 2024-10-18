import 'package:app_bar/counter_page.dart';
import 'package:app_bar/counter_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => CounterProvider(),
        child: CounterPage(),
      ),
    );
  }
}

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize:64,color: Colors.red),
                children: [
                  TextSpan(
                    text: "Hello\n"
                  ),
                  TextSpan(
                      text: "Technical Hub",
                    style: TextStyle(color: Colors.green)
                  ),
                  // TextSpan(
                  //     text: "Founded back on the 3rd of February 2016, our journey has been quite an adventurously successful one. Over time our team has taken up commercial and social projects and developed apps, games, softwares, websites and a whole lot more. Our experienced developers are certified in an array of languages and can handle anything that comes their way.",
                  //     style: TextStyle(fontSize: 24)
                  // ),
                ]
              ),
            ),

          ),
          SizedBox(
              height :12
          ),
          SelectableText(
              "Founded back on the 3rd of February 2016, our journey has been quite an adventurously successful one. Over time our team has taken up commercial and social projects and developed apps, games, softwares, websites and a whole lot more. Our experienced developers are certified in an array of languages and can handle anything that comes their way.",
              style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}


// slivers
// rich text
// custom painters
// table
// stepper
// chip
// bottom sheet
// expansion tile
// interactive view
// selected text
// refresh
// page route
// builder (layout,orientation)
// state management (Provider,Getx,Redex,Mobx,BLOC,riverpod)
