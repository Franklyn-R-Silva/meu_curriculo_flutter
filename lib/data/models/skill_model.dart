enum SkillType { mobile, web, tools }

class SkillModel {
  final String name;
  final String? iconAsset;
  final bool isHighlight;
  final SkillType type; // Nova propriedade

  const SkillModel({
    required this.name,
    this.iconAsset,
    this.isHighlight = false,
    required this.type, // Obrigatório agora
  });
}
