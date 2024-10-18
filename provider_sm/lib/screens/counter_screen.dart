import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/counter_provider.dart';
import 'package:provider_sm/widgets/circle_button_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(builder:(context,val,child){
          return Text("${val.count}",style: TextStyle(fontSize: 128),);
        },),
      ),
      floatingActionButton: CircleButton(
        onTap: (){
          context.read<CounterProvider>().inc();
        },
        icon: Icons.add,
      )
    );
  }
}
