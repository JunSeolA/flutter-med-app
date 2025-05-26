// lib/models/drug.dart

class Ingredient {
  final String name; // 성분명
  final String content; // 함량 (예: "100mg", "5%")

  Ingredient({
    required this.name,
    required this.content,
  });
}

class Drug {
  final String id; // 고유 식별자 (예: 의약품 코드)
  final String name; // 의약품 이름
  final String? imageUrl; // 의약품 사진 URL (사용자가 첨부하거나, 미리보기용)
  final List<Ingredient> mainIngredients; // 주성분 및 함량 목록
  final String efficacyEffects; // 효능/효과
  final String? structuralFormulaUrl; // 주성분 구조식 이미지 URL
  // 추가적으로 고려해볼 만한 정보:
  // final String manufacturer; // 제조사
  // final String category; // 분류 (예: "해열진통제")
  // final String usageInstructions; // 용법/용량
  // final String precautions; // 사용상 주의사항 (개별 약품에 대한)

  Drug({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.mainIngredients,
    required this.efficacyEffects,
    this.structuralFormulaUrl,
    // this.manufacturer,
    // this.category,
    // this.usageInstructions,
    // this.precautions,
  });
}