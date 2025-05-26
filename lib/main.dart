import 'package:flutter/material.dart';
// import 'pages/input_page.dart'; // 이전에 주석 처리 또는 삭제한 부분
// import 'pages/result_page.dart'; // 이전에 주석 처리 또는 삭제한 부분
import 'screens/homepage.dart'; // <--- 이 줄을 추가해주세요!

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '전설아의 첫 앱', // 이 부분은 그대로 두셔도 됩니다.
      home: HomePage(), // 이제 이 HomePage는 import 된 screens/homepage.dart 의 것을 사용합니다.
      routes: {
        // '/input': (context) => InputPage(), // 이전에 주석 처리 또는 삭제
        // '/result': (context) => ResultPage(), // 이전에 주석 처리 또는 삭제
      },
    );
  }
}

// class HomePage extends StatelessWidget { ... } 
// 여기서부터 시작됐던 이전 HomePage 클래스 정의는 삭제합니다.
