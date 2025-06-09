import '../models/drug_interaction.dart'; // DrugInteraction 모델 가져오기

final List<DrugInteraction> sampleInteractions = [
  DrugInteraction(
    id: 'interaction_001', // 상호작용 정보의 고유 ID
    drugIds: ['1', '2'],    // 상호작용하는 약물들의 ID 목록 (sampleDrugs의 ID와 일치해야 함)
    severity: InteractionSeverity.severe, // enum으로 정의한 심각도
    description: '타이레놀(아세트아미노펜)과 부루펜(이부프로펜)을 함께 복용 시 위장 출혈 위험이 증가할 수 있습니다. 특히 장기 복용 시 주의가 필요합니다.',
    managementAdvice: '두 약물을 함께 복용해야 할 경우 반드시 의사 또는 약사와 상의하여 용량 및 복용 간격을 조절하거나 대체 약물을 고려해야 합니다.'
  ),
  DrugInteraction(
    id: 'interaction_002',
    drugIds: ['1', '3'], // 예: 타이레놀('1')과 아스피린('3')
    severity: InteractionSeverity.moderate,
    description: '아세트아미노펜과 아스피린은 특정 조건에서 간 독성 위험을 증가시킬 수 있습니다.',
    managementAdvice: '필요시 전문가와 상담하세요.'
  ),
  // 여기에 더 많은 약물 상호작용 정보를 추가할 수 있습니다.
  // DrugInteraction(id: '...', drugIds: ['...', '...'], severity: InteractionSeverity.mild, ...),
];
