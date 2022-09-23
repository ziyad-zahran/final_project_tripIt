import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:final_project_ziad_hamdy/bottom_nav_bar/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'screens/favourite_view.dart';
import 'screens/location/view.dart';
import 'screens/notifications_view.dart';
import 'screens/tours_view.dart';

class BottomNavBarScreen extends StatefulWidget {
  BottomNavBarScreen({Key? key, this.token}) : super(key: key);
  String? token;

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentPage = 2;
  final List<Widget> pages =  [
    ToursPage(),
     FavouritePage(),
    LocationView(),
     NotificationsPage(),
     ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentPage,
        circleSize: 40.0,
        blurShadowRadius: 20.0,
        barBackgroundColor: Colors.white,
        circleColor: Color(0xff24D4A4),
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: [
          TabData(
            icon: Icons.home_outlined,
            iconSize: 30,
          ),
          TabData(
            icon: Icons.favorite_outline,
            iconSize: 30,
          ),
          TabData(
            icon: Icons.shop_two_rounded,
            iconSize: 30,
          ),
          TabData(
            icon: Icons.calendar_month,
            iconSize: 30,
          ),
          TabData(
            icon: Icons.person_outlined,
            iconSize: 30,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
