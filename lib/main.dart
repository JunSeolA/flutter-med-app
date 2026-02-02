// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'pages/result_page.dart'; // 요기까지 위에 정리
import 'package:hello_app/homepage.dart'; // <--- 이 코드가 homepage 파일을 불러옴

void main() => runApp(MyApp());
void main() {
  runApp(const MyApp());
}

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
  const MyApp({super.key});

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
    return MaterialApp(
      title: '의약품 상호작용 체커',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(), // <--- 여기서 homepage를 보여줌
    );
  }
}

