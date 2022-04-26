create database func1adsa;

use func1adsa;

create table Funcionario(
idFunc 		int primary key auto_increment,
Nome		varchar (45),
Genero		char (1), check (Genero in ('F','M')),
CPF			char (11) unique
) auto_increment = 500;

-- ALTER TABLE
alter table Funcionario add column fkSupervisor int,
	add foreign key (fkSupervisor) references Funcionario (idFunc);
    
desc Funcionario;

-- INSERIR DADOS
insert into Funcionario Values
	(null, 'Vivian', 'F', '11122233344', null);
    
select * from Funcionario;

-- ESTE COMANDO DARÁ ERRO POIS O CPF É UNIQUE E NÃO PODE TER NENHUM REPETIDO.
insert into Funcionario Values
	(null, 'Paulo', 'M', '11122233344', 500);
-- Duplicate entry '11122233344' for key 'funcionario.CPF'	0.484 sec 

insert into Funcionario Values
	(null, 'Paulo', 'M', '55566677788', 500);
    
SELECT * FROM Funcionario;

select Funcionario.Nome as 'Nome Funcionario', Supervisor.Nome from Funcionario
	join Funcionario as Supervisor on Supervisor.idFunc = Funcionario.fkSupervisor;

insert into Funcionario Values
	(null, 'Franklin', 'M', '11133355577', 502);

update Funcionario set fkSupervisor = 502 where idFunc = '503';

delete from Funcionario where idFunc = '503';

-- CRIAR A TABELA DEPENDENTES 
create table Dependentes (
idDep 			int,
NomeDep 		varchar (45),
dtNasc			date,
fkFunc			int,
primary key (idDep,fkFunc),
foreign key (fkFunc) references funcionario(idFunc)
);

-- INSERIR DADOS
insert into Dependentes values 
(1, 'Harry', '2000-10-13', 500);

select * from Dependentes; 

insert into Dependentes values 
(2, 'Luna', '1999-10-13', 500);

insert into Dependentes values 
(1, 'Paula', '1950-10-13', 502);

select * from Dependentes;


--  EXIBIR OS FUNCIONARIOS E SEUS RESPECTIVOS DEPENDENTES

select * from Funcionario 
	join Dependentes on idFunc = fkFunc;
    
select * from Funcionario 
	join Dependentes on idFunc = fkFunc 	
		join Funcionario as Supervisor on Supervisor.idFunc = Funcionario.fkSupervisor;
    




