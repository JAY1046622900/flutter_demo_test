import 'dart:math';

import 'package:flutter/material.dart';

class testSetState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '测试setState',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: testPage(),
    );
  }
}

class testPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => contentPage();
}

class contentPage extends State<testPage> with TickerProviderStateMixin {
  AnimationController animationController,animationController1;
  var animation,animation1;

  @override
  void initState() {
    animationController =
        new AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            //动画正向执行,正向执行结束后进行反向执行
            if (status == AnimationStatus.completed) {
              animationController.reverse();
              //_isReversePhase = true;
            } //动画反向执行，反向执行结束后一次动画翻转周期结束。当前数字更新到最新的
            if (status == AnimationStatus.dismissed) {
              // animationController.forward();
              // animationController = false;
              // _stateNum += 1;
            }
          });
    //animation = Tween(begin: 0.0, end: -12.0 * pi).animate(animationController);
    RelativeRectTween rectTween = RelativeRectTween(
      //初始位置设置
      begin: const RelativeRect.fromLTRB(
          //子widget 距父布局 left 10.0
          0.0,
          //子widget 距父布局 top 10.0
          0.0,
          //子widget 距父布局 right 10.0
          0.0,
          //子widget 距父布局 bottom 10.0
          0.0),
      //结束位置设置
      end: RelativeRect.fromLTRB(
        //子widget 距父布局 left 100.0
        15.0,
        //子widget 距父布局 top 100.0
        0.0,
        //子widget 距父布局 right 100.0
        15.0,
        //子widget 距父布局 bottom 100.0
        0.0,
      ),
    );

    //关联 controller
    animation = rectTween.animate(animationController);

    /* ..addListener(() {
        setState(() {});
      });*/
    //动画数值使用0度角到90度角
    // _animation = Tween(begin: _zeroAngle, end: pi / 2).animate(_controller);
    animationController1 =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation1 = Tween(begin: 1.0, end: 0.2).animate(animationController1);
    super.initState();
  }

  bool click = false;

  onEnd() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: GestureDetector(
            onTap: () {
              animationController..forward();
              setState(() {
                click = !click;
              });
            },
            child: Container(
                width: 30,
                height: 50,
                child: OutlineButton(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Stack(children: <Widget>[
                  PositionedTransition(
                    rect: animation,
                    child: Container(
                      color: click ? Colors.blue : Colors.red,
                      //child: click ? Text('1') : Text('2'),
                    ),
                  )
                ])))));
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            click = !click;
          });
        },
        child: AnimatedContainer(
          height: click ? 200 : 200,
          width: click ? 200 : 100,
          color: click ? Colors.blue : Colors.red,
          duration: Duration(seconds: 3),
          //child: Text(click?'1':'2'),
        ),
      ),
    );
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            click = !click;
          });
        },
        child: AnimatedContainer(
          height: click ? 200 : 200,
          width: click ? 200 : 100,
          color: click ? Colors.blue : Colors.red,
          duration: Duration(seconds: 3),
          //child: Text(click?'1':'2'),
        ),
      ),
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          scale: animation.value,
          child: child,
        );
      },
      child: FlutterLogo(
        size: 60,
      ),
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
      child: FlutterLogo(
        size: 60,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('测试setState'),
        actions: [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //child: Icon(Icons.search),
          ),
          //Icon(Icons.more_vert),
          Text(
            '第一个开始页面',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      body: Column(
        children: dataList(),
      ),
    );
  }

  List<Widget> list = [];

  List<Widget> dataList() {
    //if(list.length>0)return list;
    for (int i = 0; i < 3; i++) {
      list.add(OutlineButton(
        child: Text('按钮' + i.toString()),
        onPressed: ck3(),
      ));
    }

    list.add(Transform.rotate(
      alignment: Alignment.center,
      angle: animationController.value,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Text('旋转'),
      ),
    ));

    return list;
  }

  bool bl = true;

  ck1() {
    return () {
      print('设置为关闭');
      setState(() {
        bl = false;
      });
    };
  }

  ck2() {
    if (!bl) {
      return null;
    } else {
      return () {
        print('2');
      };
    }
  }

  ck3() {
    if (!bl) {
      return null;
    } else {
      return () {
        print('设置为关闭');
        setState(() {
          bl = false;
        });
      };
    }
  }
}
