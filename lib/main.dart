import 'package:flutter/material.dart';
import './trial.dart';

main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Vanamala Srikanth",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
      ),
      home: Aboutme(),
    );
  }
}