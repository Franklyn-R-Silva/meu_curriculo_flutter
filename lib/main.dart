import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MeuCurriculoApp());
}

class MeuCurriculoApp extends StatelessWidget {
  const MeuCurriculoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Franklyn Roberto - Portfólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(
            0xFFBD5D38,
          ), // Cor baseada no seu estilo anterior
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  // Função para abrir links (WhatsApp, LinkedIn, etc)
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Detecta se é mobile ou desktop para responsividade
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Franklyn Roberto"),
        actions: isDesktop
            ? [
                TextButton(onPressed: () {}, child: const Text("Sobre")),
                TextButton(onPressed: () {}, child: const Text("Experiência")),
                TextButton(onPressed: () {}, child: const Text("Projetos")),
                const SizedBox(width: 20),
              ]
            : null, // Menu hambúrguer automático no mobile
      ),
      drawer: !isDesktop
          ? Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(child: Text("Menu")),
                  ListTile(title: Text("Sobre")),
                  ListTile(title: Text("Experiência")),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 100 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HERO SECTION (SOBRE) ---
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/img/profile3.png'),
                    // Certifique-se de colocar a imagem na pasta assets/img
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Franklyn Roberto",
                    style: GoogleFonts.sairaExtraCondensed(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    "MOBILE DEVELOPER (FLUTTER) & FULLSTACK",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Bacharel em Ciência da Computação (UFAL). Desenvolvedor focado em soluções Mobile com Flutter e Backend com Java/Spring Boot. Experiência prévia na Plussoft e Open Consult.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  // Ícones Sociais
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        url:
                            'https://www.linkedin.com/in/franklyn-roberto-dev/',
                      ),
                      _SocialButton(
                        icon: FontAwesomeIcons.github,
                        url: 'https://github.com/DevFullStack-Franklyn-R-Silva',
                      ),
                      _SocialButton(
                        icon: FontAwesomeIcons.whatsapp,
                        url:
                            'https://api.whatsapp.com/send?phone=5582999915558',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 80),

            // --- SKILLS SECTION ---
            _SectionTitle(title: "Habilidades & Tecnologias"),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _SkillChip(label: "Flutter"),
                _SkillChip(label: "Dart"),
                _SkillChip(label: "Java"),
                _SkillChip(label: "Spring Boot"),
                _SkillChip(label: "ReactJS"),
                _SkillChip(label: "PostgreSQL"),
                _SkillChip(label: "Git/GitHub"),
                _SkillChip(label: "Docker"),
                _SkillChip(label: "API REST"),
              ],
            ),
            const Divider(height: 80),

            // --- EXPERIENCE SECTION ---
            _SectionTitle(title: "Experiência Profissional"),
            const SizedBox(height: 20),
            _ExperienceCard(
              role: "Desenvolvedor Fullstack",
              company: "Plussoft",
              period: "Julho 2023 - Dezembro 2023",
              description:
                  "Desenvolvimento de apps Desktop com Electron, manutenção de APIs e rotas, integração com SQL Server e MySQL e manutenção em front-end React.",
            ),
            _ExperienceCard(
              role: "Analista de Sistemas",
              company: "Open Consult",
              period: "Junho 2023 - Julho 2023",
              description:
                  "Implementação de políticas de IAM, fluxos de trabalho e segurança de acessos.",
            ),
            _ExperienceCard(
              role: "Monitor de P.O.O.",
              company: "UFAL",
              period: "Setembro 2022 - Fevereiro 2023",
              description:
                  "Auxílio no ensino de Java, Spring MVC e Design Patterns.",
            ),

            const Divider(height: 80),

            // --- PROJECTS SECTION (Destaque Mobile) ---
            _SectionTitle(title: "Projetos em Destaque"),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isDesktop ? 3 : 1,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                _ProjectCard(
                  title: "App Calculadora Flutter",
                  tech: "Dart, Flutter",
                  description: "Calculadora funcional mobile cross-platform.",
                  url:
                      "https://github.com/DevFullStack-Franklyn-R-Silva/Calculadora-em-Dart_Flutter",
                ),
                _ProjectCard(
                  title: "ImageLite",
                  tech: "Spring Boot + React + Docker",
                  description: "Fullstack App com autenticação JWT e galeria.",
                  url:
                      "https://github.com/DevFullStack-Franklyn-R-Silva/ImageLite",
                ),
                _ProjectCard(
                  title: "Meu Currículo Web",
                  tech: "Flutter Web",
                  description:
                      "Este site! Uma PWA feita totalmente em Flutter.",
                  url: "https://github.com/DevFullStack-Franklyn-R-Silva",
                ),
              ],
            ),

            const SizedBox(height: 80),
            const Center(
              child: Text("© 2025 Franklyn Roberto - Feito com Flutter 💙"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            _launchUrl('assets/docs/curriculo_2024_Franklyn_Roberto.pdf'),
        icon: const Icon(Icons.download),
        label: const Text("Baixar PDF"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}

// --- WIDGETS AUXILIARES ---

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialButton({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, size: 30),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (!await launchUrl(uri)) await launchUrl(uri);
      },
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(15),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      elevation: 2,
      backgroundColor: Colors.white,
      side: BorderSide(color: Theme.of(context).colorScheme.primary),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String description;

  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  period,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String tech;
  final String description;
  final String url;

  const _ProjectCard({
    required this.title,
    required this.tech,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: InkWell(
        onTap: () async => await launchUrl(Uri.parse(url)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                tech,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(description, maxLines: 3, overflow: TextOverflow.ellipsis),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    "Ver no GitHub",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
