import 'package:cryptocurrency_app/pages/components/notification.dart';
import 'package:cryptocurrency_app/pages/components/profile.dart';
import 'package:cryptocurrency_app/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    NotificationPage(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    // double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // backgroundColor: Colors.grey.shade200,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Color(0xffFB700),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        onTap: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.home,
              size: myHeight * 0.03,
              color: Colors.blue.shade600,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.explore_rounded,
              size: myHeight * 0.03,
              // color: Color(0xffFBC700),
              color: Colors.blue.shade600,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.notifications_none_rounded,
              size: myHeight * 0.03,
              // color: Color(0xffFBC700),
              color: Colors.blue.shade600,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.account_circle_rounded,
              size: myHeight * 0.03,
              color: Colors.blue.shade600,

              // color: Color(0xffFBC700),
            ),
          ),
        ],
      ),
    ));
  }
}
