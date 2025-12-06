import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/app_constants.dart';
import '../atoms/social_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Detecta se é mobile para ajustar tamanhos
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Column(
      children: [
        // 1. Foto de Perfil com Animação de Entrada
        Container(
              padding: const EdgeInsets.all(4), // Borda branca
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(AppAssets.profileImage),
              ),
            )
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(delay: 200.ms, curve: Curves.easeOutBack), // Efeito "pop"

        const SizedBox(height: 24),

        // 2. Nome
        Text(
          AppStrings.portfolioTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: isMobile ? 40 : 64,
            height: 1.0,
          ),
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0),

        // 3. Cargo (Efeito de Digitação pode ser adicionado aqui, mas vamos de fade simples e elegante)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppStrings.role,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 18 : 24,
            ),
          ),
        ).animate().fadeIn(delay: 600.ms),

        // 4. Bio
        SizedBox(
          width:
              700, // Limita largura em telas grandes para não ficar ruim de ler
          child: Text(
            AppStrings.aboutMe,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ).animate().fadeIn(delay: 800.ms),

        const SizedBox(height: 32),

        // 5. Botões Sociais
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppStrings.linkedInUrl,
            ),
            SizedBox(width: 16),
            SocialButton(
              icon: FontAwesomeIcons.github,
              url: AppStrings.gitHubUrl,
            ),
            SizedBox(width: 16),
            SocialButton(
              icon: FontAwesomeIcons.whatsapp,
              url: AppStrings.whatsappUrl,
            ),
            SizedBox(width: 16),
            SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: AppStrings.emailUrl,
            ),
          ],
        ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.5, end: 0),
      ],
    );
  }
}
