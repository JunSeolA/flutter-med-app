// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hello_app/homepage.dart'; // <--- 이 코드가 homepage 파일을 불러옴

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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