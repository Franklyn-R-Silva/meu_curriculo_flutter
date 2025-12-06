import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../controllers/portfolio_controller.dart';
import '../widgets/organisms/hero_section.dart';
import '../widgets/organisms/skills_section.dart';
import '../widgets/organisms/experience_section.dart';
import '../widgets/organisms/projects_section.dart';
import '../widgets/organisms/glass_header.dart'; // Importante importar o header

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PortfolioController>().loadAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();

    return Scaffold(
      backgroundColor: const Color(AppColors.backgroundLight),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // 1. CONTEÚDO SCROLLÁVEL (Fica atrás do Header)
                SingleChildScrollView(
                  // Adicionamos padding no topo para o conteúdo não ficar escondido atrás do menu
                  padding: const EdgeInsets.only(top: 100, bottom: 60),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const HeroSection(),
                          const SizedBox(height: 100),

                          SkillsSection(skills: controller.skills),
                          const SizedBox(height: 120),

                          ExperienceSection(
                            experiences: controller.experiences,
                          ),
                          const SizedBox(height: 120),

                          ProjectsSection(projects: controller.projects),
                          const SizedBox(height: 150),

                          const Text(
                            "© 2025 Franklyn Roberto - Desenvolvido com Flutter 💙",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 2. HEADER FLUTUANTE (Fixo no topo com Glassmorphism)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: GlassHeader(),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchUrl(Uri.parse(AppAssets.cvPtBr)),
        label: const Text("Baixar CV"),
        icon: const Icon(Icons.download),
        // Use surface ou primaryContainer se primary for muito forte no tema novo
        backgroundColor: const Color(AppColors.primary),
        foregroundColor: Colors.white,
      ),
    );
  }
}
