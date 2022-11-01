// import 'package:english_app/src/resources/Homepage/Game/GrammarMain.dart';
// import 'package:english_app/src/resources/Homepage/Grammar/GrammarMain.dart';
// import 'package:english_app/src/resources/Homepage/Listen/ListenMain.dart';
// import 'package:english_app/src/resources/User/ProfileSetting.dart';
// import 'package:english_app/src/resources/Homepage/Vocabulary/VocaMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'FunctionPage.dart';
import 'Vocabulary/VocaMain.dart';
// import 'package:english_app/src/resources/Homepage/Speech/SpeechMain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final _pageOption = [
    FunctionPage(),
    FunctionPage(),
    FunctionPage(),
    // ProfileSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _pageOption[index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              index == 0
                  ? selectedMenuBottom(Icon(Icons.home), 'Trang chủ')
                  : IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                    ),
              index == 1
                  ? selectedMenuBottom(Icon(Icons.bookmark), 'Tiến trình')
                  : IconButton(
                      icon: Icon(Icons.bookmark),
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                    ),
              index == 2
                  ? selectedMenuBottom(
                      Icon(Icons.notifications_active), 'Thông báo')
                  : IconButton(
                      icon: Icon(Icons.notifications_active),
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                    ),
              index == 3
                  ? selectedMenuBottom(
                      Icon(Icons.supervisor_account), 'Người dùng')
                  : IconButton(
                      icon: Icon(Icons.supervisor_account),
                      onPressed: () {
                        setState(() {
                          index = 3;
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

final pageOpen = [
  VocaMainPage(),
  // GrammarMainPage(),
  // SpeechMainPage(),
  // ListenMainPage(),
  // GamerMainPage(),
];

Widget FuncCard(String image, String toptext, String bottext, Color? colors,
    BuildContext context, int index) {
  Size screenSize = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => pageOpen[index]));
    },
    child: Container(
      padding: EdgeInsets.only(
          left: screenSize.width * 0.01, right: screenSize.width * 0.05),
      width: screenSize.width * 0.6,
      height: screenSize.height * 0.45,
      child: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fitWidth),
                  color: colors)),
          Positioned(
            bottom: 1,
            right: 1,
            child: FloatingActionButton(
              heroTag: null,
              mini: true,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.03),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(toptext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SFUIText-Bold',
                      color: Colors.white,
                      fontSize: screenSize.height * 0.03)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenSize.height * 0.03),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(bottext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SFUIText-Bold',
                      color: Colors.white,
                      fontSize: screenSize.height * 0.03)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget selectedMenuBottom(Icon icon, String text) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.blue[300]),
    child: Row(
      children: <Widget>[
        icon,
        Text(
          text,
          style: TextStyle(
            fontFamily: 'SFUIText-Bold',
          ),
        )
      ],
    ),
  );
}
