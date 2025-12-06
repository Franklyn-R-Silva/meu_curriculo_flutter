import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_constants.dart';

class GlassHeader extends StatelessWidget {
  const GlassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 700;

    return Center(
      child:
          Container(
            margin: const EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                50,
              ), // Borda redonda estilo App
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ), // Efeito de Vidro
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "<Franklyn />",
                        style: TextStyle(
                          fontFamily: 'Code', // Se tiver fonte mono
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: const Color(AppColors.primary),
                        ),
                      ),
                      if (isDesktop)
                        Row(
                          children: [
                            _HeaderItem(title: "Sobre", onTap: () {}),
                            const SizedBox(width: 20),
                            _HeaderItem(title: "Skills", onTap: () {}),
                            const SizedBox(width: 20),
                            _HeaderItem(title: "Projetos", onTap: () {}),
                          ],
                        )
                      else
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {},
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
          ), // Cai do céu
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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isHovered
                ? const Color(AppColors.primary)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isHovered ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
