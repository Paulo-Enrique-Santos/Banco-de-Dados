create database Aula;

use Aula;

-- CRIAR A TABELA EMPRESA
create table Empresa (
idEmpresa 		int primary key auto_increment,
nomeEmpresa 	varchar(45),
responsavel 	varchar(45)
);

-- INSERIR DADOS NA TABELA EMPRESA
insert into Empresa Values
(null, 'C6 Banl', 'Pedro'),
(null, 'Stefanini', 'Thiago'),
(null,'Accenture', 'Maria');

-- SELECT PARA MOSTRAR TUDO 
select * from Empresa;

-- CRIANDO A TABELA ALUNO
create table Aluno(
ra 			char (8) primary key,
nome 		varchar (90),
bairro 		varchar (45),
email 		varchar (45),
fkEmpresa 	int,
foreign key (fkEmpresa) references Empresa (idEmpresa)
);

-- INSERIR DADOS
insert into Aluno values
('01221111','Gabriel', 'Consolação', 'gabriel@sptech',3),
('01221222','Gabriela', 'Paraiso', 'gabriela@sptech',1),
('01221333','Giovanna', 'Jabaquara', 'giovanna@sptech',1),
('01221444','Andre', 'Lapa', 'andre@sptech',2);

-- EXIBIR TODOS OS CAMPOS DOS ALUNOS E SUAS RESPECTIVAS EMPRESAS
select * from Aluno join Empresa on fkEmpresa = idEmpresa;
-- EXIBIR APENAS O NOME DO ALUNO E O NOME DA EMPRESA
select Aluno.nome, Empresa.nomeEmpresa from Aluno
	join Empresa on idEmpresa = fkEmpresa;

-- EXIBIR APENAS O RA E O RESPONSAVEL DA EMPRESA 
-- DE UMA DETERMINADA EMPRESA 

select Aluno.ra, Empresa.responsavel from Aluno
	join Empresa on idEmpresa = fkEmpresa where empresa.nomeEmpresa = 'C6 Bank';
    
-- REFERENCIANDO A CHAVE ESTRANGEIRA NA TABELA JÁ EXISTENTE 
-- alter table aluno add column fkEmpresa int,
	-- add foreing key (fkEmpresa) references Empresa (idEmpresa);
