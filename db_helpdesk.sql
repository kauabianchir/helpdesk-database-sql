CREATE DATABASE helpdesk;
USE helpdesk;

ALTER DATABASE helpdesk
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE Clientes (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
cpf char (11) UNIQUE NOT NULL,
nome VARCHAR (100) NOT NULL,
email VARCHAR (50) NOT NULL,
status_cliente VARCHAR (9) NOT NULL
);

CREATE TABLE Analistas (
id_analista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
email VARCHAR (50) NOT NULL,
tipo_analista CHAR (2) NOT NULL,
status_analista VARCHAR (9) NOT NULL
);

CREATE TABLE Chamados (
id_chamados INT PRIMARY KEY AUTO_INCREMENT,
id_cliente_chamado INT,
id_analista_chamado INT,
causa_do_chamado VARCHAR (255) NOT NULL,
status_chamado VARCHAR (10) NOT NULL,
data_abertura DATETIME NOT NULL,
data_fechamento DATETIME,
FOREIGN KEY (id_cliente_chamado) REFERENCES Clientes (id_cliente),
FOREIGN KEY (id_analista_chamado) REFERENCES Analistas (id_analista)
);

INSERT INTO Clientes (cpf, nome, email, status_cliente)
VALUES ('57390684021', 'Julio Gomes de Souza Ferraz', 'juliogom@gmail.com', 'Ativo'),
 ('34667843201', 'Lillian Marcos Ferreira Junior', 'marcosferreiral@outlook.com.br', 'Ativo'),
 ('89023454624', 'Helena Aparecida Cruz', 'helenaapar@hotmail.com', 'Ativo'),
 ('23476832456', 'Adrian Martins Afonso de Moraes', 'adrianmartins940@gmail.com', 'Ativo'),
 ('30928950261', 'Bela Silva Souza de Fontaine', 'belasilva4@gmail.com', 'Ativo');

INSERT INTO Analistas (nome, email, tipo_analista, status_analista)
VALUES ('Kayan Vinicius Moreira', 'analistatecnico1@suporte.com', 'N2', 'Ativo'),
 ('Jhonathan Jesus Nascimento', 'analistatecnico2@suporte.com', 'N3', 'Ativo'),
 ('Kauã Bianchi Ribeiro', 'analistatecnico3@suporte.com', 'N1', 'Ativo');
 
 INSERT INTO Chamados (id_cliente_chamado, id_analista_chamado, causa_do_chamado, status_chamado, data_abertura, data_fechamento)
VALUES (1, 2, 'O cliente estava com dificuldades para assinar os termos de contrato, era feito a requisição no sistema, porém o TOKEN DIGITAL falhava, foi necessario acessas os logs e contatar a equipe de desenvolvimento para verificar o erro', 'Concluido', '2026-03-23 10:27:51', '2026-03-23 11:05:24'),
 (4, 3, 'O usuario não estava conseguindo cadastrar seus novos produtos, pois o mesmo preencheu um campo STRING como INT', 'Concluido', '2026-04-27 09:11:36', '2026-04-27 09:40:27'),
 (2, 1, 'Cliente não teve o recebimento do pagamento de suas vendas, um erro 502 na requisição não esta permitindo', 'Pendente', '2026-02-15 15:07:16', NULL),
 (5, 1, 'O usuario não consegue fazer a personalização do seu domino, uma falha na autenticação de segurança do site não permite o site ser seguro. Aguardando nova solicitação e periodo de até 72h para a propagação do certificado', 'Pendente', '2026-03-15 17:48:03', NULL);
 
 SELECT Chama.id_chamados AS Numero_Chamado, Chama.status_chamado, ana.nome AS Nome_Analista, clie.nome AS Nome_Cliente, Chama.causa_do_chamado AS Assunto, TIMESTAMPDIFF(MINUTE, Chama.data_abertura, Chama.data_fechamento) AS SLA_Minutos FROM Chamados Chama INNER JOIN Clientes clie ON Chama.id_cliente_chamado = clie.id_cliente INNER JOIN Analistas ana ON Chama.id_analista_chamado = ana.id_analista ORDER BY Numero_Chamado ASC;