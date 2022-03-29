-- CRIANDO O BANCO DE DADOS 
create database Continuada1;

-- SELECIONANDO O BANCO DE DADOS
use Continuada1;

-- CRIANDO A TABELA HIGIENE
create table Higiene (
idHigiene 		int primary key,
nome			varchar(80),
marca			varchar(95),
dtValidade		date,
lote			char(7)
);

-- INSERINDO DADOS NA TABELA 
insert into Higiene Values (1,'Sabão em Pó','OMO','2023-08-17','LOTE008'),
						   (2,'Papel Higiênico','Nuvem','2029-09-23','LOTE072'),
                           (3,'Shampoo','Dove','2024-02-09','LOTE098'),
                           (4,'Sabonete','Phebo','2025-07-14','LOTE998'),
                           (5,'Pasta de Dente','Sorriso','2025-12-2','LOTE864');
                           
-- MUDANDO O TAMANHO DO CAMPO NOME
alter table Higiene modify column nome varchar(100);

-- CONFIRMANDO SE MUDOU O TAMANHO DO CAMPO
describe Higiene;

-- EXIBINDO TODOS OS DADOS DA TABELA 
select * from Higiene;

-- EXIBINDO APENAS OS NOMES E AS MARCAS 
select nome,marca from Higiene;

-- EXIBINDO APENAS OS DADOS DE UM DETERMINADO LOTE (LOTE864)
select * from Higiene where lote='LOTE864';

-- EXIBINDO OS DADOS DO PRODUTO DE UMA DETERMINADA VALIDADE 
select * from Higiene where dtValidade='2029-09-23';

-- EXIBINDO OS DADOS DA TABELA ORDENADO PELA VALIDADE DOS PRODUTOS
select * from Higiene order by dtValidade;

-- EXIBINDO OS DADOS DA TABELA ORDENADO PELO NOME EM ORDEM DECRESCENTE
select * from Higiene order by nome desc;

-- EXIBINDO OS DADOS DA TABELA CUJOS NOMES DOS PRODUTOS COMEÇEM COM A LETRA S 
select * from Higiene where nome like 'S%';

-- EXIBINDO OS DADOS DA TABELA CUJOS OS LOTES TERMINEM COM O NÚMERO 8
select * from Higiene where lote like '%8';

-- EXIBINDO OS DADOS DA TABELA CUJA SEGUNDA LETRA DO NOME É A 
select * from Higiene where nome like '_a%';

-- EXIBINDO OS DADOS DA TABELA CUJA MARCA TENHA COMO PENULTIMA LETRA B
select * from Higiene where marca like '%b_';

-- ATUALIZANDO A DATA DE VALIDADE DE ALGUM PRODUTO 
update Higiene set dtValidade='2024-08-29' where idHigiene=4;

-- EXIBINDO NOVAMENTE OS DADOS DA TABELA PARA CONFIRMAR SE DEU CERTO O COMANDO
select * from Higiene;

-- EXCLUINDO ALGUM ITEM DA TABELA 
delete from Higiene where idHigiene='5';

-- EXIBINDO NOVAMENTE OS DADOS DA TABELA PARA CONFIRMAR SE DEU CERTO O COMANDO
select * from Higiene;

-- ACRESCENTANDO UM CAMPO NA TABELA
alter table Higiene add column Estoque int;

-- EXIBINDO NOVAMENTE OS DADOS DA TABELA PARA CONFIRMAR SE DEU CERTO O COMANDO
select * from Higiene;

-- ATUALIZANDO O ESTOQUE DOS PRODUTOS 
update Higiene set Estoque=327 where idHigiene>0;

-- EXIBINDO NOVAMENTE OS DADOS DA TABELA PARA CONFIRMAR SE DEU CERTO O COMANDO
select * from Higiene;

-- EXCLUINDO O BANCO DE DADOS 
drop database continuada1;