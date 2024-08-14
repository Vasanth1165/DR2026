import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  int currIndex=0;

  final li=<String>["https://cdn.pixabay.com/photo/2023/10/18/15/30/statue-8324499_640.jpg",
    "https://media.istockphoto.com/id/913075602/photo/sugarloaf-mountain-in-rio-de-janeiro-brazil.webp?b=1&s=612x612&w=0&k=20&c=TH_S-lbX02RtIWVmsYVXPALUYDkX2rLI_mkCeu-jXmU=",
    "https://media.istockphoto.com/id/1477111155/photo/tropical-beach-landscape.webp?b=1&s=612x612&w=0&k=20&c=mIZn6akrD2Po8RKOgi-IEf_Nh8mEKnWu3COISmb4y1Q="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
                aspectRatio: 9/16,
                child: Image(image: NetworkImage(li[currIndex]),fit: BoxFit.cover,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  if(currIndex==0){
                    setState(() {
                      currIndex=li.length-1;
                    });
                  }else{
                    setState(() {
                      currIndex--;
                    });
                  }
                }
                    , icon: Icon(Icons.arrow_back_ios)),
                IconButton(onPressed: (){
                  if(currIndex==li.length-1){
                    setState(() {
                      currIndex=0;
                    });
                  }else{
                    setState(() {
                      currIndex = currIndex+1;
                    });
                  }
                }, icon: Icon(Icons.arrow_forward_ios))
              ],
            )
          ],
        ),
      ),
    );
  }
}
