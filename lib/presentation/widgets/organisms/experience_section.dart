// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';

// Project imports:
import '../../../data/models/experience_model.dart';
import '../molecules/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceModel> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "EXPERIÊNCIA PROFISSIONAL",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 32),
        ListView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Scroll é da página inteira
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceCard(experience: experiences[index])
                .animate()
                .fadeIn(
                  delay: (index * 200).ms,
                  duration: 600.ms,
                ) // Delay progressivo
                .slideX(begin: -0.2, end: 0); // Vem da esquerda
          },
        ),
      ],
    );
  }
}
