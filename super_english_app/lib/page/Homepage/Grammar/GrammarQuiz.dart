import 'package:flutter/material.dart';
import 'package:super_english_app/page/Homepage/Grammar/FinishGrammar.dart';
import '../../../widget/TopBar.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart'
    as CountDownIndicator;
import 'package:linear_progress_bar/linear_progress_bar.dart';

class GrammarQuiz extends StatefulWidget {
  @override
  State<GrammarQuiz> createState() => _GrammarQuizState();

  final String step;
  GrammarQuiz({required this.step});
}

class _GrammarQuizState extends State<GrammarQuiz> {
  late int scroce = 0;
  late List<String> myChoices = [];
  late List<String> suggests = [];
  late List<String> anwsers = [];
  late List<String> quizs = [
    'I am a student in HCM city',
    'What is your name',
    'She is studying English',
    'He is playing game',
  ];

  late int current_quiz = 0;
  late int num_choice = 0;
  late GroupButtonController groupButtonController = GroupButtonController();
  late bool _isDisableCheck = true;

  final int _duration = 10;
  final CountDownIndicator.CountDownController _controller =
      CountDownIndicator.CountDownController();

  late bool _isStartQuiz = false;

  bool checkAnwser() {
    bool res = true;
    for (int i = 0; i < myChoices.length; i++)
      print("${suggests[i]} ${anwsers[i]}");
    for (int i = 0; i < myChoices.length; i++) {
      if (myChoices[i].compareTo(anwsers[i]) != 0) {
        res = false;
        print("${myChoices[i]} ${anwsers[i]} ");
        break;
      }
    }
    return res;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.step == "1") {
      quizs = [
        'He is playing game1',
      ];
    }

    if (widget.step == "2") {
      quizs = [
        'He is playing game2',
      ];
    }

    if (widget.step == "3") {
      quizs = [
        'He is playing game3',
      ];
    }

    if (widget.step == "4") {
      quizs = [
        'He is playing game4',
      ];
    }

    if (widget.step == "5") {
      quizs = [
        'He is playing game5',
      ];
    }

    if (widget.step == "6") {
      quizs = [
        'He is playing game6',
      ];
    }

    if (widget.step == "7") {
      quizs = [
        'He is playing game7',
      ];
    }

    if (widget.step == "8") {
      quizs = [
        'He is playing game8',
      ];
    }

    if (widget.step == "9") {
      quizs = [
        'He is playing game9',
      ];
    }

    if (widget.step == "10") {
      quizs = [
        'He is playing game10',
      ];
    }

    if (widget.step == "11") {
      quizs = [
        'He is playing game11',
      ];
    }

    if (widget.step == "12") {
      quizs = [
        'He is playing game12',
      ];
    }

    init_quiz();
  }

  void init_quiz() {
    num_choice = 0;

    anwsers = quizs[current_quiz].split(' ');

    suggests = new List.from(anwsers);
    suggests.sort();

    myChoices = List.filled(anwsers.length, '__');
    groupButtonController = GroupButtonController(
      selectedIndexes: [],
    );

    _isDisableCheck = true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: TopBar(),
      body: (_isStartQuiz == true)
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    TopBar('HỌC NGỮ PHÁP QUA VÍ DỤ'),
                    LinearProgressBar(
                      maxSteps: quizs.length,
                      progressType: LinearProgressBar.progressTypeLinear,
                      currentStep: current_quiz + 1,
                      progressColor: Colors.blue[200]!,
                      backgroundColor: Colors.grey[200]!,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue[200]!),
                      semanticsLabel: "Label",
                      semanticsValue: "Value",
                      minHeight: 5,
                    ),
                    CustomCard(
                      color: Colors.white,
                      borderRadius: 10,
                      height: height * 0.5,
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8),
                          child: GroupButton(
                            options: GroupButtonOptions(
                              unselectedColor: Colors.white,
                              unselectedBorderColor: Colors.white,
                              elevation: 0,
                            ),
                            isRadio: false,
                            onSelected: (shocie, index, isSelected) {
                              print('$index button is selected');
                            },
                            maxSelected: 0,
                            buttons: myChoices,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: CountDownIndicator.CountDownProgressIndicator(
                        controller: _controller,
                        valueColor: Colors.blue[200]!,
                        backgroundColor: Colors.grey[200]!,
                        initialPosition: 0,
                        duration: 30,
                        timeFormatter: (seconds) {
                          return Duration(seconds: seconds)
                              .toString()
                              .split('.')[0]
                              .padLeft(8, '0');
                        },
                        // text: 'hh:mm:ss',
                        onComplete: () {
                          setState(() {
                            if (checkAnwser() == true) {
                              scroce++;
                            }

                            if (current_quiz < quizs.length) {
                              current_quiz++;
                              if (current_quiz == quizs.length) {
                                print("Your sroce : $scroce");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FinishGrammar(
                                              sroce: (100.0 * scroce) /
                                                  quizs.length,
                                            )));
                              }
                              init_quiz();
                              _controller.restart(initialPosition: 0);
                            }
                          });
                        },
                      ),
                    ),
                    GroupButton(
                      options: GroupButtonOptions(
                        unselectedColor: Colors.white,
                        unselectedBorderColor: Colors.white,
                        selectedColor: Colors.black26,
                        elevation: 0,
                      ),
                      controller: groupButtonController,
                      isRadio: false,
                      onSelected: (str_choice, index, isSelected) {
                        print('$isSelected ${suggests[index]}');
                        if (isSelected == true) {
                          setState(() {
                            int pos = myChoices.indexOf('__');
                            myChoices[pos] = suggests[index];
                            num_choice++;
                            if (num_choice == anwsers.length) {
                              _isDisableCheck = false;
                            }
                            print(num_choice);
                          });
                        } else {
                          setState(() {
                            int pos = myChoices.indexOf(suggests[index]);
                            myChoices[pos] = '__';
                            num_choice--;
                            _isDisableCheck = true;
                          });
                        }
                      },
                      buttons: suggests,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          init_quiz();
                        });
                      },
                      child: Text('Xóa câu trả lời'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: _isDisableCheck
                          ? null
                          : () {
                              print('check');
                              bool check = checkAnwser();

                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: (check == true) ? 'Đúng' : 'Sai',
                                  message: '',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: (check == true)
                                      ? ContentType.success
                                      : ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);

                              if (check == true) {
                                setState(() {
                                  scroce++;
                                  if (current_quiz < quizs.length) {
                                    current_quiz++;
                                    if (current_quiz == quizs.length) {
                                      print("Your sroce : $scroce");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FinishGrammar(
                                                    sroce: (1.0 * scroce) /
                                                        quizs.length,
                                                  )));
                                    }
                                    init_quiz();
                                    _controller.restart(initialPosition: 0);
                                  }
                                });
                              }
                            },
                      child: Text('Kiểm tra'),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularCountDownTimer(
                duration: 3,
                initialDuration: 0,
                controller: CountDownController(),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: Colors.blue[100]!,
                fillGradient: null,
                backgroundColor: Colors.blue[400]!,
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                  setState(() {
                    _isStartQuiz = !_isStartQuiz;
                  });
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 0) {
                    return "Bắt đầu";
                  } else {
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            ),
    );
  }
}
