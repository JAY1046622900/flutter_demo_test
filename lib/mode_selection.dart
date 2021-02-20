import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/test_setState.dart';

import 'game_page.dart';

class ModeSelection {
  List<Widget> createOutlineButtonsArr = [];

  void createOutlineButtons(List<String> textNames,BuildContext context) {
    //print(context);
    print("执行");
    for (int i = 0; i < textNames.length; i++) {

      createOutlineButtonsArr.add(new OutlineButton(
        borderSide: BorderSide(color: Colors.blue, style: BorderStyle.none),
        onPressed: () {
          Navigator.push(
              context,i==0? MaterialPageRoute(builder: (context) => GamePage(lastPage:context)):i==1?MaterialPageRoute(builder: (context) => testSetState()):MaterialPageRoute(builder: (context) => GamePage(lastPage:context)),);
          // Respond to button press
        },
        child: Text(
          textNames[i],
          style: TextStyle(fontSize: 30),
        ),
      ));
      if (i > 0 || i < textNames.length - 1) {
        createOutlineButtonsArr.add(new SizedBox(
          height: 50,
        ));
      }
    }
  }

  Center HomeSelect(BuildContext context) {
    createOutlineButtons(['模式一', '模式二', '模式三'], context);
    print(createOutlineButtonsArr);
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.

      child: Column(
        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).

        mainAxisAlignment: MainAxisAlignment.center,
        children: createOutlineButtonsArr,

        /* ButtonBar(children: <Widget>[
    ],)*/
      ),
    );
  }
}
