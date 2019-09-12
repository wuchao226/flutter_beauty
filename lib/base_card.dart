import 'package:flutter/material.dart';

///卡片基类
class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => new BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(BaseCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
