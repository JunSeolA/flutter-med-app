import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("결과 페이지"),
      ),
      body: Center(
        child: Text("결과가 여기에 표시됩니다."),
      ),
    );
  }
}