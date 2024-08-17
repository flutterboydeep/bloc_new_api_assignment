import 'package:flutter/material.dart';
import 'package:learn_bloc/screens/enterNewpage.dart';
import 'package:learn_bloc/screens/favorite_items.dart';
import 'package:learn_bloc/screens/homepage.dart';

List bodyScreen = [
  EnterNewPage(),
  FavouriteItems(),
];

class MainScreem extends StatefulWidget {
  const MainScreem({super.key});

  @override
  State<MainScreem> createState() => _MainScreemState();
}

class _MainScreemState extends State<MainScreem> {
  @override
  int index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main page"),
      ),
      body: bodyScreen.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(49, 104, 58, 183),
        selectedItemColor: Colors.red,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite),
          ),
        ],
        onTap: (value) {
          index = value;
          setState(() {});
        },
      ),
    );
  }
}
