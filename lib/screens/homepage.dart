import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 여기가 수정된 부분입니다.
  // 상태 변수들
  final TextEditingController _searchController = TextEditingController();
  List<String> _myDrugs = ['타이레놀', '아스피린', '게보린']; // 테스트용 데이터

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "의약품 상호작용 체커",
          style: TextStyle(
            fontWeight: FontWeight.bold, // 폰트 굵게
            color: Colors.white, // 흰색 글자
          ),
        ),
        backgroundColor: Colors.blue[800], // 진한 파란색 앱바
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1. 검색창
            _buildSearchBar(),
            const SizedBox(height: 24), // 검색창과 목록 사이 간격
            // 2. 현재 복용 중인 약물 목록
            const Text(
              "현재 복용 중인 약물",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child:
                  _myDrugs.isEmpty
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

  // 검색창 위젯
  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "약물 이름 검색...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // 모서리 둥글게
          borderSide: BorderSide.none, // 테두리 제거
        ),
        filled: true,
        fillColor: Colors.grey[200], // 연한 회색 배경
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onSubmitted: (value) {
        // TODO: B님 - 검색 로직 구현
      },
    );
  }

  // 약물 카드 위젯 (별도의 파일로 분리하면 더 좋습니다.)
  Widget _buildDrugCard(String drugName) {
    return Card(
      elevation: 2, // 그림자 효과
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
}
