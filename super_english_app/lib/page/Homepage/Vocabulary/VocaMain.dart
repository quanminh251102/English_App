import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:super_english_app/data/topic_data.dart';
import 'package:super_english_app/model/TopicVoca.dart';
import 'package:super_english_app/widget/TopBar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../HomePage.dart';

class VocaMainPage extends StatefulWidget {
  const VocaMainPage({Key? key}) : super(key: key);

  @override
  State<VocaMainPage> createState() => _VocaMainPageState();
}

class _VocaMainPageState extends State<VocaMainPage> {
  List<TopicVoca> list = allTopic;
  bool playmusic = false;
  Widget TopicCardContainer(TopicVoca topicVoca, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.7,
      height: height * 0.23,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 0.5, color: Colors.black)],
      ),
      child: TopicCard(topicVoca, context),
    );
  }

  Widget _buildBottomCard() {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(32.0, 10.0),
              topLeft: Radius.elliptical(32.0, 10.0)),       
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.home),
            color: Colors.white,
          ),
          IconButton(
            onPressed: (() => setState(() {
                  playmusic = !playmusic;
                })),
            icon:  Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget TopicCard(TopicVoca topicVoca, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      child: Container(
        
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                topicVoca.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: CachedNetworkImage(
                      imageUrl: topicVoca.image,
                      fit: BoxFit.scaleDown,
                      placeholder: ((context, url) => Container(
                            height: 50,
                            width: 50,
                            child: Center(child: CircularProgressIndicator()),
                          ))),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Số từ: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    topicVoca.length.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LinearPercentIndicator(
                animation: true,
                lineHeight: height * 0.02,
                animationDuration: 2500,
                barRadius: Radius.circular(10),
                percent: 0.8,
                progressColor: Colors.blue,
              ),
            ]),
      ),
    );
  }

  Widget TopicCardList(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.1, vertical: height * 0.18),
        child: Container(
          height: height * 0.7,
          width: width * 0.8,
          child: ListView.separated(
              itemCount: list.length,
              itemBuilder: ((context, index) {
                var topicVoca = list.elementAt(index);
                return TopicCardContainer(topicVoca, context);
              }),
              separatorBuilder: (context, index) => SizedBox(
                    height: height *0.025,
                  )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildBottomCard(),
        body: Container(
            child: Stack(
          children: <Widget>[
            TopicCardList(context),
            TopBar('HỌC TỪ VỰNG - FLASHCARD'),
          ],
        )),
      ),
    );
  }
}
