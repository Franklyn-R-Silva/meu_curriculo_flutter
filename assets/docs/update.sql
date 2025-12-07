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