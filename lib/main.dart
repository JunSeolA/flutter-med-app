import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'pages/result_page.dart'; // 요기까지 위에 정리

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '전설아의 첫 앱',
      home: HomePage(),
      routes: {
        '/input': (context) => InputPage(),
        '/result': (context) => ResultPage(), // 여기에 포함!
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈")),
      body: Center(
        child: ElevatedButton(
          child: Text("약물 입력하러 가기"),
          onPressed: () {
            Navigator.pushNamed(context, '/input');
          },
        ),
      ),
    );
  }
}
