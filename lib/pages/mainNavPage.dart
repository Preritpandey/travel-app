import 'package:flutter/material.dart';
import 'package:travel/pages/barItemPage.dart';
import 'package:travel/pages/homePage.dart';
import 'package:travel/pages/myPage.dart';
import 'package:travel/pages/searchPage.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  List pages = [
    HomePage(),
    BarItem(),
    SearchPage(),
    MyPage(),
  ];

  int curIndex = 0;

  void onTap(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: curIndex,
          showSelectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(label: "apps", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "bar chart", icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                label: "Search bar", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "Person Icon", icon: Icon(Icons.person)),
          ]),
    );
  }
}
