import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class configureTimer extends StatefulWidget {
  int countdownTime;
  double fontSize;

  configureTimer({this.countdownTime, this.fontSize});

  @override
  State<StatefulWidget> createState() => _timerData(countdownTime: countdownTime, fontSize: fontSize);
}

class _timerData extends State<configureTimer> {
  int countdownTime;
  double fontSize;

  _timerData({this.countdownTime, this.fontSize});

  Timer _timer;
  final _colorList = [
    Colors.red,
    Colors.black,
  ];

  _showTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      //需要执行的内容
      setState(() {
        countdownTime--;
      });
      print(countdownTime);
      if (countdownTime <= 0) {
        t.cancel();
        t = null;
        _GenerationData();
      }
      //t.cancel();		//根据需要停止定时器
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: countdownTime == 0
            ? getDataList()
            : <Widget>[
                Text(countdownTime.toString(),
                    style: TextStyle(
                      color: countdownTime < 5 ? _colorList[0] : _colorList[1],
                      fontSize: fontSize,
                    )),
                Text(
                  '准备开始！',
                  textAlign: TextAlign.center,
                )
              ],
      ),
    );
  }

  @override
  void initState() {
    _showTimer();
    super.initState();
  }

  void dispose() {
    //类似c++中的析构函数
    // TODO: implement dispose
    _timer?.cancel(); //页面销毁时取消定时器（不为null时）
    super.dispose();
  }

  final List<String> data_1_list = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K',
    '小王',
    '大王'
  ];
  List<Widget> rList = [];
  List<String> brandList = [];
  int totalScore = 0;

  getDataList() {
    List<Widget> obList = [];
    List<Widget> obrList = [];

    var rng = new Random();
    int i = 1;
    while (rList.length > 0) {
      int index = rng.nextInt(rList.length);
      if (rList.length == 1) {
        index = 0;
      }
      obList.add(rList[index]);
      rList.removeAt(index);
      if (i == 6) {
        obrList.add(ButtonBar(
          alignment: MainAxisAlignment.center,
          children: new List<Widget>.from(obList),
        ));
        obList.clear();
        i = 0;
      }
      i++;
    }
    return obrList;
  }

  List<String> pokerType = ['', '', 'dk', 'xk', 'rk', 'ht', 'mh', 'rt'];

  _loopData(String str, int count) {
    for (int n = 0; n < count; n++) {
      rList.add(Container(
        width: 30,
        height: 50,
        child: Align(
          key: Key(str),
          child: OutlineButton(
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.normal,
            child: Text(
              str,
              textAlign: TextAlign.center,
            ),
            onPressed:clickState(pokerType[count + n] + str),
          ),
        ),
      ));
    }
  }

  List<Widget> _GenerationData() {
    for (int i = 0; i < data_1_list.length; i++) {
      if (i < 13) {
        _loopData(data_1_list[i], 4);
      } else {
        _loopData(data_1_list[i], 1);
      }
    }
  }

  void _incrementCounter() {
     setState(() {


  });
}

  flop(String key) {
      if (brandList.contains(key)){
        totalScore++;
      } else {
        brandList.add(key);
      }
      return null;
      //print(key);

      //print(totalScore);
  }

  clickState(String key) {
    if(flop(key)==null){
      return null;
    }else {
      () {return null;};
    }
    return (){flop(key);};
    return () {
      if (brandList.contains(key)) {
        return null;
      } else {
        print(key);
        brandList.add(key);
      }
    };

    /*else
      brandList.add(key);*/
  }
}
class TestMyAppState extends State<configureTimer> {
  bool _isButton1Disabled = true;
  int _counter = 1;

  GlobalKey<ScaffoldState> _key;

  /*@override
  void initState() {
    //_isButton1Disabled = false;
  }

  void _incrementCounter() {
   *//* setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _isButton1Disabled = true;
      } else {
        _isButton1Disabled = false;
      }
    });*//*
  }*/

  @override
  Widget build(BuildContext context) {
    _key= new GlobalKey<ScaffoldState>();
    return new MaterialApp(
        home: new Scaffold(
            key: _key,
            appBar: new AppBar(title: new Text("test app")),
            body: new Container(
                alignment: Alignment.center,
                child: new Container(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: buildButtons(),
                    )))));
  }

  List<Widget> buildButtons() {
    List<Widget> list = [
      _buildButton1(_counter),
      _buildSpaceView(20.0), //在两个按钮间添加一点间隔
      _buildButton2(),
      OutlineButton(
        color: Theme.of(context).accentColor,
        textTheme: ButtonTextTheme.normal,
        child: Text(
          'tets',
          textAlign: TextAlign.center,
        ),
        onPressed:_getBtn2ClickListener(),
      ),
    ];

    return list;
  }

  Widget _buildSpaceView(double _height) {
    return new Container(height: _height);
  }

  RaisedButton _buildButton1(int counter) {
    return new RaisedButton(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: new Text(
          'count: ' + counter.toString(),
          style: new TextStyle(
            fontSize: 18.0, //textsize
            color: Colors.white, // textcolor
          ),
        ),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        //shadow
        splashColor: Colors.blueGrey,
        onPressed: _getBtn1ClickListener());
  }

  RaisedButton _buildButton2() {
    return new RaisedButton(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: new Text(
          'click me',
          style: new TextStyle(
            fontSize: 18.0, //textsize
            color: Colors.white, // textcolor
          ),
        ),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        //shadow
        splashColor: Colors.red,
        onPressed: _getBtn2ClickListener());
  }

  Function _getBtn2ClickListener() {
    return null;
  }

  _getBtn1ClickListener() {
    if (_isButton1Disabled) {
      return null;
    } else {
      return () {
        _key.currentState.showSnackBar(new SnackBar(
          content: new Text('Hello!'),
        ));
      };
    }
  }
}
