class SkillModel {
  final String name;
  final String? iconAsset; // Caminho para um ícone customizado se tiver
  final bool isHighlight; // Para destacar as principais (Flutter/Dart)

  const SkillModel({
    required this.name,
    this.iconAsset,
    this.isHighlight = false,
  });
}
