import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/screens/camera_page.dart';
import 'package:insta_flut/screens/detail_page.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 243, 255, 1.0),
      body: SafeArea(
        child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                Image.asset('assets/top_logo.png'),
                   Padding(
                     padding: const EdgeInsets.all(common_gap),
                     child: GestureDetector(
                       onTap: _onTapFunc,
                       child: LiquidSwipe(
                          pages: pages,
                          enableLoop: true,
                          fullTransitionValue: 500,
                          enableSlideIcon: true,
                          waveType: WaveType.liquidReveal,
                          positionSlideIcon: 0.5,
                        ),
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(common_gap),
                    child: Image.asset('assets/map.png',),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(common_gap),
                    child: GestureDetector(
                        onTap: _onTapFunc2,
                        child: Image.asset('assets/category.png',)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(common_gap),
                    child: GestureDetector(
                        onTap: _onTapFunc,
                        child: Image.asset('assets/sale.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(common_gap),
                    child: Image.asset('assets/search_bar.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(common_gap),
                    child: InkWell(
                        onTap: _onTapFunc,
                        child: Image.asset('assets/ad.png')),
                  ),


                ]),
      )
      ],
    ),)
    ,
    );
  }

  final pages = [
    Container(child: Image.asset('assets/chae41.png')),
    Container(child: Image.asset('assets/chae4.png')),
    Container(child: Image.asset('assets/chae2.png')),
    Container(child: Image.asset('assets/chae3.png')),
    Container(child: Image.asset('assets/chae1.png')),
    Container(child: Image.asset('assets/chae5.png')),
  ];

  void _onTapFunc(){
    final route = MaterialPageRoute(builder: (context)=>DetailPage());
    Navigator.push(context, route);
  }
  void _onTapFunc2(){
    final route = MaterialPageRoute(builder: (context)=>CameraPage());
    Navigator.push(context, route);
  }
}
