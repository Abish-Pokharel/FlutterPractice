import 'package:flutter/material.dart';
import 'package:insta_app/Instagram.dart';
import 'package:insta_app/id_card.dart';
import 'package:insta_app/login_page.dart';
import 'package:insta_app/settings.dart';

class Buttom_Bar extends StatefulWidget {
  const Buttom_Bar({super.key});

  @override
  State<Buttom_Bar> createState() => _Buttom_BarState();
}

class _Buttom_BarState extends State<Buttom_Bar> {
  List<Widget> list = [Login_page(), Instagram(), Id_card(), Settings()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.start),
              label: "login",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Id"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
