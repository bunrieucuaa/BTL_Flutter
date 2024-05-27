import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_btl/ice_home.dart';
import 'package:flutter_btl/static/staticColor.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; //index bắt đầu từ 0

  Widget getWidgets(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Favorites"));
      case 1:
        return const Center(child: Text("Notifications"));
      case 2:
        return const IceCreamHomePage();
      case 3:
        return const Center(child: Text("Settings"));
      case 4:
        return const Center(child: Text("Person"));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        //Navbar cong
        bottomNavigationBar: CurvedNavigationBar(
          color: firstColor, //Màu cho thanh navbar
          height: 62,
          backgroundColor: Colors.transparent, //Màu background của button icon
          index: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            Icon(Icons.favorite, color: backgroundColor),
            Icon(Icons.notifications, color: backgroundColor),
            Icon(Icons.home, color: backgroundColor),
            Icon(Icons.settings, color: backgroundColor),
            Icon(Icons.person, color: backgroundColor),
          ],
        ),
        body: getWidgets(_selectedIndex));
  }
}
