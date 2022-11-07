import 'dart:math';

import 'package:super_english_app/data/topic_data.dart';

import './VocaMain.dart';
import '../../../model/TopicVoca.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../widget/TopBar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FinishVoca extends StatefulWidget {
  @override
  _FinishVocaState createState() => _FinishVocaState();
  final String name;
  FinishVoca({required this.name});
}

class _FinishVocaState extends State<FinishVoca> {
  late List<TopicVoca> items = allTopic;
  late TopicVoca item;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBottomCard(double width, double height) {
    return Container(
      width: width,
      height: height / 7,
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
      decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(32.0, 10.0),
              topLeft: Radius.elliptical(32.0, 10.0))),
    );
  }

  Widget _buildBottomCardChildren(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.radio_button_checked),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.home),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.settings),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomCard(width, height)),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: height * 0.13,
                    right: width * 0.1,
                    left: width * 0.1,
                  ),
                  //color: Colors.blue,
                  child: CircularPercentIndicator(
                    radius: height * 0.14,
                    lineWidth: width * 0.03,
                    animation: true,
                    percent: 0.1,
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'TỪ VỰNG',
                          style: TextStyle(
                              fontSize: height * 0.035,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          height: 5.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '10%',
                          style: TextStyle(
                              fontSize: height * 0.035,
                              fontWeight: FontWeight.bold),
                        ),
                        Center(
                          child: Text(
                            widget.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.red,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: height * 0.11,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 170,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 15.0),
                              BoxShadow(color: Colors.black12, blurRadius: 10.0)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'SỐ TỪ VỰNG\nTRONG CHỦ ĐỀ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '/10',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 15.0),
                              BoxShadow(color: Colors.black12, blurRadius: 10.0)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'TỔNG TỪ VỰNG\nĐÃ HỌC',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '/100',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  children: <Widget>[
                    Text('CHỦ ĐỀ TIẾP THEO',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 1.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VocaMainPage()));
                      },
                      child: Container(
                        width: width * 0.4,
                        height: height * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue[500],
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 15.0),
                              BoxShadow(color: Colors.black12, blurRadius: 10.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/Voca/Voca_Country.png",
                              //"assets/images/Wrong.png",
                              width: 100,
                            ),
                            Text(
                              "CÁC QUỐC GIA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomCardChildren(context)),
            TopBar('HOÀN THÀNH PHẦN LUYỆN'),
          ],
        ),
      ),
    );
  }
}
