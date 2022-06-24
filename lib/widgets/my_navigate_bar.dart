import 'package:flutter/material.dart';

import '../pages/ogren_pages/ogren_page.dart';
import '../pages/profil_page.dart';
import '../pages/test_page.dart';

class MyNavigateBar extends StatefulWidget {
  const MyNavigateBar({Key? key}) : super(key: key);

  @override
  _MyNavigateBarState createState() => _MyNavigateBarState();
}

class _MyNavigateBarState extends State<MyNavigateBar> {
  int currentIndex=0;
  final screens=[
    OgrenPage(),
    TestPage(),
    ProfilPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)=>setState(()=>currentIndex=index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Öğren",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: "Test",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_outlined),
            label: "Profil",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}