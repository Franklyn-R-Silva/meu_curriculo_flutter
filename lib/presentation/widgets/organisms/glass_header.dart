import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../controllers/portfolio_controller.dart';

class GlassHeader extends StatelessWidget {
  const GlassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PortfolioController>();
    final isDesktop = MediaQuery.of(context).size.width > 700;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child:
          Container(
            margin: const EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo / Nome
                      GestureDetector(
                        onTap: () =>
                            controller.scrollToSection(controller.heroKey),
                        child: Text(
                          "<Franklyn />",
                          style: TextStyle(
                            fontFamily: 'Code',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),

                      if (isDesktop)
                        Row(
                          children: [
                            _HeaderItem(
                              title: "Skills",
                              onTap: () => controller.scrollToSection(
                                controller.skillsKey,
                              ),
                            ),
                            const SizedBox(width: 20),
                            _HeaderItem(
                              title: "Experiência",
                              onTap: () => controller.scrollToSection(
                                controller.experienceKey,
                              ),
                            ),
                            const SizedBox(width: 20),
                            _HeaderItem(
                              title: "Projetos",
                              onTap: () => controller.scrollToSection(
                                controller.projectsKey,
                              ),
                            ),
                            const SizedBox(width: 30),

                            // Theme Toggle Switch
                            IconButton(
                              icon: Icon(
                                isDark ? Icons.light_mode : Icons.dark_mode,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: controller.toggleTheme,
                              tooltip: "Alternar Tema",
                            ).animate().rotate(duration: 500.ms),
                          ],
                        )
                      else
                        // Mobile: Apenas o Toggle por enquanto (menu drawer seria ideal)
                        IconButton(
                          icon: Icon(
                            isDark ? Icons.light_mode : Icons.dark_mode,
                          ),
                          onPressed: controller.toggleTheme,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ).animate().slideY(
            begin: -1,
            end: 0,
            duration: 800.ms,
            curve: Curves.easeOutBack,
          ),
    );
  }
}

class _HeaderItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _HeaderItem({required this.title, required this.onTap});

  @override
  State<_HeaderItem> createState() => _HeaderItemState();
}

class _HeaderItemState extends State<_HeaderItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
              color: isHovered
                  ? Theme.of(context).colorScheme.primary
                  : (isDark ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
