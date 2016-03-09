// Copyright 2016, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usage/usage.dart';

Future main() async {
  runApp(new Container());
  String ga = create(); // await Analytics.create('UA-67589403-4', 'ga_test', '1.0');
  print("ga = $ga");
  runApp(new MaterialApp(
    title: 'Usage Example',
    theme: new ThemeData.dark(),
    routes: <String, RouteBuilder>{
      '/': (RouteArguments args) => new FlutterDemo(null)
    }
  ));
}

class FlutterDemo extends StatefulComponent {
  FlutterDemo(this.ga);
  Analytics ga;
  State createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _times = 0;

  void _handleButtonPressed() {
    config.ga.sendEvent('button', 'pressed');
    setState(() {
      _times++;
    });
  }

  void _handleOptIn(bool value) {
    // setState(() {
    //   config.ga.optIn = value;
    // });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text('Usage Example')
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: new Text("Button pressed $_times times.")
          ),
          new ListItem(
            // onTap: () => _handleOptIn(!config.ga.optIn),
            // left: new Checkbox(
            //   value: config.ga.optIn,
            //   onChanged: _handleOptIn
            // ),
            primary: new Text("Opt in to analytics")
          ),
        ],
        justifyContent: FlexJustifyContent.spaceAround
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(icon: Icons.add),
        onPressed: _handleButtonPressed
      )
    );
  }
}
