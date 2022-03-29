-- CRIAR O BANCO DE DADOS
CREATE DATABASE faculdade1adsa;

-- SELECIONAR O BANCO DE DADOS CRIADO
USE faculdade1adsa;

-- CRIAR TABELA ALUNO
CREATE TABLE Aluno (
ra CHAR(8) PRIMARY KEY,
nome VARCHAR(100),
bairro VARCHAR(50),
email VARCHAR(48)
);

-- NOSSO PRIMEIRO SELECT
-- EXIBIR TODOS OS DADOS DA TABELA
SELECT * FROM Aluno;

-- INSERIR DADOS NA TABELA
INSERT INTO Aluno VALUES 
('01221001','Aline', 'Jardim São Paulo','aline@sptech');

-- DESCREVER OS CAMPOS DA TABELA
DESCRIBE Aluno;

-- INSERIR MAIS DE UM ALUNO NO MESMO COMANDO
INSERT INTO Aluno VALUES
('01221062', 'Giovanna com 2 n', 'Jabaquara', 'gio@sptech'),
('01221189', 'Gabriel Martins', 'Missionário', 'gabriel@sptech'),
('01221197', 'Guilherme Benassi', 'Guaianases', 'benassi@sptech');

-- EXIBIR TODOS OS DADOS DA TABELA
SELECT * FROM Aluno;

SELECT ra, nome, bairro, email FROM Aluno;
SELECT ra, nome, email, bairro FROM Aluno;

SELECT ra FROM Aluno;

-- ORDENAR PELO BAIRRO EM ORDEM CRESCENTE
SELECT * FROM Aluno ORDER BY bairro;

-- ORDENAR PELO BAIRRO EM ORDEM DECRESCENTE
SELECT * FROM Aluno ORDER BY bairro desc;

-- EXIBINDO APENAS A GIOVANNA
SELECT * FROM Aluno WHERE nome = 'Giovanna com 2 n';

-- EXIBINDO APENAS O RA DO BENASSI
SELECT ra FROM Aluno WHERE nome = 'Guilherme Benassi';

-- EXIBINDO OS BAIRROS QUE COMEÇAM COM J
SELECT bairro FROM Aluno WHERE bairro LIKE 'J%';
-- EXIBINDO OS BAIRROS QUE TERMINAM COM O
SELECT bairro FROM Aluno WHERE bairro LIKE '%o';

-- EXIBIR OS BAIRROS ONDE A SEGUNDA LETRA É A
SELECT bairro FROM Aluno WHERE bairro LIKE '_a%';

-- EXIBINDO OS BAIRROS ONDE A PENÚLTIMA É r
SELECT bairro FROM Aluno WHERE bairro LIKE '%r_';

SELECT * FROM Aluno;

-- ATUALIZAR O NOME DA GIOVANNA
UPDATE Aluno SET nome = 'Giovanna' WHERE ra = '01221062';
-- update nomeTabela SET nomeCampo = 'Campo Novo' WHERE chave pk é igual ao ra da Giovanna

update aluno set bairro = 'missionaria' where ra ='01221189';

-- INSERIR APENAS UM RA
INSERT INTO Aluno VALUES ('01221999', null, null, null);
INSERT INTO Aluno (ra) VALUES ('01221888');

select * from Aluno;

-- ATUALIZAR O NOME E O BAIRRO DO RA FINAL 888
UPDATE Aluno SET nome = 'Paulo', bairro = 'Centro' WHERE ra = '01221888';

-- EXCLUIR O RA 01221999
DELETE FROM Aluno WHERE ra = '01221999';

-- COMANDOS PARA SE PENSAR EM NUNCA FAZER
-- EXCLUIR A TABELA
-- DROP TABLE Aluno;

-- EXCLUIR O BANCO DE DADOS
-- DROP DATABASE faculdade1adsa;