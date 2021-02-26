import 'package:flutter/material.dart';

import 'configure_timer.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(lastPage);
             /* Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => MyApp()));*/
              print('返回');
            }),
      ),
      body: configureTimer(countdownTime: 1,fontSize: 50,),
    );
  }
}

