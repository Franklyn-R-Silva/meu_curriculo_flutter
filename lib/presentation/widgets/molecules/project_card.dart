import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/project_model.dart';
import '../atoms/tech_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, isHovered ? -5.0 : 0.0), // Sobe levemente no hover
        child: Card(
          elevation: isHovered ? 8 : 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Cabeçalho: Título e Ícone Folder
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.folder_open_rounded,
                      color: theme.colorScheme.primary,
                      size: 40,
                    ),
                    Row(
                      children: [
                        if (widget.project.liveUrl != null)
                          IconButton(
                            icon: const Icon(Icons.launch, size: 20),
                            onPressed: () =>
                                launchUrl(Uri.parse(widget.project.liveUrl!)),
                            tooltip: 'Ver Online',
                          ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                          onPressed: () =>
                              launchUrl(Uri.parse(widget.project.repoUrl)),
                          tooltip: 'Código Fonte',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Título
                Text(
                  widget.project.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Descrição
                Expanded(
                  child: Text(
                    widget.project.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 16),

                // Tech Stack (Tags)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.techStack
                      .map((tech) => TechChip(label: tech))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
