import 'package:flutter/material.dart';
import '../../data/models/project_model.dart';
import '../../data/models/experience_model.dart';
import '../../data/models/skill_model.dart';
import '../../data/repositories/portfolio_repository.dart';

class PortfolioController extends ChangeNotifier {
  final IPortfolioRepository repository;

  PortfolioController(this.repository);

  // Listas de dados
  List<ProjectModel> projects = [];
  List<ExperienceModel> experiences = [];
  List<SkillModel> skills = [];

  // Estado de carregamento
  bool isLoading = true;

  // Método para inicializar tudo
  Future<void> loadAllData() async {
    isLoading = true;
    notifyListeners(); // Avisa a tela para mostrar loading

    try {
      // Busca tudo em paralelo para ser mais rápido
      await Future.wait([_loadProjects(), _loadExperiences(), _loadSkills()]);
    } catch (e) {
      debugPrint('Erro ao carregar dados: $e');
    } finally {
      isLoading = false;
      notifyListeners(); // Avisa a tela que acabou
    }
  }

  Future<void> _loadProjects() async {
    projects = await repository.getProjects();
  }

  Future<void> _loadExperiences() async {
    experiences = await repository.getExperiences();
  }

  Future<void> _loadSkills() async {
    skills = await repository.getSkills();
  }
}
