import 'dart:math';

import 'package:super_english_app/data/topic_data.dart';

import './GrammarMain.dart';
import '../../../model/TopicVoca.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../widget/TopBar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FinishGrammar extends StatefulWidget {
  @override
  _FinishGrammarState createState() => _FinishGrammarState();

  final double sroce;
  FinishGrammar({required this.sroce});
}

class _FinishGrammarState extends State<FinishGrammar> {
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
                    top: height * 0.2,
                    right: width * 0.3,
                    left: width * 0.3,
                  ),
                  //color: Colors.blue,
                  child: CircularPercentIndicator(
                    radius: height * 0.14,
                    lineWidth: width * 0.03,
                    animation: true,
                    percent: widget.sroce,
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SỐ CÂU ĐÚNG',
                          style: TextStyle(
                              fontSize: height * 0.025,
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
                          '${widget.sroce}%',
                          style: TextStyle(
                              fontSize: height * 0.035,
                              fontWeight: FontWeight.bold),
                        ),
                        Center(
                          child: Text(
                            '',
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
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrammarMainPage()));
                  },
                  child: Text('Bài tiếp theo'),
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
