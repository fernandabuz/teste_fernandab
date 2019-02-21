CREATE DATABASE teste_fernandab DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

USE teste_fernandab;

-- 1. Modelar o banco de acordo com o diagrama abaixo (Script com a criação das tabelas)

CREATE TABLE genero 
  ( 
     id_genero  INTEGER auto_increment, 
     nome       VARCHAR(100) NOT NULL, 
     dt_criacao DATETIME, 
     ativo      BIT NOT NULL, 
     PRIMARY KEY (id_genero) 
  ); 

CREATE TABLE filme 
  ( 
     id_filme   INTEGER auto_increment, 
     nome       VARCHAR(200) NOT NULL, 
     dt_criacao DATETIME NOT NULL, 
     ativo      BIT NOT NULL, 
     id_genero  INTEGER NOT NULL, 
     PRIMARY KEY (id_filme), 
     FOREIGN KEY (id_genero) REFERENCES genero(id_genero) 
  ); 

CREATE TABLE filme_locacao 
  ( 
     id_filme_locacao INTEGER auto_increment, 
     id_filme         INTEGER NOT NULL, 
     PRIMARY KEY (id_filme_locacao), 
     FOREIGN KEY (id_filme) REFERENCES filme(id_filme) 
  ); 

CREATE TABLE usuario 
  ( 
     id_usuario INTEGER auto_increment, 
     nome       VARCHAR(200) NOT NULL, 
     email      VARCHAR(100), 
     cpf        VARCHAR(14), 
     ativo      BIT NOT NULL, 
     PRIMARY KEY (id_usuario) 
  );

CREATE TABLE locacao 
  ( 
     id_locacao       INTEGER auto_increment, 
     id_filme_locacao INTEGER NOT NULL, 
     id_usuario       INTEGER NOT NULL, 
     dt_locacao       DATETIME NOT NULL, 
     PRIMARY KEY (id_locacao), 
     FOREIGN KEY (id_filme_locacao) REFERENCES filme_locacao(id_filme_locacao), 
     FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) 
  ); 

-- 1.2 Faça um SQL que insira 20 filmes

INSERT INTO filme (nome, dt_criacao, ativo, id_genero)
VALUES  	('The equalizer', '2014-09-25 02:12:00', b'1', '1'),
			('The equalizer 2', '2018-08-16 02:00:00', b'1', '1'),
			('Mad Max: Fury Road', '2015-05-14 02:00:00', b'1', '1'),
			('Logan', '2017-03-02 02:21:00', b'1', '1'),
			('Forrest Gump', '1994-12-07 02:22:00', b'1', '2'),
			('La vita è bella', '1999-02-05 01:56:00', b'1', '2'),
			('Casablanca', '1943-09-17 01:42:00', b'1', '2'),
			('Modern Times', '1936-02-25 01:27:00', b'1', '2'),
			('Hereditary', '2018-06-21 02:07:00', b'1', '3'),
			('Halloween', '2018-10-19 01:56:00', b'1', '3'),
			('Climax', '2018-09-19 01:36:00', b'1', '3'),
			('A quiet place', '2018-04-05 01:31:00', b'1', '3'),
			('Blade Runner 2049', '2017-10-05 02:44:00', b'1', '4'),
			('Interestellar', '2015-11-06 02:49:00', b'1', '4'),
			('Inception', '2010-08-06 02:28:00', b'1', '4'),
			('Star Wars: The force awakens', '2015-12-17 02:15:00', b'1', '4'),
			('Hababam Sinifi', '1975-04-01 01:25:00', b'1', '5'),
			('Dag II', '2016-11-04 02:15:00', b'1', '5'),
			('The Shawshank Redemption', '1995-03-17 02:22:00', b'1', '5'),
			('The Godfather', '1972-09-10 02:55:00', b'1', '5');
        
-- 1.3 Faça um SQL que insira 5 usuários

INSERT INTO usuario (nome, email, cpf, ativo)
VALUES  	('Maria', 'maria@maria.com.br', '11111111111', b'1'),
			('José', 'jose@jose.com.br', '22222222222', b'1'),
			('Pedro', 'pedro@pedro.com.br', '33333333333', b'1'),
			('João', 'joao@joao.com.br', '44444444444', b'1'),
			('Helena', 'helena@helena.com.br', '55555555555', b'1');
        
-- 1.4 Faça um SQL que insira 5 gêneros

INSERT INTO genero (nome, ativo)
VALUES  	('Action', b'1'),
			('Romance', b'1'),
			('Horror', b'1'),
			('Sci-Fi', b'1'),
			('Drama', b'1');
        
-- 1.5 Faça um SQL que insira 20 locações utilizando todos os usuários/gêneros/filmes

INSERT INTO filme_locacao (id_filme)
VALUES 		('1'), 
			('2'), 
			('3'), 
			('4'), 
			('5'), 
			('6'),
			('7'),
			('8'),
			('9'), 
			('10'), 
			('11'), 
			('12'), 
			('13'), 
			('14'), 
			('15'), 
			('16'), 
			('17'), 
			('18'), 
			('19'), 
			('20');

INSERT INTO locacao (id_filme_locacao, id_usuario, dt_locacao)
VALUES 		('1', '1', '2019-02-21 08:00:00'),
			('2', '1', '2019-02-21 08:00:00'),
			('3', '1', '2019-02-21 08:00:00'),
			('4', '1', '2019-01-21 08:00:00'),
			('5', '2', '2019-01-20 08:00:00'),
			('6', '2', '2019-01-20 08:00:00'),
			('7', '2', '2018-02-20 08:00:00'),
			('8', '2', '2018-02-20 08:00:00'),
			('9', '3', '2018-02-19 08:00:00'),
			('10', '3', '2019-02-19 08:00:00'),
			('11', '3', '2019-02-19 08:00:00'),
			('12', '3', '2019-02-19 08:00:00'),
			('13', '4', '2019-02-19 08:00:00'),
			('14', '4', '2018-12-19 08:00:00'),
			('15', '4', '2018-12-19 08:00:00'),
			('16', '4', '2019-02-19 08:00:00'),
			('17', '5', '2019-02-19 08:00:00'),
			('18', '5', '2018-10-19 08:00:00'),
			('19', '5', '2018-10-19 08:00:00'),
			('20', '5', '2019-02-19 08:00:00');
        
-- 1.6 Faça um SQL que busque todas as locações deste mês com as seguintes colunas: 
-- Filme.Nome, Genero.Nome, Locacao.DtLocacao, Usuario.Nome, Usuario.Email

SELECT fl.nome, 
       gn.nome, 
       lc.dt_locacao, 
       usr.nome, 
       usr.email 
FROM   filme fl 
       INNER JOIN genero gn 
               ON gn.id_genero = fl.id_genero 
       INNER JOIN locacao lc 
               ON lc.id_filme_locacao = fl.id_filme 
       INNER JOIN filme_locacao flc 
               ON flc.id_filme_locacao = lc.id_filme_locacao 
       INNER JOIN usuario usr 
               ON usr.id_usuario = lc.id_usuario 
WHERE  Month(lc.dt_locacao) = Month(Now()) 
       AND Year(lc.dt_locacao) = Year(Now());

-- Observação: Como eu cadastrei todos os usuários como ativos, eu desativei dois usuários para melhor visualização da questão 1.7

UPDATE usuario 
SET    ativo = b'0' 
WHERE  id_usuario = '1'; 

UPDATE usuario 
SET    ativo = b'0' 
WHERE  id_usuario = '2'; 

-- 1.7 Faça um SQL que apresente todos os usuários inativos que já tiveram alguma locação com as seguintes colunas:
-- Usuário.Nome, Usuario.CPF

SELECT DISTINCT usr.nome, 
                usr.cpf 
FROM   usuario usr 
       INNER JOIN locacao lc 
               ON lc.id_usuario = usr.id_usuario 
       INNER JOIN filme_locacao flc 
               ON flc.id_filme_locacao = lc.id_filme_locacao 
WHERE  usr.ativo = b'0'; 

-- 1.8 Faça um SQL que apresente a filmes alugados por usuários que contém a letra “a” em seu email com as seguintes colunas:
-- Filme.ID, Filme.Nome

SELECT DISTINCT fl.id_filme, 
                fl.nome 
FROM   filme fl 
       INNER JOIN filme_locacao flc 
               ON flc.id_filme = fl.id_filme 
       INNER JOIN locacao lc 
               ON lc.id_filme_locacao = flc.id_filme_locacao 
       INNER JOIN usuario usr 
               ON lc.id_usuario = usr.id_usuario 
WHERE  usr.email LIKE '%a%'; 

-- 1.9 Faça um SQL que apresente os filmes mais alugados:
-- Filme.Nome, Quantidade de aluguéis

SELECT Count(lc.id_filme_locacao)qtd_aluguel, 
       fl.nome 
FROM   filme fl 
       INNER JOIN filme_locacao flc 
               ON fl.id_filme = flc.id_filme 
       INNER JOIN locacao lc 
               ON lc.id_filme_locacao = flc.id_filme_locacao 
GROUP  BY fl.nome 
ORDER  BY qtd_aluguel DESC;




