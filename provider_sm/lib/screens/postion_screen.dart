import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/postion_provider.dart';
import 'package:provider_sm/widgets/circle_button_widget.dart';

class PostionScreen extends StatelessWidget {
  const PostionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hi= MediaQuery.sizeOf(context).height;
    final wi= MediaQuery.sizeOf(context).width;
    final ran= Random();
    return Scaffold(
        body: Consumer<PostionProvider>(
          builder: (context,pos,child){
            return Stack(
              children: [
                for(int i=0;i<pos.items;i++)
                  Positioned(
                    top: ran.nextInt(hi.toInt()).toDouble(),
                      left: ran.nextInt(wi.toInt()).toDouble(),
                      child: SvgPicture.network(
                        "https://storage.googleapis.com/cms-storage-bucket/0b591100c77c7f332b7f.svg",height: 100,width: 100,)
                  )
              ],
            );
          },
        ),
        floatingActionButton: CircleButton(
          onTap: (){
            context.read<PostionProvider>().add();
          },
          icon: Icons.add,
        )
    );
  }
}
