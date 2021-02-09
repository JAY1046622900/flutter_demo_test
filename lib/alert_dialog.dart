import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogType extends StatelessWidget {
  Widget titleWidget,contentWidget;
  bool auto;
  AlertDialogType({this.titleWidget,this.contentWidget,this.auto});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoAlertDialog(
      title: this.titleWidget,
      content: Text('准备开始！',textAlign: TextAlign.center,),
      actions: <Widget>[

        CupertinoDialogAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        CupertinoDialogAction(
          child: Text('确认'),
          onPressed: () {},
        ),
      ],
    );
  }
}

