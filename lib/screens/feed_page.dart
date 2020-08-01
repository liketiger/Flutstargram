import 'package:flutter/material.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/utils/profile_img_path.dart';

class FeedPage extends StatelessWidget {
  final List<String> users = List.generate(10, (i) => 'Shop $i');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(238, 243, 255, 1.0),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return _item(users[index]);
          },
          separatorBuilder: (context, index){
            return Divider(thickness: 1, color: Colors.grey[300],);
          },
        ),
      ),
    );
  }
  ListTile _item(String user){
    return ListTile(
      leading:  CircleAvatar(
        radius: profile_radius,
        backgroundImage: AssetImage('assets/ceo7.png'),
      ),
      title: Text(user),
      subtitle: Text('문의 주신 상품이 입고 되었습니다!!'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amberAccent[700],
            border: Border.all(color: Colors.black54, width: 0.5),
            borderRadius: BorderRadius.circular(6)
        ),
        child: Text(
          '메시지 확인',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
