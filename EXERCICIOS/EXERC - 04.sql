-- CRIANDO O BANCO DE DADOS 
create database sprint1;

-- USANDO A DATABASE
use sprint1;

-- CRIANDO A TABELA
create table Professor (
idProfessor 		int primary key auto_increment,
Nome				varchar (50),
Sobrenome			varchar (30),
Especialidade1 		varchar (40),
Especialidade2		varchar (40)
);

-- INSERINDO DADOS NA TABELA
insert into Professor Values 
(NULL,'José','Aloísio','Geografia','Fisica'),
(NULL,'Maria','Luíza','Biologia','Quimica'),
(NULL,'Jonas','Dos Santos','Português',null),
(NULL,'Paulo','Enrique','Matemática','Biologia'),
(NULL,'Carlos','Santos','Fisica',null),
(NULL,'Aline','Cardoso','Quimica','Portugês');

-- CONFERINDO
select * from Professor;

-- CRIANDO A TABELA DISCIPLINA
create table Disciplina (
idDisc		int primary key auto_increment,
Nome 		varchar(45)
);

-- INSERINDO DADOS NA TABELA
insert into Disciplina Values
(null,'Biologia'),
(null,'Quimica'),
(null,'Matemática');

-- CONFERINDO
select * from Disciplina;

-- Configurar a chave estrangeira na tabela conforme sua modelagem (Pode fazer no comando CREATE TABLE)
alter table Disciplina add column idProfessor int,
	add foreign key (idProfessor) references Professor (idProfessor);
    
-- DESCEVENDO 
describe Disciplina;

select * from Disciplina;

-- ATUALIZANDO OS DADOS 
update Disciplina set Disciplina.idProfessor = 2 where idDisc = 1;
update Disciplina set Disciplina.idProfessor = 6 where idDisc = 2;
update Disciplina set Disciplina.idProfessor = 4 where idDisc = 3;

-- Exibir os professores e suas respectivas disciplinas;
select * from Professor join Disciplina on Professor.idProfessor = Disciplina.idProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor;
select Professor.Nome as 'Nome Professor', Disciplina.Nome as 'Nome Disciplina' from Professor join Disciplina on Professor.idProfessor = Disciplina.idProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;
select * from Professor join Disciplina on Professor.idProfessor = Disciplina.idProfessor where Professor.Sobrenome = 'Enrique';

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1;
select Professor.Especialidade1, Disciplina.Nome from Professor 
	join Disciplina on Professor.idProfessor = Disciplina.idProfessor order by Especialidade1;
    
-- CRIANDO A TABELA
create table Curso (
idCurso 		int primary key auto_increment,
Nome 			varchar (50),
sigla 			char(3),
coordenador 		varchar (50)
);

-- INSERINDO DADOS NA TABELA 
insert into Curso Values 
(null,'Ciências da Computação','CCO','Maria'),
(null,'Sistemas de Informação','SIS','João'),
(null,'Analise e Desenvolvimento de Sistemas','ADS','Carlos');

-- CONSULTADO VALORES 
select * from Curso;

-- CRIANDO A TABELA ALUNO
create table Aluno (
idAluno		int primary key auto_increment,
Nome		varchar (40),
Curso		char(3)
);

-- COLOCANDO A CHAVE ESTRANGEIRA
alter table Aluno add column idCurso int,
	add foreign key (idCurso) references Curso (idCurso);
    
-- INSERINDO DADOS 
insert into Aluno values 
(null,'João Pedro','SIS',2),
(null,'Henrique Almeida','CCO',1),
(null,'Paulo Enrique','ADS',3),
(null,'Carlos Santos','ADS',3);

-- CONFERINDO
select * from Aluno;

-- Faça um JOIN entre as duas tabelas;
select * from Aluno join Curso on Aluno.idCurso = Curso.idCurso;

-- Faça um JOIN com WHERE entre as duas tabelas;
select * from Aluno join Curso on Aluno.idCurso = Curso.idCurso where Curso.sigla = 'ADS';

-- Crie um campo com a restrição (constraint) de CHECK;
alter table Aluno add column Sexo varchar (9)
	constraint Sexo check (Sexo in ('Masculino', 'Feminino') );