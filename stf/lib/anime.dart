import 'package:flutter/material.dart';

class MyAnime extends StatefulWidget {
  const MyAnime({super.key});

  @override
  State<MyAnime> createState() => _MyAnimeState();
}

class _MyAnimeState extends State<MyAnime> {

  bool _isAnime =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AnimatedContainer(duration: duration)
          // AnimatedAlign(alignment: alignment, duration: duration)
          // AnimatedOpacity(opacity: opacity, duration: duration)
          // AnimatedPadding(padding: padding, duration: duration)
          // AnimatedPositioned(child: child, duration: duration)

          // Hero
          // Center(
          //   child: GestureDetector(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=> Scr2()));
          //     },
          //     child: Hero(
          //       tag: "hero",
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //     ),
          //   ),
          // )
          
          Center(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _isAnime = !_isAnime;
                });
              },
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                padding: EdgeInsets.all(20),
                width: _isAnime ? 500 : 200,
                height: _isAnime ? 300 : 200,
                decoration: BoxDecoration(
                  color: _isAnime ? Colors.green : Colors.red,
                  // shape: BoxShape.circle
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Scr2 extends StatelessWidget {
  const Scr2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Hero(
        //   tag: "hero",
        //   child: Container(
        //
        //   ),
        // ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Hero(
          tag: "hero",
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

