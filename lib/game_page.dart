import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'alert_dialog.dart';
import 'configure_timer.dart';
import 'main.dart';

class GamePage extends StatelessWidget {
  BuildContext lastPage;

  GamePage({this.lastPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: gamePageHome(
        title: '进入页面二',
        lastPage: lastPage,

      ),
    );
  }
}

class gamePageHome extends StatefulWidget {
  BuildContext lastPage;
  int startCont;

  gamePageHome({Key key, this.title, this.lastPage,this.startCont}) : super(key: key);

  final String title;

  @override
  _MyGameHomePageState createState() =>
      _MyGameHomePageState(lastPage: lastPage);
}

class _MyGameHomePageState extends State<gamePageHome> {
  BuildContext lastPage;
  configureTimer startTimer;
  int startCont;
  _MyGameHomePageState({this.lastPage,this.startCont});

  /*Widget startCount(){
    configureTimer startTimer = new configureTimer(countdownTime:10,fontSize: 50,);
    return Visibility(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(startTimer.countdownTime.toString())
        ] ,
      ),),
      visible: true,);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.pop(lastPage);
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => MyApp()));
              print('返回');
            }),
      ),
      body: configureTimer(countdownTime: 1,fontSize: 50,),
      // AlertDialogType(titleWidget: new configureTimer(countdownTime:10,fontSize: 50,))
      /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: []
        ),
      ),*/
    );
  }
}

class FaceGeneration {
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

  FaceGeneration() {
    if (rList.length == 0)
      _GenerationData();
  }

  _getDataList() {
    List<Widget> obList = [];
    List<Widget> obrList = [configureTimer(countdownTime: 10,fontSize: 50,)];

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
        )
        );
        obList.clear();
        i = 0;
      }
      i++;
    }
    return obrList;
  }

  _loopData(String str, int count) {
    for (int n = 0; n < count; n++) {
      rList.add(Container(
        width: 30,
        height: 50,
        child: Align(
          key: Key(str),
          child: OutlineButton(
            textTheme: ButtonTextTheme.normal,
            child: Text(
              str,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              print(str);
            },
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
}
