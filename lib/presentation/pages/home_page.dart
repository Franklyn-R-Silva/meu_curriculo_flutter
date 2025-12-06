import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../controllers/portfolio_controller.dart';
import '../widgets/organisms/hero_section.dart';
import '../widgets/organisms/skills_section.dart';
import '../widgets/organisms/experience_section.dart';
import '../widgets/organisms/projects_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Inicia o carregamento dos dados assim que a tela abre
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PortfolioController>().loadAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Escuta as mudanças do Controller
    final controller = context.watch<PortfolioController>();

    return Scaffold(
      backgroundColor: const Color(AppColors.backgroundLight),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                // Container central para limitar largura em telas ultrawide
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const HeroSection(),
                      const SizedBox(height: 80),
                      const Divider(),
                      const SizedBox(height: 80),

                      SkillsSection(skills: controller.skills),
                      const SizedBox(height: 100),

                      ExperienceSection(experiences: controller.experiences),
                      const SizedBox(height: 100),

                      ProjectsSection(projects: controller.projects),
                      const SizedBox(height: 120),

                      // Footer Simples
                      const Text(
                        "© 2025 Franklyn Roberto - Desenvolvido com Flutter 💙",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchUrl(Uri.parse(AppAssets.cvPtBr)),
        label: const Text("Baixar CV"),
        icon: const Icon(Icons.download),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
