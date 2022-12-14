// import 'package:english_app/src/resources/Homepage/Speech/SpeechMain.dart';
// import 'package:english_app/src/resources/model/TopicVoca.dart';
// import 'package:flutter/material.dart';
// import 'package:english_app/src/resources/widgets/TopBar.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class FinishSpeech extends StatefulWidget {
//   @override
//   _FinishSpeechState createState() => _FinishSpeechState();
//   final String name;
//   FinishSpeech({this.name});
// }

// class _FinishSpeechState extends State<FinishSpeech> {
//   List<TopicVoca> items = List();
//   TopicVoca item;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget _buildBottomCard(double width, double height) {
//     return Container(
//       width: width,
//       height: height / 7,
//       padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
//       decoration: BoxDecoration(
//           color: Colors.blue[500],
//           borderRadius: BorderRadius.only(
//               topRight: Radius.elliptical(32.0, 10.0),
//               topLeft: Radius.elliptical(32.0, 10.0))),
//     );
//   }

//   Widget _buildBottomCardChildren(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.radio_button_checked),
//                 color: Colors.white,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.home),
//                 color: Colors.white,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.settings),
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             Align(
//                 alignment: Alignment.bottomCenter,
//                 child: _buildBottomCard(width, height)),
//             Column(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(top: 200.0, right: 90.0, left: 90.0),
//                   //color: Colors.blue,
//                   child: CircularPercentIndicator(
//                       radius: 210.0,
//                       lineWidth: 10.0,
//                       animation: true,
//                       percent: 0.1,
//                       center: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             'PH??T ??M',
//                             style: TextStyle(
//                                 fontSize: 24.0,
//                                 letterSpacing: 1.5,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 4.0,
//                           ),
//                           Container(
//                             height: 5.0,
//                             width: 80.0,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(4.0))),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             '10%',
//                             style: TextStyle(
//                                 fontSize: 40.0, fontWeight: FontWeight.bold),
//                           ),
//                           Center(
//                             child: Text(
//                               "/s/ /sh/ /z/",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   color: Colors.blue,
//                                   letterSpacing: 1.5),
//                             ),
//                           ),
//                         ],
//                       ),
//                       progressColor: Colors.red,
//                       backgroundColor: Colors.grey[200]),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 100.0,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Container(
//                         width: 170,
//                         height: 300,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8.0),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black12, blurRadius: 15.0),
//                               BoxShadow(color: Colors.black12, blurRadius: 10.0)
//                             ]),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Text(
//                               'S??? T??? PH??T ??M\nTRONG CH??? ?????',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   '10',
//                                   style: TextStyle(
//                                     fontSize: 35.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.green,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   '/10',
//                                   style: TextStyle(
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.green,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 170,
//                         height: 300,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8.0),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black12, blurRadius: 15.0),
//                               BoxShadow(color: Colors.black12, blurRadius: 10.0)
//                             ]),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Text(
//                               'T???NG T??? PH??T ??M\n???? LUY???N',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   '10',
//                                   style: TextStyle(
//                                     fontSize: 35.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.red,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   '/100',
//                                   style: TextStyle(
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.red,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Text('CH??? ????? TI???P THEO',
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                             letterSpacing: 1.0)),
//                     SizedBox(
//                       height: 15.0,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SpeechMainPage()));
//                       },
//                       child: Container(
//                         width: 250,
//                         height: 100,
//                         decoration: BoxDecoration(
//                             color: Colors.blue[200],
//                             borderRadius: BorderRadius.circular(8.0),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black12, blurRadius: 15.0),
//                               BoxShadow(color: Colors.black12, blurRadius: 10.0)
//                             ]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Image.asset("assets/images/Speech/Numbers/2.png",
//                                 width: 60),
//                             Text(
//                               "ENDING SOUNDS",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.0,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Align(
//                 alignment: Alignment.bottomCenter,
//                 child: _buildBottomCardChildren(context)),
//             TopBar('HO??N TH??NH PH???N LUY???N'),
//           ],
//         ),
//       ),
//     );
//   }
// }
