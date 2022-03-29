SELECT * FROM Atleta;

INSERT INTO Atleta VALUES
(NULL, 'João' , 'Futebol' , 1),
(NULL, 'Maria' , 'Atletismo' , 6),
(NULL, 'Pedro' , 'Basquete' , 16),
(NULL, 'Henrique' , 'Vôlei' , 0),
(NULL, 'Marcela' , 'Natação' , 5);

-- SELECT * FROM Atleta;
+----------+----------+------------+------------+
| idAtleta | Nome     | Modalidade | qtdMedalha |
+----------+----------+------------+------------+
|        1 | João     | Futebol    |          1 |
|        2 | Maria    | Atletismo  |          6 |
|        3 | Pedro    | Basquete   |         16 |
|        4 | Henrique | Vôlei      |          0 |
|        5 | Marcela  | Natação    |          5 |
+----------+----------+------------+------------+

CREATE TABLE Pais (
idPais INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR (30),
Capital VARCHAR (40)
);

INSERT INTO Pais VALUES 
(NULL, 'Brasil' , 'Brasília' ),
(NULL, 'EUA' , 'Washington' );

--SELECT * FROM Pais
+--------+--------+------------+
| idPais | Nome   | Capital    |
+--------+--------+------------+
|      1 | Brasil | Brasília   |
|      2 | EUA    | Washington |
+--------+--------+------------+

-- INSERINDO FKPAIS EM ATLETA
alter table Atleta add column fkPais int,
	add foreign key (fkPais) references Pais (idPais);

-- DESCREVENDO A TABELA ATLETA
desc Atleta;

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| idAtleta   | int         | NO   | PRI | NULL    | auto_increment |
| Nome       | varchar(40) | YES  |     | NULL    |                |
| Modalidade | varchar(40) | YES  |     | NULL    |                |
| qtdMedalha | int         | YES  |     | NULL    |                |
| fkPais     | int         | YES  | MUL | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

SELECT * FROM Atleta;

-- ATUALIZANDO AS FKS
UPDATE Atleta SET fkPais = 2 WHERE idAtleta IN (2,4);
UPDATE Atleta SET fkPais = 1 WHERE idAtleta IN (1,3,5);

+----------+----------+------------+------------+--------+
| idAtleta | Nome     | Modalidade | qtdMedalha | fkPais |
+----------+----------+------------+------------+--------+
|        1 | João     | Futebol    |          1 |      1 |
|        2 | Maria    | Atletismo  |          6 |      2 |
|        3 | Pedro    | Basquete   |         16 |      1 |
|        4 | Henrique | Vôlei      |          0 |      2 |
|        5 | Marcela  | Natação    |          5 |      1 |
+----------+----------+------------+------------+--------+

-- EXIBINDO OS ATLETAS E SEUS PAÍSES
SELECT * FROM Atleta JOIN Pais ON idPais = fkPais;

+----------+----------+------------+------------+--------+--------+--------+------------+
| idAtleta | Nome     | Modalidade | qtdMedalha | fkPais | idPais | Nome   | Capital    |
+----------+----------+------------+------------+--------+--------+--------+------------+
|        1 | João     | Futebol    |          1 |      1 |      1 | Brasil | Brasília   |
|        3 | Pedro    | Basquete   |         16 |      1 |      1 | Brasil | Brasília   |
|        5 | Marcela  | Natação    |          5 |      1 |      1 | Brasil | Brasília   |
|        2 | Maria    | Atletismo  |          6 |      2 |      2 | EUA    | Washington |
|        4 | Henrique | Vôlei      |          0 |      2 |      2 | EUA    | Washington |
+----------+----------+------------+------------+--------+--------+--------+------------+

-- EXIBINDO APENAS O NOME DO ATLETA E DO PAIS
select Atleta.nome, Pais.nome from Atleta join Pais on idPais = fkPais;

+----------+--------+
| nome     | nome   |
+----------+--------+
| João     | Brasil |
| Pedro    | Brasil |
| Marcela  | Brasil |
| Maria    | EUA    |
| Henrique | EUA    |
+----------+--------+

-- RENOMEANDO UMA COLUNA NO SELECT
select Atleta.nome AS 'Nome Atleta', Pais.nome AS 'Nome Pais' from Atleta join Pais on idPais = fkPais;
+-------------+-----------+
| Nome Atleta | Nome Pais |
+-------------+-----------+
| João        | Brasil    |
| Pedro       | Brasil    |
| Marcela     | Brasil    |
| Maria       | EUA       |
| Henrique    | EUA       |
+-------------+-----------+

-- EXIBINDO OS ATLETAS E SEUS PAÍSES DE DETERMINADA CAPITAL
select Atleta.nome, Pais.nome from Atleta join Pais on idPais = fkPais WHERE Pais.Capital = 'Brasília';
+---------+--------+
| nome    | nome   |
+---------+--------+
| João    | Brasil |
| Pedro   | Brasil |
| Marcela | Brasil |
+---------+--------+

-- EXIBINDO COM DOIS FILTROS
select Atleta.nome, Pais.nome from Atleta join Pais on idPais = fkPais WHERE Pais.Capital = 'Brasília' AND Atleta.Modalidade = 'Futebol';
+------+--------+
| nome | nome   |
+------+--------+
| João | Brasil |
+------+--------+
