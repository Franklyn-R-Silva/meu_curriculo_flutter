import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../data/models/skill_model.dart';
import '../atoms/tech_chip.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillModel> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HABILIDADES & TECNOLOGIAS",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) {
                return TechChip(
                  label: skill.name,
                  isHighlight: skill.isHighlight,
                );
              }).toList(),
            )
            // Efeito cascata: anima os filhos (chips) sequencialmente
            .animate(interval: 50.ms)
            .fadeIn(duration: 400.ms)
            .slideX(begin: -0.1, end: 0, curve: Curves.easeOut),
      ],
    );
  }
}
