import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LessionsUI extends StatelessWidget {
  final String lesson;
  final String title;
  final String image;
  final int color;
  final double percent;
  LessionsUI(
      {required this.lesson,
      required this.title,
      required this.image,
      required this.color,
      required this.percent}); // Listview.builder()

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          width: width,
          height: 175,
          //color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(left: 40),
            width: width,
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    lesson,
                    style: TextStyle(
                      color: Color(color),
                      fontFamily: "SVN-Poky's", //Style
                      fontSize: 25.0, //Font
                      letterSpacing: .30, //Spacing Text
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "SFUIText-Medium", //Style
                      fontSize: 20.0, //Font
                      fontWeight: FontWeight.bold,
                      letterSpacing: .10, //Spacing Text
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0, // (200 -120) /2
          child: CircularPercentIndicator(
            radius: 64,
            lineWidth: 5.0,
            animation: true,
            percent: 0.4,
            center: CircleAvatar(
              maxRadius: 45,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(color),
          ),
        ),
      ],
    );
  }
}
