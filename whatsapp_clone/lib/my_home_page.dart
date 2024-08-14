import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int tabIndex=3;

  final tabItems=[Home(),Event(),MyCard(),Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[tabIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: BottomNavigationBar(
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            selectedItemColor: Colors.yellow,
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.white,
            // selectedIconTheme: IconThemeData,
            currentIndex: tabIndex,
            onTap: (int i){
              setState(() {
                tabIndex=i;
                print(tabIndex);
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
                icon: Icon(Icons.home_outlined),label: "Home",activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.event),label: "Events"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.add_card),label: "Card"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.person),label: "Profile"),

          ],),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.home,
          size: 300,
        ),
      ),
    );
  }
}

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.event,
          size: 300,
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.card_giftcard,
          size: 300,
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.person,
          size: 300,
        ),
      ),
    );
  }
}

