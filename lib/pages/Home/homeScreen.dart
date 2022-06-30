import 'package:example/pages/Cart/cartScreen.dart';
import 'package:example/pages/Profile/profileScreen.dart';
import 'package:example/pages/Sorting/sortScreen.dart';
import 'package:flutter/material.dart';

import '../../models/ProfilePerson.dart';

class homeScreen extends StatelessWidget {
  ProfilePerson person;

  homeScreen({Key? key, required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: statefulhomeScreen(person: person),
    );
  }
}

class statefulhomeScreen extends StatefulWidget {
  final ProfilePerson person;
  const statefulhomeScreen({Key? key, required this.person}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<statefulhomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _widgetOptions = <Widget>[
      profileScreen(person: widget.person),
      cartScreen(phone: widget.person.phone),
      sortingScreen(phone: widget.person.phone),
    ];
    super.initState();
  }

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
