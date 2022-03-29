-- CRIAR O BANCO DE DADOS 
create database aula01; 

-- SELECIONAR O BANCO DE DADOS CRIADO 
use aula01;

-- CRIANDO A TABELA ALUNO 
create table Aluno(
ra 			char(8) primary key,
nome    	varchar(100),
bairro  	varchar(50),
email		varchar(48)
);

-- NOSSO PRIMEIRO SELECT
-- EXIBIR TODOS OS DADOS DA TABELA
select * from Aluno;

-- INSERIR DADOS NA TABELA
insert into Aluno values
('01221001','Aline','Jardim São Paulo','aline@sptech');

-- DESCREVER OS CAMPOS DA TABELA
describe Aluno;

-- INSERIR MAIS DE UM ALUNO NO MESMO COMANDO
insert into Aluno values
('01221062','Giovanna com 2 n','Jabaquara','gio@sptech'),
('01221189','Gabriel Martins','Missionário','gabriel@sptech'),
('01221197','Gabriel Benassi','Guaianases','benassi@sptech');

-- EXIBIR SOMENTE OS QUE EU QUERO EXIBIR E NA ORDEM QUE EU QUERO EXIBIR 
select ra, nome, bairro, email from Aluno;
select ra, nome, email, email from Aluno;

select ra, nome from Aluno;

-- ORDERNAR PELO BAIRRO EM ORDEM CRESCENTE
select * from Aluno order by bairro;

-- ORDERNAR PELO BAIRRO EM ORDEM DECRESCENTE
select * from Aluno order by bairro desc;

-- EXIBINDO APENAS A GIOVANNA 
select * from Aluno where nome = 'Giovanna com 2 n';

-- EXIBINDO APENAS O RA DO BENASSI 
select ra from Aluno where nome = 'Gabriel Benassi';

-- EXIBINDO OS BAIRROS QUE COMEÇAM COM J 
select bairro from Aluno where bairro like 'J%';

-- EXIBINDO OS BAIRROS QUE TERMINAM COM O 
select bairro from Aluno where bairro like '%O';

-- EXIBINDO OS BAIRROS ONDE A SEGUNDA LETRA É A
select bairro from Aluno where bairro like '_A%';

-- EXIBINDO OS BAIRROS ONDE A PENULTIMA LETRA É R
select bairro from Aluno where bairro like '%R_';

-- EXIBINDO A TABELA COMPLETA 
select * from Aluno;

-- ATUALIZAR O NOME DA GIOVANNA COM DOIS N PARA GIOVANNA
update Aluno set nome = 'Giovanna' where ra = '01221062';

-- ATUALIZANDO O BAIRRO DO GABRIEL MARTINS 
update Aluno set bairro = 'Missionária' where ra = '01221189';

-- ATUALIZANDO O NOME DO GUILHERME BENASSI 
update Aluno set nome = ' Guilherme Benassi' where ra = '01221197';

-- INSERINDO APENAS UM RA (APENAS UM CAMPO DA TABELA) 
insert into Aluno values 
('01221999', null, null, null);

-- UM MODO MAIS EFICIENTE
insert into Aluno (ra) values 
('01221888');

-- ATUALIZAR O NOME E O BAIRRO DO RA FINAL 888
update Aluno set nome = 'Paulo', bairro = 'Centro' where ra = '01221888';

-- EXIBINDO A TABELA COMPLETA 
select * from Aluno;

-- EXCLUIR O RA 01221999
delete from Aluno where ra = '01221999';

-- COMANDOS PARA SE PENSAR EM NUNCA FAZER
-- EXCLUIR A TABELA 
-- drop table Aluno;

-- EXCLUIR O BANCO DE DADOS 
-- drop database aula01;

