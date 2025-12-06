import '../models/project_model.dart';
import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../../core/constants/app_constants.dart';

class MockData {
  // --- EXPERIÊNCIAS (Extraído do seu HTML) ---
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Desenvolvedor Fullstack',
      company: 'Plussoft',
      period: 'Jul 2023 - Dez 2023',
      description:
          'Desenvolvimento de aplicativos Desktop com Electron (backup e envio de arquivos). Manutenção em APIs, criação de rotas e integração com SQL Server e MySQL. Manutenção de front-end React.',
    ),
    ExperienceModel(
      role: 'Analista de Sistemas',
      company: 'Open Consult',
      period: 'Jun 2023 - Jul 2023',
      description:
          'Desenvolvimento e implementação de políticas estratégicas de IAM e fluxos de trabalho de segurança.',
    ),
    ExperienceModel(
      role: 'Monitor de P.O.O.',
      company: 'UFAL',
      period: 'Set 2022 - Fev 2023',
      description:
          'Ensino de Programação Orientada a Objetos utilizando Java, Spring MVC e Design Patterns. Auxílio aos alunos em projetos práticos.',
    ),
    ExperienceModel(
      role: 'Técnico de Transmissão',
      company: 'UFAL',
      period: 'Ago 2021 - Dez 2021',
      description:
          'Suporte técnico em transmissões ao vivo, garantindo qualidade de áudio e vídeo e resolução de problemas em tempo real.',
    ),
  ];

  // --- PROJETOS (Seleção dos principais do seu GitHub) ---
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'ImageLite',
      description:
          'Fullstack App com Spring Boot, React e Docker. Inclui autenticação JWT, PostgreSQL e upload de imagens.',
      techStack: ['Java', 'Spring Boot', 'React', 'Docker', 'PostgreSQL'],
      repoUrl: 'https://github.com/DevFullStack-Franklyn-R-Silva/ImageLite',
      imageUrl:
          'assets/img/project_placeholder.png', // Placeholder por enquanto
    ),
    ProjectModel(
      title: 'TCC - Livraria em Nuvem',
      description:
          'Aplicação escalável baseada em microsserviços para uma livraria mundial. Foco em alta performance e escalabilidade.',
      techStack: ['Microservices', 'Cloud', 'Java', 'Spring Cloud'],
      repoUrl:
          'https://github.com/DevFullStack-Franklyn-R-Silva/Desenvolvimento-de-aplicacao-em-nuvem-escalavel',
    ),
    ProjectModel(
      title: 'Calculadora Flutter',
      description:
          'App mobile de calculadora desenvolvido em Dart/Flutter. Demonstração de gerenciamento de estado e UI responsiva.',
      techStack: ['Flutter', 'Dart', 'Android', 'iOS'],
      repoUrl:
          'https://github.com/DevFullStack-Franklyn-R-Silva/Calculadora-em-Dart_Flutter',
    ),
    ProjectModel(
      title: 'Explorador de Postagens',
      description:
          'Aplicação dinâmica em React.js e Next.js para busca e visualização de posts. Nível intermediário/avançado.',
      techStack: ['React', 'Next.js', 'API Integration'],
      repoUrl:
          'https://github.com/DevFullStack-Franklyn-R-Silva/Explorador-de-Postagens-em-React',
    ),
    ProjectModel(
      title: 'Meu Currículo Web',
      description:
          'Versão anterior deste portfólio feita com HTML, CSS e Bootstrap. Base para a migração atual.',
      techStack: ['HTML5', 'CSS3', 'Bootstrap'],
      repoUrl:
          'https://github.com/DevFullStack-Franklyn-R-Silva/Meu-Curriculo-Web',
    ),
    ProjectModel(
      title: 'Gerador de QR Code',
      description:
          'Ferramenta web para geração instantânea de QR Codes utilizando ReactJS.',
      techStack: ['React', 'JavaScript', 'Utils'],
      repoUrl:
          'https://github.com/DevFullStack-Franklyn-R-Silva/Gerador-de-QRCode-com-ReactJS',
    ),
  ];

  // --- SKILLS ---
  static const List<SkillModel> skills = [
    SkillModel(name: 'Flutter', isHighlight: true),
    SkillModel(name: 'Dart', isHighlight: true),
    SkillModel(name: 'Java', isHighlight: true),
    SkillModel(name: 'Spring Boot', isHighlight: true),
    SkillModel(name: 'ReactJS'),
    SkillModel(name: 'Next.js'),
    SkillModel(name: 'TypeScript'),
    SkillModel(name: 'Docker'),
    SkillModel(name: 'PostgreSQL'),
    SkillModel(name: 'Git/GitHub'),
    SkillModel(name: 'Electron'),
    SkillModel(name: 'Microservices'),
  ];
}
