import 'package:flutter/material.dart';
import 'package:insta_flut/main_page.dart';
import 'package:insta_flut/screens/auth_page.dart';

import 'constants/material_white_color.dart';

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: AuthPage(),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}



