import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/project_model.dart';
import '../../../core/constants/app_constants.dart';
import '../atoms/tech_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  // Variáveis para o efeito 3D
  Offset _mousePos = Offset.zero;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Transformação Matrix4 para o efeito 3D
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001) // Perspectiva
      ..rotateX(
        _isHovered ? 0.001 * _mousePos.dy : 0,
      ) // Rotação X baseada no mouse
      ..rotateY(
        _isHovered ? -0.001 * _mousePos.dx : 0,
      ); // Rotação Y (invertida)

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() {
        _isHovered = false;
        _mousePos = Offset.zero;
      }),
      onHover: (details) {
        // Calcula a posição do mouse relativa ao centro do card
        final renderBox = context.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final center = Offset(size.width / 2, size.height / 2);
        setState(() {
          _mousePos = details.localPosition - center;
        });
      },
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // Sombra dinâmica que muda com o mouse
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? const Color(AppColors.primary).withOpacity(0.3)
                    : Colors.black.withOpacity(0.05),
                blurRadius: _isHovered ? 30 : 10,
                offset: _isHovered ? const Offset(0, 15) : const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Conteúdo do Card
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.folderOpen,
                          size: 30,
                          color: Color(AppColors.primary),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.arrowUpRightFromSquare,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.project.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600], height: 1.5),
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.techStack
                          .take(3)
                          .map((t) => TechChip(label: t))
                          .toList(),
                    ),
                  ],
                ),
              ),

              // Efeito de Brilho (Gradient Overlay) ao passar o mouse
              if (_isHovered)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.transparent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.0, 0.4],
                      ),
                    ),
                  ),
                ),

              // Link Clicável (Invisível por cima de tudo)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => launchUrl(Uri.parse(widget.project.repoUrl)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
