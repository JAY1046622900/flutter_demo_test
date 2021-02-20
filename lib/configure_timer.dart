import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class configureTimer extends StatefulWidget {
  int countdownTime;
  double fontSize;

  configureTimer({this.countdownTime, this.fontSize});

  @override
  State<StatefulWidget> createState() =>
      _timerData(countdownTime: countdownTime, fontSize: fontSize);
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
      }
      //t.cancel();		//根据需要停止定时器
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: countdownTime == 0
          ? pokeData()
          : Text(countdownTime.toString(),
              style: TextStyle(
                color: countdownTime < 5 ? _colorList[0] : _colorList[1],
                fontSize: fontSize,
              )),
      /*  child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: countdownTime == 0
            ? pokeGenerationData()
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
      */
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
}

class pokeData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => pokeGenerationData();
}

class pokeGenerationData extends State<pokeData> {
  @override
  void initState() {
    _GenerationData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getPokeList(),
    );
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
    '小',
    '大'
  ];

  List<bool> data_1bl_list = [];
  List<Widget> rList = [];
  String keyBl = '';
  Map<String, bool> keyBlMap = new Map();
  Map<String, String> keyEqualMap = new Map();
  List<String> brandList = [];
  int totalScore = 0;

  List<Widget> obrList = [];
  List<String> KeyList = [];
  List<String> KeyList1 = [];

  List<Widget> getPokeList() {
    print("得分：" + totalScore.toString());
    if (KeyList.length > 0) _GenerationData1();
    return obrList;
  }

  getDataList() {
    var rng = new Random();
    while (KeyList1.length > 0) {
      int index = rng.nextInt(KeyList1.length);
      if (KeyList1.length == 1) {
        index = 0;
      }
      KeyList.add(KeyList1[index]);
      KeyList1.removeAt(index);
    }
  }

  List<String> pokerType = ['', '', '♔', '♕', '♣', '♦', '♥', '♠'];

  _loopData(String str, int count) {
    for (int n = 0; n < count; n++) {
      String keyName = pokerType[count + n] + str;
      KeyList1.add(keyName);
      keyBlMap.addAll({keyName: true});
      keyEqualMap.addAll({keyName: str});
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
    getDataList();
  }

  List<Widget> _GenerationData1() {
    List<Widget> obList = [];
    obrList.clear();
    obrList.add(Align(
      child:Text(totalScore.toString(),style: TextStyle(fontSize: 30,color: Colors.red),),
    ));
    int i = 1;
    KeyList.forEach((k) {
      obList.add(Container(
        key: Key(k),
        width: 30,
        height: 50,
        child: Align(
          key: Key(k),
          child: OutlineButton(
            //color: Theme.of(context).accentColor,
            key: Key(k),
            textTheme: ButtonTextTheme.normal,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: Text(
              k,
              textAlign: TextAlign.center,
            ),
            onPressed: clickState(k),
          ),
        ),
      ));
      if (i == 6) {
        obrList.add(ButtonBar(
          alignment: MainAxisAlignment.center,
          children: new List<Widget>.from(obList),
        ));
        obList.clear();
        i = 0;
      }
      i++;
    });
  }

  clickState(String key) {
    if (keyBlMap[key]) {
      return () {
        if (brandList.contains(keyEqualMap[key])) {
          totalScore++;
        } else if (key == '小' || key == '大') {
          if (brandList.contains('小') || brandList.contains('大')) totalScore++;
        }
        brandList.add(keyEqualMap[key]);
        setState(() {
          keyBlMap[key] = false;
        });
      };
    } else {
      return null;
    }
  }

  void dispose() {
    //类似c++中的析构函数
    // TODO: implement dispose
    super.dispose();
  }
}