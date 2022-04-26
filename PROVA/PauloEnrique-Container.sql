-- CRIANDO A DATABASE
create database Continuada2;

-- USANDO A DATABASE
use Continuada2;

-- CRIANDO AS TABELAS
create table cliente (
idCliente	int primary key auto_increment,
nome		varchar(45),
sobrenome	varchar(45),
cpf 		char(11) unique not null,
tipo 		varchar(10),
constraint qualtipo check (tipo in ('mensalista' , 'avulso'))
);

describe cliente;

create table clienteSecundario (
idClienteS		int primary key auto_increment,
nome_S			varchar(45),
sobrenome_S		varchar(45),
cpf_S 			char(11) unique not null,
fk_idCliente 	int,
foreign key (fk_idCliente) references cliente(idCliente)
);

describe clienteSecundario;

create table Container(
id				int primary key auto_increment,
nome 			varchar(45),
sobrenome		varchar(45),
rua 			varchar(45),
numero			varchar(6),
cidade 			varchar(45),
UF				char(2),
fk_idCliente	int,
foreign key (fk_idCliente) references cliente(idCliente)
);

describe Container;

-- INSERINDO DADOS NAS TABELAS
insert into Cliente values 
(null, 'Paulo', 'Enrique', '11122233344' , 'avulso'),
(null, 'Giovanni', 'Dos Santos', '22233344455' , 'mensalista'),
(null, 'Gustavo', 'Pereira', '33344455566' , 'avulso'),
(null, 'Carlos', 'Dos Santos', '44455566677' , 'mensalista'),
(null, 'Matheus', 'Henrique', '00066677788' , 'mensalista');

select * from cliente;

insert into ClienteSecundario values 
(null, 'Giovanna', 'Monteiro', '77766655544' , 1),
(null, 'Giovanni', 'Dos Santos', '22233344455' , 1),
(null, 'Silvia', 'Betania', '1122255566' , '4'),
(null, 'Carlos', 'Dos Santos', '99988877766' , 5),
(null, 'Marcos', 'Paulo', '23232323233' , 2);

select * from ClienteSecundario;

insert into Container values 
(null, 'Mario', 'Bros' , 'rua das oliveiras', '35', 'São Paulo', 'SP', 1),
(null, 'Zé', 'Luige' , 'rua das margaridas', '109823', 'Brasília', 'DF', 5),
(null, 'Calos', 'Bros' , 'rua das rosas', '1092', 'Copacaban', 'RJ', 2),
(null, 'Mario', 'Arruda' , 'rua dos girassois', '12345', 'Belo Horizonte', 'MG', 3),
(null, 'Arthur', 'Aguiar' , 'rua das violetas', '123', 'São Paulo', 'SP', 4);

select * from Container;

-- Exibir todos os dados das tabelas separadamente. 
select * from cliente;
select * from clienteSecundario;
select * from Container;

-- Exibir os dados dos clientes e seus respectivos containers.
select * from Cliente join container on idCliente = container.fk_idCliente;

-- Exibir apenas o nome do container e o nome dos respectivos cliente do tipo 'avulso';
select container.nome as 'Nome Container', container.sobrenome as 'Sobrenome Container', 
		cliente.nome as 'Nome Cliente', cliente.sobrenome as 'Sobrenome Cliente', cliente.tipo as 'Tipo' from Cliente 
			join Container on idCliente = container.fk_idCliente where cliente.tipo = 'avulso';

-- Exibir os dados dos clientes secundários e seu respectivo cliente primário;
select * from Cliente join clienteSecundario on idCliente = clienteSecundario.fk_idCliente;

-- Exibir apenas o nome e o cpf de um determinado cliente que contém no cpf um determinado número;
select cliente.nome, cliente.cpf from cliente where cpf like '%2%';

-- Atualize o tipo de algum cliente. Exiba novamente os dados da tabela após a atualização. 
update cliente set tipo = 'avulso' where idCliente = 5;
select * from cliente;

-- Exclua algum cliente da tabela. Exiba novamente os dados da tabela após a exclusão. 
delete from Container where id = 2;
delete from clienteSecundario where idClienteS = 4;
select * from cliente;
delete from cliente where idCliente = 5;


-- Exibir os dados dos clientes, seu respectivo cliente primário e containers. Pode escolher os campos e apelidá-los caso seja necessário. 
Select * from Cliente join container on idCliente = fk_idCliente;

Select * from Cliente join container on idCliente = Container.fk_idCliente 
		join clienteSecundario on idcliente = clienteSecundario.fk_idCliente;
        
Select * from Cliente left join container on idCliente = fk_idCliente;        

Select * from Cliente right join container on idCliente = fk_idCliente;        

-- OBS: NÃO ENTENDI MUITO BEM ESSE ULTIMO SELECT DA QUESTÃO 5 ENTÃO EU ACABEI FAZENDO DIVERSOS JOINS COM O QUE APRENDEMOS EM AULA.

-- Efetue o comando para excluir o banco de dados do MySQL Server (Schema). 
drop database Continuada2;

