import 'package:flutter/material.dart';
import 'package:flutter_app/launch.dart';
import 'package:flutter_app/paint/SignaturePage.dart';

/**
 * fade in 动画的demo
 */
class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Fade Demo",
      theme: new ThemeData(primaryColor: Colors.red),
      home: new MyFadeTest(),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  final title = "hhhhhhh";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFadeTest();
  }
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    curvedAnimation =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: curvedAnimation,
            child: new FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          controller.forward();
//          Launch.launch(context, new SignaturePage());
        },
        child: new Icon(Icons.brush),
        tooltip: "Fade",
      ),
    );
  }
}
