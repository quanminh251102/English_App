// import 'package:english_app/src/resources/Chatbot/Chatbot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class FunctionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05,vertical: screenSize.height*0.01),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: screenSize.height * 0.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/LogoApp.png",
                              width: 60.0,
                              height: 60.0,
                            ),
                            Text("Simple",
                                style: TextStyle(
                                  color: Colors.blue[600],
                                  fontFamily: "SVN-Poky's", //Style
                                  fontSize: screenSize.height *0.06, //Font
                                  letterSpacing: .10,
                                ))
                          ],
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://ict-imgs.vgcloud.vn/2020/09/01/19/huong-dan-tao-facebook-avatar.jpg"))),
                        ),
                      ]),
                ),
                Text(
                  'Trang chủ',
                  style: TextStyle(
                      fontFamily: 'SFUIText-Bold',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.height *0.04),
                ),
                SizedBox(height: screenSize.height *0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10
                            )),
                        child: TextField(
                          style: TextStyle(fontSize: screenSize.height *0.025),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Tìm kiếm',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Stack(
                      children: <Widget>[
                        Icon(
                          Icons.notifications_none,
                          size: 27.0,
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "2",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13.0),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Container(
                  height: screenSize.height * 0.45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FuncCard('assets/images/Study_Voca.png', 'HỌC TỪ VỰNG',
                          'THÔNG QUA FLASHCARD', Colors.blue[400], context, 0),
                      FuncCard('assets/images/Study_Grammar.png', 'HỌC NGỮ PHÁP',
                          'QUA VÍ DỤ', Colors.green[400], context, 1),
                      FuncCard(
                          'assets/images/Study_Speaking.png',
                          'LUYỆN NÓI\nTIẾNG ANH',
                          'CHUẨN',
                          Colors.grey[400],
                          context,
                          2),
                      FuncCard(
                          'assets/images/Study_Music.png',
                          'LUYỆN NGHE\nTIẾNG ANH',
                          'CHUẨN',
                          Colors.pink[400],
                          context,
                          3),
                      FuncCard('assets/images/Study_Gaming.png',
                          'TƯƠNG TÁC\nBẠN BÈ', '', Colors.red[400], context, 4),
                    ],
                  ),
                ),
                
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) => Chatbot()));
                //   },
                //   child: Container(
                //     height: screenSize.height *0.12,
                //     alignment: Alignment.topRight,
                //     child: Image(
                //       image: AssetImage("assets/images/Bot_Support.gif"),
                      
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
