import 'package:flutter/material.dart';
import '../../../widget/TopBar.dart';

class GamerMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: TopBar(),
      body: Container(
        child: Stack(
          children: <Widget>[
            TopBar('TƯƠNG TÁC BẠN BÉ'),
          ],
        ),
      ),
    );
  }
}
