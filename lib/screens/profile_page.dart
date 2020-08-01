import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/utils/profile_img_path.dart';
import 'package:insta_flut/widgets/profile_side_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpened = false;
  num menuWidth;
  int duration = 250;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool _tabIconGridSelected = true;
  double _gridMargin = 0;
  double _myImgGridMargin = size.width;


  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: duration));
    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    menuWidth = size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      color: Color.fromRGBO(217, 228, 255, 1.0),
      transform: Matrix4.translationValues(
        _menuOpened ? size.width - menuWidth : size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMenu()
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      color: Color.fromRGBO(238, 243, 255, 1.0),
      transform: Matrix4.translationValues(
        _menuOpened ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _usernameIconButton(),
            Expanded(
                child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    _getProfileHeader,
                    _username(),
                    _userBio(),
                    _editProfileBtn(),
                    _getTabIconButtons,
                    _getAnimatedSelectedBar,
                  ]),
                ),
                _getImageGrid(context)
              ],
            )),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        AnimatedContainer(
          transform: Matrix4.translationValues(_gridMargin, 0, 0),
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          child: _imageGrid,
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          child: Image.asset('assets/profile_text.png'),
        )

      ],
    ),
  );

  GridView get _imageGrid => GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 3,
    childAspectRatio: 1,
    children: _buildGridTiles(9),
  );

//  CachedNetworkImage _gridImgItem(int index) => CachedNetworkImage(
//    fit: BoxFit.cover,
//    imageUrl: "https://picsum.photos/id/$index/100/100");
  List<Widget> _buildGridTiles(numberOfTiles) {
    List<Container> containers = new List<Container>.generate(numberOfTiles,
            (int index) {
          //index = 0, 1, 2,...
          final imageName = index < 9 ?
          'assets/ceo${index + 1}.png' : 'assets/ceo${index + 1}.png';
          return new Container(
            child: new Image.asset(
                imageName,
                fit: BoxFit.fill
            ),
          );
        });
    return containers;
  }


  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'Fashionistar of the year!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'Chae Won Song',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/ceo1.png'),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWidget('123'),
                  _getStatusValueWidget('324'),
                  _getStatusValueWidget('4536'),
                ]),
                TableRow(children: [
                  _getStatusLabelWidget('Point'),
                  _getStatusLabelWidget('Posts'),
                  _getStatusLabelWidget('Likes'),
                ]),
              ],
            ),
          )
        ],
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300),
              )),
        ),
      );

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text(
            'ChaeONE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )),
        IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              semanticLabel: 'Show menu',
            ),
            onPressed: () {
              _menuOpened ? _animationController.reverse() : _animationController.forward();
              setState(() {
                _menuOpened = !_menuOpened;
              });
            })
      ],
    );
  }

  Widget get _getTabIconButtons => Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/grid.png'),
              color: _tabIconGridSelected?Colors.black:Colors.black26,),
              onPressed: () {
                _setTab(true);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/saved.png'),
              color: _tabIconGridSelected?Colors.black26:Colors.black,),
              onPressed: () {
                _setTab(false);
              },
            ),
          ),
        ],
      );

  Widget get _getAnimatedSelectedBar => AnimatedContainer(
        alignment: tabAlign,
        duration: Duration(milliseconds: duration),
        curve: Curves.easeInOut,
        color: Colors.transparent,
        height: 1,
        width: size.width,
        child: Container(
          height: 1,
          width: size.width / 2,
          color: Colors.black87,
        ),
      );

  _setTab(bool tabLeft){
    setState(() {
      if (tabLeft){
        this.tabAlign = Alignment.centerLeft;
        this._tabIconGridSelected =true;
        this._gridMargin = 0;
        this._myImgGridMargin = size.width;
      }else{
        this.tabAlign = Alignment.centerRight;
        this._tabIconGridSelected = false;
        this._gridMargin = -size.width;
        this._myImgGridMargin = 0;
      }
    });
  }

}
