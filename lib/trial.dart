import 'package:flutter/material.dart';
import 'dart:html' as html;

class Aboutme extends StatelessWidget {

  final List<Widget> profileButtons = [
    OutlineButton(
      child: Text("  GitHub  ",style: TextStyle(color: Colors.blue)),
      onPressed: ()=> html.window.open("https://www.github.com/srikanth7785", "GitHub Profile"),
    ),
    OutlineButton(
      child: Text("Hackerrank",style: TextStyle(color: Colors.blue)),
      onPressed: ()=> html.window.open("https://www.hackerrank.com/srikanth7785", "Hackerrank Profile"),
    ),
    OutlineButton(
      child: Text(" Linkedin ",style: TextStyle(color: Colors.blue)),
      onPressed: ()=> html.window.open("https://www.linkedin.com/in/vanamalasrikanth", "LinkedIn Profile"),
    ),
    OutlineButton(
      child: Text("  Othello ",style: TextStyle(color: Colors.blue)),
      onPressed: ()=> html.window.open("https://play.google.com/store/apps/details?id=com.srikanth7785.othello", "Othello"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedPadding(
          padding: EdgeInsets.only(left:10,top:10,bottom: 10, right: 10.0),
          duration: Duration(milliseconds: 500),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Welcome(width:width),
              SizedBox(height: 30.0),
              Introduction(width: width,height: height,),
              SizedBox(height:30.0),
              Center(
                child: width >= 550 ? OnlineProfile(profileButtons: profileButtons) : Column(children: profileButtons),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Introduction extends StatelessWidget
{
  final width;
  final height;

  Introduction({@required this.width, @required this.height, Key key}) : super(key: key);
  profileImage(context) => Container(
  height: width < 440 ? height * 0.25 : width * 0.25,
  width: width < 440 ? height * 0.25 : width * 0.25,

  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: NetworkImage('https://avatars0.githubusercontent.com/u/46991810?s=400&u=e969e0f40e60cd5c81451a766c7a9c20e5c39499&v=4'),
      alignment: Alignment.center,
      fit: BoxFit.cover,
    ),
  ),
  );

  profileInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Hello there! I am",
      // textScaleFactor: 2,
      style: TextStyle(color: Colors.blue,
        fontSize: width < 440 ? (width * 0.075) * 0.6 : width > 1000 ? (width * 0.02) * 0.6 : (width * 0.035) * 0.6,
      ),
      ),
      Text("Srikanth",
      // textScaleFactor: 3,
      style: TextStyle(
        // fontSize: 35.0,
      fontSize: width < 440 ? width * 0.095 : width > 1000 ? width * 0.05 : width * 0.055,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),),

      SizedBox(height: 15.0),

      Text(
      "I'm an Android Application Developer inspired by the cross platform functionality of Flutter\n"
      "As it can be used to develop Android, iOS as well as Web Applications, with single code base\n\n"
      "I also have a couple of Apps on Google Play Store developed using Flutter.\n"
      "One of them, named Othello, is having 5K+ downloads with 1K+ active installs.\n",
      // ,textScaleFactor: 1.2,
      style: TextStyle(
        fontSize: width < 440 ? (width * 0.075) * 0.6 : width > 1000 ? (width * 0.02) * 0.6 : (width * 0.035) * 0.6,
      ),
      ),
    ],
  );

  @override
  Widget build(context){
    return width > 800 ? Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      profileImage(context),
      SizedBox(width:width * 0.2),
      profileInfo(),
    ])
    :Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        profileImage(context),
        profileInfo(),
      ],
    );
  }
}

class Welcome extends StatelessWidget
{
  final width;
  Welcome({@required this.width, Key key}) : super(key: key);
  @override
  Widget build(context){
    var welcomeSize = width < 440 ? width * 0.085 : width > 1000 ? width * 0.02 : width * 0.035;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text("VANAMALA SRIKANTH",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
          fontSize: width < 440 ? width * 0.075 : width > 1000 ? width * 0.02 : width * 0.035,
          letterSpacing: 1.0,
          wordSpacing: 2.0,
        ),),

        Text("Welcome to my Portfolio..!",
        style: TextStyle(
          color: Colors.orange,
          // fontSize: width * 0.013,
          fontSize: welcomeSize * 0.6,
          letterSpacing: -0.5,
          // wordSpacing: 2.0,
        ),),

      ]
    );
  }
}


class OnlineProfile extends StatelessWidget
{
  final List<Widget> profileButtons;

  OnlineProfile({ @required this.profileButtons,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: profileButtons,
    );
  }
}