import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data/models/certificate_model.dart';
import '../atoms/tech_chip.dart';

class CertificateCard extends StatelessWidget {
  final CertificateModel certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 320, // Largura fixa
      margin: const EdgeInsets.only(right: 16, bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.grey.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho: Ícone e Botão
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Ícone ou Logo da Empresa (Simulado)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.workspace_premium,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () => AppUtils.launchURL(
                  certificate.credentialUrl,
                  context: context,
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 20),
                tooltip: "Ver Certificado",
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Título
          Text(
            certificate.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // Emissor e Data (NOVO!)
          Row(
            children: [
              Text(
                certificate.issuer,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text("•", style: theme.textTheme.bodySmall),
              const SizedBox(width: 8),
              Text(
                certificate.date,
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Descrição
          Expanded(
            child: Text(
              certificate.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isDark ? Colors.grey[400] : Colors.grey[700],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 16),

          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (certificate.language.isNotEmpty)
                TechChip(label: certificate.language, isHighlight: false),
              if (certificate.framework.isNotEmpty)
                TechChip(label: certificate.framework, isHighlight: true),
            ],
          ),
        ],
      ),
    );
  }
}
