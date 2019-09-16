import 'package:flutter/material.dart';

///卡片基类
class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottomTitleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    //裁剪圆角
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias, //抗锯齿
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            topContent(),
            bottomContent(),
          ],
        ),
      ),
    );
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 26, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            //底部对齐
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              topTitle(''),
              topTitle2(''),
            ],
          ),
          subTitle(''),
        ],
      ),
    );
  }

  bottomContent() {
    return Container();
  }

  subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(color: subTitleColor, fontSize: 12),
      ),
    );
  }

  topTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22),
    );
  }

  topTitle2(String title) {
    return Container();
  }

  bottomTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: bottomTitleColor),
    );
  }
}
