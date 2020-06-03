import 'package:flutter/material.dart';
import 'check.dart';
import 'Introduction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isMobile;
  
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  isMobile = SystemCheck().isMobile(size.width);
    return Scaffold(
      body: Scrollbar(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black45,
                Colors.black54,
              ],
            ),
          ),
          child: Container(
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                Introduction(isMobile,size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

