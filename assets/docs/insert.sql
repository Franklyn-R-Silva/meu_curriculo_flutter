-- Limpa dados antigos para não duplicar (Opcional)
TRUNCATE TABLE skills, experiences, projects;

-- 1. INSERIR SKILLS
INSERT INTO skills (name, type, is_highlight, icon_url) VALUES
-- Mobile
('Flutter', 'mobile', true, null),
('Dart', 'mobile', true, null),
('React Native', 'mobile', false, null),
('Kotlin', 'mobile', false, null),
('Swift', 'mobile', false, null),
('Android Studio', 'mobile', false, null),
-- Web & Backend
('Node.js', 'web', false, null),
('TypeScript', 'web', true, null),
('JavaScript', 'web', false, null),
('Spring Boot', 'web', true, null),
('Java', 'web', true, null),
('Docker', 'web', true, null),
('PostgreSQL', 'web', false, null),
('Oracle', 'web', false, null),
('HTML5 & CSS3', 'web', false, null),
-- Tools
('Git', 'tools', false, null),
('GitHub', 'tools', false, null),
('Supabase', 'tools', true, null),
('Figma', 'tools', false, null),
('CI/CD', 'tools', false, null);

-- 2. INSERIR EXPERIÊNCIAS
INSERT INTO experiences (role, company, period, description, is_current, start_date) VALUES
(
  'Desenvolvedor Fullstack', 
  'Plussoft', 
  'Jul 2023 - Dez 2023', 
  'Desenvolvimento de aplicativos Desktop com Electron, manutenção de APIs REST e integração com bancos SQL Server e MySQL. Atuação no front-end com React.',
  false,
  '2023-07-01'
),
(
  'Analista de Sistemas', 
  'Open Consult', 
  'Jun 2023 - Jul 2023', 
  'Implementação de políticas de IAM, fluxos de trabalho de segurança e relatórios de governança de identidade.',
  false,
  '2023-06-01'
),
(
  'Monitor de P.O.O.', 
  'UFAL', 
  'Set 2022 - Fev 2023', 
  'Auxílio no ensino de Java, Spring MVC e Design Patterns para alunos de graduação.',
  false,
  '2022-09-01'
);

-- 3. INSERIR PROJETOS
INSERT INTO projects (title, description, tech_stack, repo_url, image_url) VALUES
(
  'ImageLite',
  'Fullstack App com Spring Boot, React e Docker. Sistema de galeria com autenticação JWT e upload de imagens.',
  ARRAY['Java', 'Spring Boot', 'React', 'Docker', 'PostgreSQL'],
  'https://github.com/DevFullStack-Franklyn-R-Silva/ImageLite',
  'https://placehold.co/600x400/png?text=ImageLite' 
),
(
  'Calculadora Flutter',
  'App mobile cross-platform desenvolvido com arquitetura limpa e testes unitários. Interface responsiva.',
  ARRAY['Flutter', 'Dart', 'Android', 'iOS'],
  'https://github.com/DevFullStack-Franklyn-R-Silva/Calculadora-em-Dart_Flutter',
  'https://placehold.co/600x400/png?text=Calc+App'
),
(
  'TCC - Livraria Nuvem',
  'Arquitetura de microsserviços escalável para e-commerce. Foco em alta disponibilidade.',
  ARRAY['Microservices', 'Java', 'Spring Cloud', 'RabbitMQ'],
  'https://github.com/DevFullStack-Franklyn-R-Silva/Desenvolvimento-de-aplicacao-em-nuvem-escalavel',
  'https://placehold.co/600x400/png?text=Microservices'
);