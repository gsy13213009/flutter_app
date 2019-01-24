import 'package:flutter/material.dart';
import 'package:flutter_app/animate/animate_demo.dart';
import 'package:flutter_app/launch.dart';
import 'package:flutter_app/paint/SignaturePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeWidget();
  }
}

class _HomeWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("主页"),
      ),
      body: new Wrap(spacing: 10.0, children: [
        new RaisedButton(
          child: new Text("动画"),
          onPressed: (){
            Launch.launch(context, new FadeAppTest());
          },
        ),
        new RaisedButton(
          child: new Text("绘画"),
          onPressed: (){
            Launch.launch(context, new SignaturePage());
          },
        ),
      ]),
    );
  }

  Column buildButtonColum(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}
