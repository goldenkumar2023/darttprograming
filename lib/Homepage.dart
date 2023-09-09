import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicapp/notification.dart';
import 'package:flutterbasicapp/profile.dart';

import 'home.dart';

class Homepage extends StatefulWidget {
   Homepage({Key? key}) : super(key: key);

   @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final pages = [
    home(),
    notification(),
    profile(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Home Page',
        //     style: TextStyle(
        //         color: Colors.redAccent,
        //         fontWeight: FontWeight.w900,
        //         fontSize: 36),
        //   ),
        // ),
        body:pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: 'notification',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'person',
                backgroundColor: Colors.green),
          ],
          onTap: (index){
            setState(() {
              _selectedIndex=index;
            });
          },
        ),
      ),
    );
  }
}
