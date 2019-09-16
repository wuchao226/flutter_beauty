import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beauty/card/card_free.dart';
import 'package:flutter_beauty/card/card_recommend.dart';
import 'package:flutter_beauty/card/card_share.dart';
import 'package:flutter_beauty/card/card_special.dart';
import 'package:flutter_beauty/custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;

  const ContentPager({Key key, this.onPageChanged, this.contentPagerController})
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
    //视图比例
    viewportFraction: 0.8,
  );
  List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  void initState() {
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: widget.onPageChanged,
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardFree()),
              _wrapItem(CardSpecial()),
            ],
          ),
        ),
      ],
    );
  }

  _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  ///状态栏样式-沉浸式状态栏
  _statusBar() {
    //黑色沉浸式状态栏，基于SystemUiOverlayStyle.dark 修改 statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

///内容区域控制器
class ContentPagerController {
  PageController _pageController;

  void jumpToPage(int page) {
    _pageController?.jumpToPage(page);
  }
}
