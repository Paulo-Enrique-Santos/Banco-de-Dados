-- CRIAR A TABELA
create table Empresa(
id				int primary key auto_increment,
nome			varchar(100),
responsavel		varchar(50)
	);

-- DESCRIÇÃO DA TABELA    
describe Empresa;

-- INSERIR DADOS NA TABELA EMPRESA
insert into Empresa values (null,'C6 Bank','Paulo',null);

-- EXIBIR DADOS DA TABELA

select * from Empresa;

-- INSERIR MAIS EMPRESAS
insert into Empresa(nome,responsa) values ('Safra', 'João'),
										  ('BandTec Internacional','Petry');
                                             
-- ALTER TABLE
-- ATUALIZA CAMPOS/ESTRUTURA DA TABELA

-- ADICIONAR UMA COLUNA
alter table Empresa add column area varchar(40);

desc Empresa;
select * from Empresa;

-- ATUALIZAR O CAMPO AREA DOS REGISTROS
update Empresa set area= 'TI' where id=1;

-- ATUALIZAR O CAMPO AREA DO REGISTRO 2 E 3
update Empresa set area = 'MKT' where id in (2,3);

-- ALTER TABLE (MODIFICAR A COLUNA)
desc Empresa;

alter table Empresa modify column responsavel varchar(75);

-- ALTER TABLE (RENOMEAR A COLUNA)
alter table Empresa rename column responsavel to responsa;

desc Empresa;

-- CTRL + ESPAÇO SERVE PARA AJUDAR NO PROXIMO COMANDO 
-- ALTER TABLE (EXCLUIR UM CAMPO)
alter table Empresa drop column area;
select * from Empresa;


-- EXCLUIR A EMPRESA COM O ID = 2
delete from Empresa where id =2;
select * from Empresa;

-- INSERT INTO PARA VISUALIZAR QUE O AUTO INCREMENT INCREMENTA DO ULTIMO DADO
insert into Empresa(nome,responsa) values('Accenture', 'Pedro');
select * from Empresa;

-- AUTO INCREMENT COMEÇANDO DE QUALQUER NÚMERO
create table Filme (
id int primary key auto_increment,
nome varchar (40)
)auto_increment=500;

-- INSERINDO DADOS NA TABLEA QUE ACABAMOS DE CRIRAR 
insert into Filme(nome) values ('Shrek');
select * from Filme;

select * from Empresa;

select id,nome from Empresa;

-- LIMPAR A TABELA EMPRESA
delete from Empresa where id>=1;
select * from Empresa;

insert into Empresa (id,nome) values (null, 'Empresa Nova');

-- COMANDO CORRETO PARA LIMPAR A TABELA 
truncate table Empresa;
select * from Empresa;
insert into Empresa (id,nome) values (null, 'Empresa Nova');

select * from Filme;
truncate table Filme;
insert into Filme values (null,'Shrek 7');

-- EXIBE O NOME DAS EMPRESAS QUE SÃO DIFERENTES DE SAFRA
select nome from Empresa where nome <> 'Safra';
select nome from Empresa where nome != 'Safra';

-- ADICIONAR UM CAMPO NA TABELA EMPRESA 
-- CAMPO = SALARIO
-- EXISTEM 4 TIPOS DE CAMPOS NÚMERICOS
-- INT INTEIRO 10 DIGITOS 
-- FLOAT DECIMAL ACEITA 7 DIGITOS 
-- DOUBLE 15 DIGITOS 
-- DECIMAL () ACEITA 28 DIGITOS 128 BITS

alter table Empresa add column salario decimal(10,2);
select * from Empresa;

update Empresa set salario =2.99 where id =2; 
update Empresa set nome='Vallemobi', responsa='Giovanna' where id= 1;

update Empresa set salario = 1099.00 where id >=0;

alter table Empresa add column DATADIA date;
-- COMO FAZER YYYY-MM-DD


alter table Empresa add column DATAHORA datetime;
-- COMO FAZER YYYY-MM-DD HH:MM:SS

update Empresa set statusfilme = 'lançamento' where id=1;
-- check table
ALTER TABLE Empresa add column statusfilme varchar(50),
		add check(statusfilme = 'lançamento' or statusfilme = 'pré-estréia');


-- add check (statusfilme in ('lançamento','pré-estréia'));


/* create table Tabela (
idTabela int primary key auto_increment,
statustabela char(1),
check (status tabela in ('a', 'f'))
);