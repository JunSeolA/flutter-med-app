// lib/models/drug_interaction.dart

enum InteractionSeverity {
  mild, // 경미함
  moderate, // 보통
  severe, // 심각함
  critical, // 치명적
  unknown, // 알 수 없음
}

class DrugInteraction {
  final String id; // 상호작용 정보 고유 식별자
  final List<String> drugIds; // 상호작용하는 약물 ID 목록 (최소 2개 이상)
  final InteractionSeverity severity; // 상호작용 심각도
  final String description; // 상호작용 및 부작용 설명
  final String? managementAdvice; // 대처 방안 또는 권고사항

  DrugInteraction({
    required this.id,
    required this.drugIds,
    required this.severity,
    required this.description,
    this.managementAdvice,
  });
}