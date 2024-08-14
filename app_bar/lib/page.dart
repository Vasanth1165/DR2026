import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currPage=0;
  int flag=0;
  final pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: pageController,
        onPageChanged: (int i){
          if(i==3){
            flag=1;
          }
          currPage=i;
        },
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(flag==0){
            pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOutCirc);
          }else{
            pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.bounceInOut);
          }
        },
        child: Icon(  Icons.arrow_forward_ios),
      ),
    );
  }
}
