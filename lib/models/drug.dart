class Drug {
  final String id; // 타입을 String으로 변경 (또는 일관성 있게 유지)
  final String name;
  final String ingredient;
  final String amount;
  final String effect;
  final String structure;
  final String image;

  Drug({
    required this.id, // 여기에 맞게 수정
    required this.name,
    required this.ingredient,
    required this.amount,
    required this.effect,
    required this.structure,
    required this.image,
  });
}