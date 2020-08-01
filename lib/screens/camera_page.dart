import 'package:flutter/material.dart';
import 'package:insta_flut/screens/detail_page.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _topName = '';
  var _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(238, 243, 255, 1.0),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          _galleryPage(),
          _galleryPage(),
          _galleryPage(),
          _galleryPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Color.fromRGBO(6, 53, 201, 1.0),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(217, 228, 255, 1.0),
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/grid.png')),
            title: Text('MAN'),
          ),BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
            title: Text('WOMAN'),
          ),BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
            title: Text('VINTAGE'),
          ),BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
            title: Text('BRAND'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
  void _onItemTapped(BuildContext context, int index){
    _pageController.animateToPage(index, curve: Curves.easeInOut, duration: Duration(milliseconds: 200),);
  }

  Widget _galleryPage(){
    return Container(
      color: Color.fromRGBO(238, 243, 255, 1.0),
      child: ListView(
        children: <Widget>[
          Image.asset('assets/woman.png'),
          Image.asset('assets/standard.png'),
          GestureDetector(
              onTap: _onTap,
              child: Image.asset('assets/shop_list.png')),
        ]
        ,

      ),
    );
  }Widget _takePhotoPage(){
    return Container(color: Colors.purple);
  }Widget _takeVideoPage(){
    return Container(color: Colors.deepOrange);
  }

  void _onTap(){
    final route = MaterialPageRoute(builder: (context)=>DetailPage());
    Navigator.push(context, route);
  }
}
