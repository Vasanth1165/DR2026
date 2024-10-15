import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage  extends StatelessWidget{
  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context,listen: false);
    debugPrint("build ${counterProvider.count}");
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
            builder:(context,state,child){
              return Text("${state.count}",
                style: TextStyle(fontSize: 128),
              );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){
            counterProvider.inc();
          },child: Icon(Icons.add),),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(onPressed: (){
            counterProvider.dec();
          },child: Icon(Icons.remove),)
        ],
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier{

  int _count = 0 ;
  int get count => _count;

  void inc(){
    _count++;

    notifyListeners();
    print("inc $_count");
  }

  void dec(){
    _count--;

    notifyListeners();
    print("dec $_count");
  }


}

