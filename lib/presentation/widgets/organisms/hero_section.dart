import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/app_constants.dart';
import '../atoms/magnetic_element.dart';
import '../atoms/social_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return SizedBox(
      height: isMobile
          ? 750
          : 700, // Aumentei um pouco a altura para caber tudo
      child: Stack(
        alignment: Alignment.center,
        children: [
          // === FUNDO COM ELEMENTOS FLUTUANTES (GRAVIDADE) ===
          // Adicionei validação para não poluir muito no mobile,
          // mas no Desktop vai aparecer a "galáxia" completa.
          if (!isMobile) ...[
            // --- Canto Superior Esquerdo ---
            const Positioned(
              top: 40,
              left: 80,
              child: MagneticElement(
                strength: 1.5,
                child: FaIcon(
                  FontAwesomeIcons.flutter,
                  size: 45,
                  color: Colors.blue,
                ),
              ),
            ),
            const Positioned(
              top: 120,
              left: 200,
              child: MagneticElement(
                strength: 1.1,
                child: FaIcon(
                  FontAwesomeIcons.swift,
                  size: 35,
                  color: Colors.deepOrange,
                ), // Swift
              ),
            ),

            // --- Canto Superior Direito ---
            const Positioned(
              top: 60,
              right: 120,
              child: MagneticElement(
                strength: 2.0,
                child: FaIcon(
                  FontAwesomeIcons.react,
                  size: 50,
                  color: Colors.cyan,
                ),
              ),
            ),
            const Positioned(
              top: 150,
              right: 280,
              child: MagneticElement(
                strength: 0.9,
                child: FaIcon(
                  FontAwesomeIcons.apple,
                  size: 40,
                  color: Colors.black54,
                ), // iOS
              ),
            ),

            // --- Meio (Laterais) ---
            const Positioned(
              top: 250,
              left: 50,
              child: MagneticElement(
                strength: 1.3,
                child: FaIcon(
                  FontAwesomeIcons.android,
                  size: 40,
                  color: Colors.green,
                ), // Android/Kotlin
              ),
            ),
            const Positioned(
              top: 300,
              right: 80,
              child: MagneticElement(
                strength: 1.7,
                child: FaIcon(
                  FontAwesomeIcons.database,
                  size: 35,
                  color: Colors.redAccent,
                ), // Oracle
              ),
            ),

            // --- Canto Inferior Esquerdo ---
            const Positioned(
              bottom: 120,
              left: 150,
              child: MagneticElement(
                strength: 1.2,
                child: FaIcon(
                  FontAwesomeIcons.java,
                  size: 45,
                  color: Colors.orange,
                ),
              ),
            ),
            const Positioned(
              bottom: 50,
              left: 280,
              child: MagneticElement(
                strength: 0.8,
                child: FaIcon(
                  FontAwesomeIcons.bolt,
                  size: 30,
                  color: Colors.amber,
                ), // Supabase (Bolt)
              ),
            ),

            // --- Canto Inferior Direito ---
            const Positioned(
              bottom: 80,
              right: 100,
              child: MagneticElement(
                strength: 1.8,
                child: FaIcon(
                  FontAwesomeIcons.docker,
                  size: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Positioned(
              bottom: 180,
              right: 250,
              child: MagneticElement(
                strength: 1.0,
                child: FaIcon(
                  FontAwesomeIcons.gitAlt,
                  size: 35,
                  color: Colors.deepOrangeAccent,
                ), // Git
              ),
            ),
          ],

          // === CONTEÚDO CENTRAL (SUA FOTO E TEXTO) ===
          // A foto fica aqui no meio, dentro da Column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar com Efeito Magnético
              MagneticElement(
                strength: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(AppColors.primary), Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(AppColors.primary).withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage(
                      AppAssets.profileImage,
                    ), // SUA FOTO AQUI
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                    "FRANKLYN ROBERTO",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 40 : 72,
                      height: 0.9,
                      letterSpacing: -2,
                    ),
                  )
                  .animate()
                  .tint(
                    color: const Color(AppColors.primary),
                    duration: 2.seconds,
                  )
                  .fadeIn(),

              const SizedBox(height: 10),

              Text(
                AppStrings.role,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.5, end: 0),

              const SizedBox(height: 30),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  AppStrings.aboutMe,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.grey[700],
                  ),
                ),
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 40),

              // Botões Sociais
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: AppStrings.linkedInUrl,
                  ),
                  SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.github,
                    url: AppStrings.gitHubUrl,
                  ),
                  SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.whatsapp,
                    url: AppStrings.whatsappUrl,
                  ),
                ],
              ).animate().scale(delay: 700.ms, curve: Curves.elasticOut),
            ],
          ),
        ],
      ),
    );
  }
}
