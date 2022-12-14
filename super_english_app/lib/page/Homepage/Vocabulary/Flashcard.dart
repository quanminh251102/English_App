import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:super_english_app/data/voca_data.dart';
import 'package:super_english_app/page/Homepage/HomePage.dart';
import 'package:super_english_app/model/Vocabluary.dart';
import 'package:super_english_app/widget/TopBar.dart';

//import 'package:firebase_database/firebase_database.dart';

import 'package:flip_card/flip_card.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:percent_indicator/percent_indicator.dart';
import './FinishVoca.dart';

class Flashcard extends StatefulWidget {
  final String topic, name;
  Flashcard({required this.topic, required this.name});

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  final FlutterTts flutterTts = new FlutterTts();
  late List<Vocabulary> items = allVoca;

  late Vocabulary item;

  // DatabaseReference itemRef;

  bool load = true;
  bool test = false;

  AudioCache audioCache = new AudioCache();
  final player = AudioPlayer();

  final player_two = AudioPlayer();

  bool startgame = false;

  //Random đáp án
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  int keyrand = 0;
  //Check đáp án
  int checkres = 0; //=1: đúng, =2: sai
  //Phát âm thanh nếu lật flashcard 1 lần (lần lẻ)
  int checkvol = 1;

  //Next Question
  int nextqs = 0; //Next: 1 , Finish: 2

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5); //speed of speech
    await flutterTts.setVolume(1.0); //volume of speech
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  void initState() {
    super.initState();

    load = false;
    item = Vocabulary("", "", "", "", "");

    //final FirebaseDatabase database = FirebaseDatabase.instance;

    //itemRef = database.reference().child('vocabulary').child(widget.topic);

    // itemRef.onChildAdded.listen(_onEntryAdded);
    // setState(() {
    //   load = false;
    // });

    //var element = items[_random.nextInt(items.length)];

    //PlayMusic
    //audioCache.play("audio/background.mp3");

    player.play(AssetSource("audio/background.mp3"));
  }

  @override
  void dispose() {
    // audioCache.clear("audio/background.mp3");
    //audioCache.clearCache();
    super.dispose();
  }

  // _onEntryAdded(Event event) {
  //   setState(() {
  //     items.add(Vocabulary.fromSnapshot(event.snapshot));
  //     items.shuffle();
  //   });
  // }

  Widget _buildBottomCard(double width, double height) {
    return Container(
      width: width,
      height: height / 3,
      // padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
      decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(32.0, 10.0),
              topLeft: Radius.elliptical(32.0, 10.0))),
      child: test
          ? Container(
              padding: EdgeInsets.only(
                  top: 100.0, bottom: 60.0, right: 70.0, left: 70.0),
              child: ElevatedButton(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    Text(
                      'Kiểm tra từ vựng',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    startgame = true;
                    test = false;
                    keyrand = next(0, 4);
                    print(' Key random: $keyrand');
                  });
                },
              ),
            )
          : Container(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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

  bool tests = false;
//Hàm kiểm tra đáp án
  Widget checkResult(int index) {
    return FlipCard(
      onFlip: () {
        print("check result Tap: $index & ${items[index].name}");
        //Nếu đáp án trùng!
        if (index == keyrand) {
          setState(() {
            checkres = 1;
            player_two.play(AssetSource("audio/correct.mp3"));
            nextqs = 1;
          });
        }
        //Đáp án sai
        else {
          setState(() {
            checkres = 2;
            player_two.play(AssetSource("audio/wrong.mp3"));
            nextqs = 0;
          });
        }
      },
      flipOnTouch: false,
      front: CachedNetworkImage(
        imageUrl: items[index].image,
        fit: BoxFit.scaleDown,
        placeholder: (_, str) => Container(
            height: 50,
            width: 50,
            child: Center(
              child: CircularProgressIndicator(),
            )),
      ),
      back: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: ElevatedButton(
              child: Icon(
                Icons.play_circle_outline,
                size: 20.0,
                color: Colors.blue,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                flutterTts.speak(items[index].name);
                print('speak');
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 20.0,
                child: Text(items[index].name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
              Text('/' + items[index].phonetic.toString() + '/',
                  style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(items[index].translate,
              style: TextStyle(
                fontSize: 20.0,
              )),
        ],
      ),
    );
  }

  ImageProvider check() {
    if (checkres == 1) {
      return AssetImage("assets/images/Correct.png");
    } else if (checkres == 2) {
      return AssetImage("assets/images/Wrong.png");
    } else
      return AssetImage("");
  }

  int randlist = 4;
  double countqs = 0.0;

  Widget button() {
    if (nextqs == 1) {
      return Column(
        children: <Widget>[
          Icon(
            Icons.navigate_next,
            size: 60.0,
            color: Colors.green,
          ),
          Text(
            "Tiếp theo",
            style: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else if (nextqs == 0) {
      return Column(
        children: <Widget>[
          Icon(
            Icons.play_arrow,
            size: 60.0,
            color: Colors.blue,
          ),
          Text(
            items[keyrand].name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Icon(
            Icons.receipt,
            size: 60.0,
            color: Colors.red,
          ),
          Text(
            "Hoàn thành",
            style: TextStyle(
                color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: TopBar(),
      body: load
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildBottomCard(width, height)),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildBottomCardChildren(context)),
                  TopBar('${widget.name.toUpperCase()}'),
                  startgame
                      ? Stack(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(23.0, 120, 15.0, 200),
                              child: LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 50,
                                animation: true,
                                lineHeight: 15.0,
                                animationDuration: 1000,
                                percent: 0.2 * countqs,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 130.0, 50, 20.0),
                              child: GridView.count(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                children: List.generate(randlist, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(
                                          "Tap: $index & ${items[index].name}");
                                      //Nếu đáp án trùng!
                                      if (index == keyrand) {
                                        setState(() {
                                          checkres = 1;
                                          player_two.play(
                                              AssetSource("audio/correct.mp3"));
                                          nextqs = 1;
                                        });
                                        if (countqs == 5.0) {
                                          setState(() {
                                            nextqs = 2;
                                          });
                                        }
                                      }
                                      //Đáp án sai
                                      else {
                                        setState(() {
                                          checkres = 2;
                                          player_two.play(
                                              AssetSource("audio/wrong.mp3"));
                                          nextqs = 0;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 2.5, color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 1)
                                          ]),
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: CachedNetworkImage(
                                          imageUrl: items[index].image,
                                          fit: BoxFit.scaleDown,
                                          placeholder: (_, str) => Container(
                                              height: 50,
                                              width: 50,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 440.0, bottom: 130, left: 20),
                              width: width - 20,
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(image: check())),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 530.0,
                                bottom: 80,
                                left: 50,
                                right: 30,
                              ),
                              width: width - 20,
                              // button bottom in game
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                child: button(),
                                onPressed: () {
                                  if (countqs == 5.0) {
                                    countqs = 0.0;
                                    player.stop();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => FinishVoca(
                                                  name: widget.name,
                                                )));
                                    print("Hoan thanh phan thi");
                                  }
                                  if (nextqs == 0)
                                    setState(() {
                                      flutterTts.speak(items[keyrand].name);
                                    });
                                  else
                                    setState(() {
                                      checkres = 0;
                                      //Trộn lại list
                                      items.shuffle();
                                      nextqs = 0;
                                      //Random đáp án
                                      keyrand = next(0, 4);
                                      //Tăng câu trả lời đúng
                                      countqs++;
                                    });
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(
                          padding:
                              EdgeInsets.fromLTRB(30.0, 230.0, 30.0, 210.0),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return FlipCard(
                                direction: FlipDirection.HORIZONTAL, // default
                                front: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2.5, color: Colors.blue),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: CachedNetworkImage(
                                          imageUrl: items[index].image,
                                          fit: BoxFit.scaleDown,
                                          placeholder: (_, str) => Container(
                                              height: 50,
                                              width: 50,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )),
                                        ),
                                      ),
                                      Text(
                                        items[index].name,
                                        style: const TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                          Text('/' + '${items.length}')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2.5, color: Colors.blue),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        child: ElevatedButton(
                                          child: Icon(
                                            Icons.play_circle_outline,
                                            size: 60.0,
                                            color: Colors.blue,
                                          ),
                                          // in Flapcard
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                          onPressed: () {
                                            speak(items[index].name);
                                            print(items[index].name);
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 40.0,
                                            child: Text(items[index].name,
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                              '/' + items[index].phonetic + '/',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text(items[index].translate,
                                          style: TextStyle(
                                            fontSize: 28.0,
                                          )),
                                    ],
                                  ),
                                ),
                                onFlip: () {
                                  player_two
                                      .play(AssetSource("audio/flipcard.mp3"));
                                },
                              );
                            },
                            control: new SwiperControl(),
                            loop: false,
                            pagination: new SwiperPagination(),
                            itemCount: items.length,
                            viewportFraction: 0.8,
                            scale: 0.6,
                            onIndexChanged: (int index) {
                              print('$index');
                              if (index == items.length - 1) {
                                setState(() {
                                  test = true;
                                });
                              } else {
                                setState(() {
                                  test = false;
                                });
                              }
                            },
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
