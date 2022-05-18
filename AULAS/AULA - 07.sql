create database Sprint3;

use Sprint3;

create table Aluno (
idAluno		int primary key auto_increment,
Nome		varchar (45)
)auto_increment = 50000;

create table curso (
idCurso 	int primary key auto_increment,
nomeCurso 	varchar (45)
);

insert into Aluno (nome) values 
	('Giovanna'),
    ('Eduarda'),
    ('Yuri');

insert into curso (nomeCurso) values 
	('Inglês'),
    ('Espanhol'),
    ('Mandarim');
    
select * from Curso;

Select * from Aluno;

-- CRIANDO A TABELA ASSOCIATIVA / RELACIONAMENTO N PARA N 
create table Matricula (
idMat int auto_increment,
fkRa  int,
foreign key (fkRa) references Aluno (idAluno),
fkCurso int,
foreign key (fkCurso) references curso (idCurso),
primary key (idMat,fkRa,fkCurso),
dtInicio date,
nivel varchar(45)
);

insert into Matricula values 
(null,50000, 1, '2022-04-28', 'B1'),
(null,50000, 2, '2022-03-15', 'A1'),
(null,50001, 1, '2022-01-20', 'A3'),
(null,50002, 3, '2022-01-20', 'I4');

select * from Matricula;

select * from Aluno join matricula on idAluno = fkRa 
	join curso on idCurso = fkCurso;
    
insert into curso (nomeCurso) values 
('Francês');

select * from Aluno join matricula on idAluno = fkRa 
	right join curso on idCurso = fkCurso
		where fkRa is null;
        
insert into aluno (nome) values
('Heloisa');

select * from Aluno left join matricula on idAluno = fkRa;

select nome, nomeCurso from Aluno left join matricula on idAluno = fkRa 
	left join curso on idCurso = fkCurso
		where fkRa is null
			union
select nome, nomeCurso from Aluno right join matricula on idAluno = fkRa
	right join curso on idCurso = fkCurso
		where fkCurso is null;
