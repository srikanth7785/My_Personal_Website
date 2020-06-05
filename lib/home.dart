import 'package:My_Personal_Website/curatedList.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'check.dart';
import 'Introduction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isMobile;

  final curatedProjects = [
    {
      'appName' : 'Gmaterials',
      'imagePath': 'gmaterials.png',
      'numberofDownloads': '1.5K+',
      'rating': '4.8',
      'appDescription': 'Gmaterials is all about accessing materials for students of GITAM. One stop destination for all GITAMITES. Student Portal,Glearn,GIT Results and G-Events can be accessed easily in a single touch.',
      'githubRepoLink': 'https://github.com/srikanth7785/Gmaterials_App',
      'availableOnPlayStore': true,
      'playStoreLink': 'https://play.google.com/store/apps/details?id=com.we.intialp',
    },
    {
      'appName' : 'Othello',
      'imagePath': 'othello.png',
      'numberofDownloads': '10K+',
      'rating': '4.2',
      'appDescription': 'Othello(AKA Reversi) is a strategy game played between 2 players. It is a board game that I developed during my initial days of learning Flutter, has both single and multi player modes.',
      'githubRepoLink': 'https://github.com/srikanth7785/Othello_App_using_Flutter',
      'availableOnPlayStore': true,
      'playStoreLink': 'https://play.google.com/store/apps/details?id=com.we.intialp',
    },
    {
      'appName' : 'Master Yogi',
      'imagePath': 'masterYogi.jpeg',
      'numberofDownloads': '0',
      'rating': '0',
      'appDescription': 'Master Yogi helps in practicing yoga at your place, it acts as a Yoga assistant which is developed as a part of Build for Digital India, ML Model being developed by our Team mates.',
      'githubRepoLink': 'https://github.com/srikanth7785/Master-Yogi',
      'availableOnPlayStore': false,
      'playStoreLink': 'no',
    },
    {
      'appName' : 'Finger Counter',
      'imagePath': 'fingerCounter.png',
      'numberofDownloads': '0',
      'rating': '0',
      'appDescription': "Finger Counter is a basic app that I developed to demonstrate how to integrate ML Model into a Flutter app, where ML model is obtained from Google's Teachable Machine",
      'githubRepoLink': 'https://github.com/srikanth7785/Teachable_Machine_with_Flutter',
      'availableOnPlayStore': false,
      'playStoreLink': 'no',
    },
  ];
  
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
                Container(
                  height: 215.0,
                  width: size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  // decoration: BoxDecoration(
                  //   color: Colors.blueGrey,
                  //   image: DecorationImage(
                  //     fit: BoxFit.fitWidth,
                  //     image: AssetImage("projects.jpg",),
                  //   ),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 5.0),
                        child: Text("Curated list of my Projects",),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(curatedProjects.length + 1, (i){
                            return i < curatedProjects.length ? Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: CuratedList(
                                appName: curatedProjects[i]['appName'],
                                imagePath: curatedProjects[i]['imagePath'],
                                numberofDownloads: curatedProjects[i]['numberofDownloads'],
                                rating: curatedProjects[i]['rating'],
                                appDescription: curatedProjects[i]['appDescription'],
                                githubRepoLink: curatedProjects[i]['githubRepoLink'],
                                availableOnPlayStore: curatedProjects[i]['availableOnPlayStore'],
                                playStoreLink: curatedProjects[i]['playStoreLink'],
                              ),
                            ) : Container(
                              width: 200.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                              alignment: Alignment.center,
                              child: InkWell(
                                splashColor: Colors.deepPurple,
                                onTap: () => launch("https://github.com/srikanth7785"),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("...and many more..\n"),
                                      Text("View all of my Projects on"),
                                      Text("GitHub ↗")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                        ),
                      ),
                      // Expanded(
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: curatedProjects.map((i){
                      //       return Padding(
                      //         padding: EdgeInsets.only(right: 15.0),
                      //         child: CuratedList(
                      //           appName: i['appName'],
                      //           imagePath: i['imagePath'],
                      //           numberofDownloads: i['numberofDownloads'],
                      //           rating: i['rating'],
                      //           appDescription: i['appDescription'],
                      //           githubRepoLink: i['githubRepoLink'],
                      //           availableOnPlayStore: i['availableOnPlayStore'],
                      //           playStoreLink: i['playStoreLink'],
                      //         ),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      // Container(
                      //   height: 100.0,
                      //   width: 100.0,
                      //   color: Colors.orange,
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

