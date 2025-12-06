class ExperienceModel {
  final String role; // Cargo (Ex: Desenvolvedor Fullstack)
  final String company;
  final String period; // Ex: Jul 2023 - Dez 2023
  final String description;
  final bool isCurrent; // Para destacar se é o emprego atual

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    this.isCurrent = false,
  });
}
