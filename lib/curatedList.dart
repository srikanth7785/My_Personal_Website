import 'package:My_Personal_Website/check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class CuratedList extends StatelessWidget {

  final String appName;
  final String imagePath;
  final String numberofDownloads;
  final String rating;
  final String appDescription;
  final String githubRepoLink;
  final bool availableOnPlayStore;
  final String playStoreLink;

  CuratedList({this.appName, this.imagePath, this.numberofDownloads, this.rating, this.appDescription, this.githubRepoLink, this.availableOnPlayStore, this.playStoreLink});

  bool isMobile;

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  isMobile = SystemCheck().isMobile(size.width);
    return Container(
      padding: EdgeInsets.all(10.0),
      // width: 300.0,
      width: isMobile ? size.width * 0.82 : 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.black38,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                      border: Border.all(width: 0.2, color: Colors.white60),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                      ),
                    ),
                    // child: Image.asset(imagePath),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(appName,style: GoogleFonts.roboto(fontSize: 20.0),),
                      SizedBox(height: 2.0,),
                      Text( availableOnPlayStore ? "$numberofDownloads📥 | $rating⭐" : "(not published)",style: GoogleFonts.lato(color: availableOnPlayStore ? Colors.white : Colors.white60)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Text(
              // "Gmaterials is all about accessing materials for students of GITAM. One stop destination for all GITAMITES. Student Portal,Glearn,GIT Results and G-Events can be accessed easily in a single touch.",
              appDescription,
              style: GoogleFonts.droidSerif(fontSize: 10.0,fontWeight: FontWeight.w100,fontStyle: FontStyle.italic),
            ),
            Divider(color: Colors.black54,height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View it on:  ",style: TextStyle(fontSize: 12.0 ,fontWeight: FontWeight.w100,color: Colors.white60)),
                InkWell(
                  child: Icon(MaterialCommunityIcons.github_circle,),
                  onTap: () => launch(githubRepoLink),
                ),
                SizedBox(width: 10.0,),
                availableOnPlayStore ? InkWell(
                  child: Icon(MaterialCommunityIcons.google_play),
                  // onTap: () => launch("https://play.google.com/store/apps/details?id=com.we.intialp"),
                  onTap: () => launch(playStoreLink),
                ) : Container(),
                appName == "Master Yogi" ? Text("Working Prototype :",style: TextStyle(fontSize: 12.0 ,fontWeight: FontWeight.w100,color: Colors.white60)) : Container(),
                appName == "Master Yogi" ? InkWell(
                  child: Icon(MaterialCommunityIcons.youtube),
                  onTap: () => launch("https://youtu.be/WQynHhOKlqw"),
                ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: EdgeInsets.only(right: 10.0),
//   child: CuratedList(
//   appName: "Gmaterials",
//   imagePath: "gmaterials.webp",
//   numberofDownloads: "1.5K+",
//   rating: "4.8",
//   appDescription: "Gmaterials is all about accessing materials for students of GITAM. One stop destination for all GITAMITES. Student Portal,Glearn,GIT Results and G-Events can be accessed easily in a single touch.",
//   githubRepoLink: "https://github.com/srikanth7785/Gmaterials_App",
//   availableOnPlayStore: true,
//   playStoreLink: "https://play.google.com/store/apps/details?id=com.we.intialp",
//   isMobile: isMobile,
//   ),
// )