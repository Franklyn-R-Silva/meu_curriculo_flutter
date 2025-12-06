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
      height: isMobile ? 700 : 600,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // === FUNDO COM ELEMENTOS FLUTUANTES (GRAVIDADE) ===
          if (!isMobile) ...[
            const Positioned(
              top: 50,
              left: 100,
              child: MagneticElement(
                strength: 1.5,
                child: FaIcon(
                  FontAwesomeIcons.flutter,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            ),
            const Positioned(
              top: 100,
              right: 150,
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
              bottom: 100,
              left: 200,
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
              right: 100,
              child: MagneticElement(
                strength: 1.8,
                child: FaIcon(
                  FontAwesomeIcons.docker,
                  size: 35,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Positioned(
              top: 200,
              right: 300,
              child: MagneticElement(
                strength: 0.8,
                child: Icon(Icons.code, size: 30, color: Colors.grey),
              ),
            ),
          ],

          // === CONTEÚDO CENTRAL ===
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
                    backgroundImage: AssetImage(AppAssets.profileImage),
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
