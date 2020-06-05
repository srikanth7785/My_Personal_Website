import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Introduction extends StatefulWidget {
  final bool isMobile;
  final Size size;
  Introduction(this.isMobile,this.size);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  bool animate = false;

  void initState(){
    super.initState();
    Timer(Duration(milliseconds: 5), () => setState(() => animate = true));
  }

  name(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
          // Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.white,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "me.jpg",
                ),
              ),
            ),
            width: animate ? widget.isMobile ? 150.0 : widget.size.width * 0.1 : 5.0,
            height: animate ? widget.isMobile ? 150.0 : widget.size.width * 0.1 : 5.0,
          ),
          SizedBox(height: 10.0,),
          Text("Vanamala Srikanth",style: GoogleFonts.aBeeZee(fontSize: 25.0,fontWeight: FontWeight.normal),),
          Text("Flutter Enthusiast 👀 | Undergrad at GITAM 👨‍🎓",style: GoogleFonts.lato(fontSize: 10.0)),
          socialMedia(),
        ],
      ),
    );
  }

  introText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   '''I'm an Android Developer\n\tInspired by the cross platform functionality of Flutter\n\t\t'''
        //   '''As it can be used to develop Andriod,iOS and Web Applications as well🤩.\n\n'''
        //   '''I have good experience in Android development, with Flutter.\n\n'''
        //   '''I also have a couple of apps on Google Play Store developed with Flutter,\n\t\t with good number of downloads, active users and rating for each of them.''',
        //   style: GoogleFonts.lato(
        //     fontSize: widget.isMobile ? 12.0 : widget.size.width * 0.012,
        //   ),
        // ),
        TypewriterAnimatedTextKit(
          totalRepeatCount: 1,
          speed: Duration(milliseconds: 50),
          displayFullTextOnTap: true,
          text: [
          "I'm an Android Developer\n\tInspired by the cross platform functionality of Flutter\n\t\t"
          "As it can be used to develop Andriod,iOS and Web Applications as well🤩.\n\n"
          "I have good experience in Android development, with Flutter.\n\n"
          "I also have a couple of apps on Google Play Store developed with Flutter,\n\t\t with good number of downloads, active users and rating for each of them.",
          ],
        ),
      ],
    );
  }

  socialMedia(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            FontAwesome.linkedin_square,
            color: Colors.white70,
            ),
          onPressed: () => launch("https://www.linkedin.com/in/vanamalasrikanth/"),
        ),
        IconButton(
          icon: Icon(
            FontAwesome.github,
            color: Colors.white70,
            ),
          onPressed: () => launch("https://github.com/srikanth7785"),
        ),
        IconButton(
          icon: Icon(
            FontAwesome.twitter,
            color: Colors.white70,
            ),
          onPressed: () => launch("https://twitter.com/srikanth7785"),
        ),
        IconButton(
          icon: Icon(
            FontAwesome.stack_overflow,
            color: Colors.white70
            ),
          onPressed: () => launch("https://stackoverflow.com/users/13460232/srikanth7785"),
        ),
        IconButton(
          icon: Icon(
            MaterialCommunityIcons.google_play,
            color: Colors.white70
            ),
          onPressed: () => launch("https://play.google.com/store/apps/dev?id=5890668678449730451"),
        ),
      ],
    );
  }

  firstBackgroundImage(imageHeightonMobile){
    return Image.asset(
      "writing.jpg",
      alignment: Alignment.centerRight,
      width: double.maxFinite,
      height: widget.isMobile ? imageHeightonMobile : 300.0,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isMobile ? 510.0 : 300.0,
      child: Stack(
        children: [
          firstBackgroundImage(510.0),
          Container(
            color: Colors.black54,
            width: double.maxFinite,
            child: widget.isMobile ? Column(
              children:[
                name(),
                Divider(
                  height: 1.0,
                  color: Colors.black26,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: introText(),
                ),
              ],
            ) : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              name(),
              introText(),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
