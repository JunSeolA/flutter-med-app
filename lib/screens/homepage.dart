import 'package:flutter/material.dart';
// sample_drugs.dart 와 drug.dart 모델을 가져올 수 있도록 경로를 확인해주세요.
import 'lib/data/sample_drugs.dart'; //<-- 새로 추가
import 'lib/models/drug.dart'; //<-- 새로 추가
// 만약 위 파일들이 아직 없다면, 이 import는 주석 처리하고 아래 _myDrugs를 빈 리스트로 시작하세요.
// 실제로는 B님의 상태 관리 로직을 통해 약물 목록을 받아옵니다.
// 여기서는 UI 개발을 위해 임시 데이터를 사용하거나 빈 리스트로 시작할 수 있습니다.


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Drug> _myDrugs = []; // 실제로는 B님이 관리하는 '내 약물' 목록
  // List<Drug> _searchResults = []; // 검색 결과 목록
  // bool _isSearching = false; // 검색 UI 표시 여부

  @override
  void initState() {
    super.initState();
    // TODO: B님이 구현할 상태 관리 로직에서 '내 약물' 목록(_myDrugs)을 불러옵니다.
    // 지금은 UI 개발을 위해 여기에 직접 샘플 데이터를 몇 개 넣어볼 수 있습니다.
    // 예: _myDrugs = List.from(sampleDrugs.take(2)); // sampleDrugs가 정의되어 있다면
    // 또는 비워둡니다: _myDrugs = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch(String query) {
    // TODO: B님이 검색 로직 구현 (A님의 API 또는 sampleDrugs 데이터 사용)
    // 검색 결과(_searchResults)를 업데이트하고 화면을 갱신합니다.
    print("검색어: $query");
    setState(() {
      // _isSearching = query.isNotEmpty;
      // _searchResults = sampleDrugs.where((drug) => drug.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // React 예제의 Pill 아이콘처럼 아이콘을 추가하고 싶다면, leading 프로퍼티를 사용할 수 있습니다.
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Icon(Icons.medical_services_outlined), // 예시 아이콘
        // ),
        title: Text('의약품 상호작용 체커'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 내용물을 왼쪽으로 정렬
          children: <Widget>[
            // 검색창
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '의약품명을 검색하세요...',
                prefixIcon: Icon(Icons.search), // React 예제의 Search 아이콘과 유사
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none, // 테두리 없애기
                ),
                filled: true, // 배경색 채우기
                fillColor: Colors.grey[200], // 배경색
              ),
              onSubmitted: (value) { // 사용자가 키보드에서 '완료'를 눌렀을 때
                _handleSearch(value);
              },
              // onChanged: (value) { // 입력할 때마다 검색 (선택 사항)
              //   _handleSearch(value);
              // },
            ),
            SizedBox(height: 24.0), // 검색창 아래 간격

            // 현재 복용 중인 약물 섹션 제목
            Text(
              '현재 복용 중인 약물',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),

            // 현재 복용 중인 약물 목록
            Expanded(
              child: _myDrugs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.medication_liquid_outlined, size: 48, color: Colors.grey[400]),
                          SizedBox(height: 16),
                          Text(
                            '복용 중인 약물을 추가해주세요.',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _myDrugs.length,
                      itemBuilder: (context, index) {
                        final drug = _myDrugs[index];
                        // TODO (C님): 이 부분을 예쁜 약물 카드 위젯으로 만듭니다.
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 6.0),
                          child: ListTile(
                            // leading: Image.asset(drug.image, width: 50, height: 50, fit: BoxFit.cover), // drug.image 경로에 이미지가 있다면
                            title: Text(drug.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${drug.ingredient} ${drug.amount}'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                              onPressed: () {
                                // TODO (B님): 약물 삭제 로직 구현
                                print('삭제: ${drug.name}');
                                // setState(() {
                                //   _myDrugs.removeAt(index);
                                // });
                              },
                            ),
                            onTap: () {
                              // TODO (C님, B님): 약물 상세 정보 화면으로 이동 로직
                              print('상세보기: ${drug.name}');
                            },
                          ),
                        );
                      },
                    ),
            ),

            // TODO (C님, B님, A님): 검색 결과 목록 표시 부분 (나중에 추가)
            // if (_isSearching && _searchResults.isNotEmpty) ...
            // else if (_isSearching && _searchResults.isEmpty) ...
          ],
        ),
      ),
    );
  }
}

// Drug 클래스와 sampleDrugs 리스트가 정의된 파일을 import 해야 합니다.
// 예시:
// import 'models/drug.dart';
// import 'data/sample_drugs.dart';