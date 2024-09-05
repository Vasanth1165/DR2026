import 'package:flutter/material.dart';
class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController= TabController(length: 3,vsync: this);
  }
  @override
  void Dispose(){
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TabView'),
      bottom: TabBar(tabs: [
        Tab(icon: Icon(Icons.home,),
    ),
    Tab(icon: Icon(Icons.add_card),)
    ])
      ),
      body: TabBarView(
        children: [
          Text('FirstScreen'),
          Text('SecondScreen')
        ],
      ),
    );
  }
}
