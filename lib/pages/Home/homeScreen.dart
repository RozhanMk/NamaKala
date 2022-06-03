import 'package:example/pages/Home/body.dart';
import 'package:example/pages/Profile/profileScreen.dart';
import 'package:example/pages/Sorting/sortScreen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: statefulhomeScreen(),
    );
  }
}

class statefulhomeScreen extends StatefulWidget {
  const statefulhomeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<statefulhomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    profileScreen(),
    Text(
      'Index 1: buy',
    ),
    sortingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "پروفایل",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: "سبد",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort_rounded),
            label: "دسته بندی",
          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(110, 10, 138, 1),
        unselectedItemColor: Color.fromARGB(255, 212, 196, 218),
        onTap: _onItemTapped,
      ),
    );
  }
}
