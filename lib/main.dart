import 'package:flutter/material.dart';
import 'screens/homepage.dart'; // 새로 추가한 부분

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '약물 상호작용 경고 시스템', 
      home: HomePage(), // 이제 이 HomePage는 import 된 screens/homepage.dart 의 것을 사용합니다.
      routes: {
        
      },
    );
  }
}
