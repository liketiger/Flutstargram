import 'package:flutter/material.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/main_page.dart';
import 'package:insta_flut/screens/auth_page.dart';
import 'package:insta_flut/screens/home_page.dart';

class ShopSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey[300]))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: Text(
              '카테고리',
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'New in',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Outer',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Top',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Bottom',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Ops',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),FlatButton.icon(
              onPressed: (){
                final route = MaterialPageRoute(builder: (context)=>MainPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Acc',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
