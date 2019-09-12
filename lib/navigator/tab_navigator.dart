import 'package:flutter/material.dart';
import 'package:flutter_beauty/pages/content_pager.dart';

///底部导航栏
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPagerController _contentPagerController =
      ContentPagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffedeef0),
              Color(0xffe6e7ed),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          //页面改变回调
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          //控制内容区域滚动到指定位置
          _contentPagerController.jumpToPage(index);
          //修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem(Icons.folder, "本周", 0),
          _bottomItem(Icons.explore, "分享", 1),
          _bottomItem(Icons.donut_small, "免费", 2),
          _bottomItem(Icons.person, "我的", 3),
        ],
      ),
    );
  }

  ///封装底部Tab
  _bottomItem(IconData iconData, String title, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        iconData,
        color: _activeColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: index == _currentIndex ? _activeColor : _defaultColor),
      ),
    );
  }
}
