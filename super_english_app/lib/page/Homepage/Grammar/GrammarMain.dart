import 'package:flutter/material.dart';
import '../../../widget/TopBar.dart';

class GrammarMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: TopBar(),
      body: Container(
        child: Stack(
          children: <Widget>[
            TopBar('HỌC NGỮ PHÁP QUA VÍ DỤ'),
          ],
        ),
      ),
    );
  }
}
