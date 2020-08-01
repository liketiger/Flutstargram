import 'package:flutter/material.dart';
import 'package:insta_flut/screens/camera_page.dart';
import 'package:insta_flut/screens/feed_page.dart';
import 'package:insta_flut/screens/home_page.dart';
import 'package:insta_flut/screens/profile_page.dart';
import 'package:insta_flut/screens/search_page.dart';

import 'constants/size.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    Container(color: Colors.primaries[2],),
    FeedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    if(size==null){
      size = MediaQuery.of(context).size;
    }
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[900],
        selectedItemColor: Color.fromRGBO(26, 229, 190, 1.0),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(217, 228, 255, 1.0),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(activeIconPath: "assets/home_selected.png", iconPath: "assets/home.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/heart_selected.png", iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(iconPath: "assets/add.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/search_selected.png", iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/profile_selected.png", iconPath: "assets/profile.png"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
    throw UnimplementedError();
  }
  BottomNavigationBarItem _buildBottomNavigationBarItem({String activeIconPath, String iconPath}){
    return BottomNavigationBarItem(
      activeIcon: activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
      icon: ImageIcon(AssetImage(iconPath)),
      title: Text(''),
      );
}
  void _onItemTapped(int index){
    if(index == 2){
        openCamera(context);
    }else{
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  openCamera(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage()
      )
    );
  }
}