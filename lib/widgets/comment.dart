import 'package:flutter/material.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/utils/profile_img_path.dart';

class Comment extends StatelessWidget {

  final String username;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  const Comment({Key key, this.username, this.showProfile = false, this.dateTime, this.caption }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              getProfileImgPath(username)
            ),
            radius: profile_radius,
          ),
        ),
        Visibility(
          visible: showProfile,
            child: SizedBox(width: common_xs_gap,)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: username,
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text: ''
                      ),
                      TextSpan(
                          text: 'I am missing summer soooooooo0ooooooooo much ~~~!!'
                      ),
                    ]
                ),
              ),
              SizedBox(height: common_xxxs_gap,),
              Visibility(
                  visible: dateTime != null,
                  child: dateTime == null? SizedBox() : Text(dateTime.toIso8601String(), style: TextStyle(color: Colors.grey[600], fontSize: 10),)),
            ],
          ),
        )
      ],
    );
  }
}
