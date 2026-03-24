# 🚀 Sistema de Helpdesk - Modelagem Relacional (MySQL)

Este projeto consiste na modelagem, estruturação e povoamento de um Banco de Dados Relacional focado no gerenciamento de chamados técnicos (Helpdesk). O objetivo foi aplicar conceitos avançados de SQL para resolver um problema real de negócio: conectar clientes, equipe de suporte e tickets de atendimento.

## 🛠️ Tecnologias e Conceitos Aplicados
* **Banco de Dados:** MySQL
* **Fase DDL (Data Definition Language):** Criação de tabelas, tipagem de dados (`VARCHAR`, `DATETIME`, `INT`), `PRIMARY KEY`, `AUTO_INCREMENT`, e relacionamentos com `FOREIGN KEY`.
* **Fase DML (Data Manipulation Language):** Inserção de dados simulando cenários reais de suporte (erros de API, problemas de token, etc), lidando com valores `NULL` para chamados pendentes.
* **Fase DQL (Data Query Language):** Consultas gerenciais complexas utilizando múltiplos `INNER JOINs`, `Aliases (AS)`, ordenação com `ORDER BY` e uso de funções de tempo.

## ⚙️ Regras de Negócio Implementadas
1. **Proteção de Histórico (Soft Delete):** A tabela de Analistas e Clientes possui uma coluna de `status`. Em vez de deletar um registro (o que quebraria as chaves estrangeiras dos chamados antigos), o status é alterado para inativo.
2. **Cálculo de SLA Dinâmico:** Utilização da função `TIMESTAMPDIFF` para calcular em minutos o tempo exato de resolução do chamado (Data de Fechamento - Data de Abertura). Chamados ainda pendentes retornam o SLA como `NULL`.

## 💻 Estrutura das Tabelas
* `Clientes`: id_cliente, cpf, nome, email, status_cliente
* `Analistas`: id_analista, nome, email, tipo_analista (N1, N2, N3), status_analista
* `Chamados`: id_chamados, id_cliente_chamado, id_analista_chamado, causa_do_chamado, status_chamado, data_abertura, data_fechamento
