import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _drug1Controller = TextEditingController();
  final TextEditingController _drug2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("약물 입력")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _drug1Controller,
              decoration: InputDecoration(labelText: "첫 번째 약물"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _drug2Controller,
              decoration: InputDecoration(labelText: "두 번째 약물"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'drug1': _drug1Controller.text,
                    'drug2': _drug2Controller.text,
                  },
                );
              },
              child: Text("상호작용 확인"),
            ),
          ],
        ),
      ),
    );
  }
}
