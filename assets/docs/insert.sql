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


-- 4. INSERIR CERTIFICADOS
-- 1. Limpar experiências antigas (para não duplicar)
TRUNCATE TABLE experiences;

-- 2. Inserir as novas experiências
INSERT INTO experiences (role, company, period, description, is_current, start_date) VALUES
(
  'Desenvolvedor Mobile',
  'NWERP',
  'Out 2025 - Atualmente', -- Mantive sua data, verifique se é 2025 mesmo (futuro) ou 2024/23
  'Criação de um sistema abrangente de gestão de vendas B2B e pré-faturamento construído com Flutter e Supabase. Esta aplicação web e mobile agiliza a gestão de clientes, navegação no catálogo de produtos e processamento de pedidos para equipes de vendas.',
  true,
  '2025-10-01' -- Data usada apenas para ordenação no app
),
(
  'Analista de sistemas',
  'Grupo Coagro',
  'Jul 2024 - Atualmente',
  'Desenvolvedor Mobile (Flutter) e de APIs (Node.js/TS), com foco na otimização de Logística (endereçamento/etiquetas), Vendas (CRM de Campo, faturamento de NFs e apps de loja) e na gestão operacional de sistemas críticos, possuindo experiência com WinThor e Oracle DB.',
  true,
  '2024-07-01'
),
(
  'Desenvolvedor Fullstack',
  'Plussoft',
  'Jul 2023 - Dez 2023',
  'Desenvolvimento de aplicativos Desktop com Electron (backup e envio de arquivos). Manutenção em APIs, criação de rotas e integração com SQL Server e MySQL. Manutenção de front-end React.',
  false,
  '2023-07-01'
),
(
  'Analista de Sistemas',
  'Open Consult',
  'Jun 2023 - Jul 2023',
  'Desenvolvimento e implementação de políticas estratégicas de IAM e fluxos de trabalho de segurança.',
  false,
  '2023-06-01'
),
(
  'Monitor de P.O.O.',
  'UFAL',
  'Set 2022 - Fev 2023',
  'Ensino de Programação Orientada a Objetos utilizando Java, Spring MVC e Design Patterns. Auxílio aos alunos em projetos práticos.',
  false,
  '2022-09-01'
);


-- 4. INSERIR CERTIFICADOS
INSERT INTO certificates (title, description, credential_url, language, framework) VALUES
(
  'Flutter & Dart - The Complete Guide',
  'Curso completo cobrindo Widgets, State Management, Animation e Backend integration.',
  'https://www.udemy.com/certificate/UC-c3a19ceb-ec98-4ae8-bd0c-acb44eaa78f6/', -- Coloque o link real aqui
  'Dart',
  'Flutter'
),
(
  'Spring Boot Expert',
  'Desenvolvimento de APIs RESTful escaláveis com arquitetura de microsserviços.',
  'https://www.udemy.com/', -- Link exemplo
  'Java',
  'Spring Boot'
);