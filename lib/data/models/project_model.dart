class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack; // Ex: ["Flutter", "Dart", "Firebase"]
  final String repoUrl;
  final String? liveUrl; // Opcional, pois nem todo projeto tem deploy
  final String? imageUrl; // Caminho do asset ou URL

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    required this.repoUrl,
    this.liveUrl,
    this.imageUrl,
  });
}
