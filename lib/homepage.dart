// lib/homepage.dart 파일 내용
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _myDrugs = ['타이레놀', '아스피린', '게보린']; // 테스트용 데이터

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "의약품 상호작용 체커",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSearchBar(),
            const SizedBox(height: 24),
            const Text(
              "현재 복용 중인 약물",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _myDrugs.isEmpty
                  ? const Center(child: Text("아직 복용 중인 약물이 없습니다."))
                  : ListView.builder(
                      itemCount: _myDrugs.length,
                      itemBuilder: (context, index) {
                        final drugName = _myDrugs[index];
                        return _buildDrugCard(drugName);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "약물 이름 검색...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onSubmitted: (value) async {
        // TODO: B님 - 검색 로직 구현
        // 이 부분에 searchDrug 함수를 사용합니다.
        if (value.isNotEmpty) {
          try {
            await searchDrug(value);
            // TODO: 검색 결과로 할 작업 추가
          } catch (e) {
            print(e); // 에러 메시지 출력
          }
        }
      },
    );
  }

  // 약물 카드 위젯 (별도의 파일로 분리하면 더 좋습니다.)
  Widget _buildDrugCard(String drugName) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.medical_services_outlined, color: Colors.blue[700]),
        title: Text(drugName),
        trailing: const Icon(Icons.close, color: Colors.red),
        onTap: () {
          // TODO: 약물 상세 정보 페이지로 이동
        },
      ),
    );
  }

  // API 호출 함수
  Future<List<dynamic>> searchDrug(String query) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/api/search?q=$query'));
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load drugs');
    }
  }
}