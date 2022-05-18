CREATE database Pratica7;

use Pratica7;


create table Cliente (
idCliente int auto_increment primary key,
nome varchar(45),
sobrenome varchar (45),
email varchar (45),
rua 	varchar (45),
bairro	varchar (45),
estado	varchar(45),
fkIndicado	int,
foreign key (fkIndicado) references Cliente (idCliente)
);

create table Venda (
idVenda int auto_increment,
fkCliente	int not null,
foreign key (fkCliente) references Cliente (idCliente),
primary key (idVenda,fkCliente),
dtVenda date,
total	decimal(10,2) not null
);

create table Produto (
idProduto int auto_increment Primary Key,
nomeProduto	varchar(45),
descricao	varchar(45),
preco		decimal(10,2)
);

create table TotalVenda (
idTotal	int auto_increment,
fkProduto int,
foreign key (fkProduto) references Produto (idProduto),
fkVenda	int,
foreign key (fkVenda) references Venda (idVenda),
fkVendaCliente int,
foreign key (fkVendaCliente) references Venda (fkCliente),
primary key (idTotal,fkProduto,fkVenda,fkVendaCliente),
qtdProduto varchar(45),
desconto 	decimal(10,2)
);

insert into Cliente Values
(NULL,'Paulo','Enrique','paulo@paulo.com','rua das oliveiras', 'jardim das rosas', 'São Paulo',NULL),
(NULL,'Giovanni','Gustavo','gio@gio.com','rua das rosas', 'jardim das flores', 'São Paulo',1),
(NULL,'Leonardo','Dos Santos','leonardo@leonardo.com','rua das flores', 'jardim das orquideas', 'São Paulo',2),
(NULL,'Carla','Silva','carla@carla.com','rua das joaquinas', 'jardim pedroso', 'Bahia',1),
(NULL,'Gustavo','Lima','Paulo@paulo.com','rua junina', 'jardim são joão', 'Minas Gerais',2);

insert into Produto values 
(null,'NoteBook','Notebook DELL core i8',2100.00),
(null,'Mouse','Mouse Pro 180DPI',150.00),
(null,'MacBook Pro','MacBook Pro 4 Geração',40000.00),
(null,'Impressora','Impressora Epson Multicolor',500.00);

select * from Cliente;
select * from venda;

insert into Venda values
(null,1,'2022-01-20','35000.00'),
(null,5,'2022-01-20','4000.00'),
(null,3,'2022-01-20','400.00'),
(null,2,'2022-01-20','900.00'),
(null,1,'2022-01-20','300000.00'),
(null,4,'2022-01-20','300.00');

insert into TotalVenda values
(null,3,1,1,1,5000),
(null,1,2,5,2,200),
(null,2,3,3,3,50),
(null,4,4,2,2,100),
(null,3,5,1,10,100000),
(null,2,6,4,2,0);

select * from TotalVenda;

-- Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from Cliente join Venda on idCliente = fkCliente;

-- Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select * from Cliente join Venda on idCliente = fkCliente where nome = 'Paulo';

-- Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from Cliente as Indicados join Cliente on Indicados.idCliente = Cliente.fkIndicado;

-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador 
-- (informar o nome do cliente que indicou na consulta).
select * from Cliente as Indicado join Cliente on Indicado.fkIndicado = Cliente.idCliente where Cliente.nome = 'Paulo';

-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select * from Cliente join Venda on idCliente = fkCliente
	join TotalVenda on idCliente = fkVendaCliente
		join Produto on fkProduto = idProduto
			join Cliente as Indicado on Cliente.idCliente = Indicado.fkIndicado;

-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select Venda.dtVenda, produto.nomeProduto, TotalVenda.qtdProduto from Cliente
	join Venda on idCliente = fkCliente    
		join TotalVenda on Venda.idVenda = TotalVenda.fkVenda 	
			join Produto on TotalVenda.fkProduto = Produto.idProduto
				where idVenda = 5;

-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
-- AINDA NÃO APREDEMOS FAZER FUNÇÕES MATEMÁTICAS

-- Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
insert into Cliente values
(null,'Victoria','Louzano','victoria@victoria.com','rua das roseiras','vila rosa','Acre',null);

select * from Cliente left join Venda on idCliente = fkCliente;

-- FUNÇÕES MATEMÁTICAS
SELECT preco from produto;
select sum(preco) as 'Soma dos Preços' from produto;

-- média
select avg(preco) from produto;

-- arredondar e truncar
select round(avg(preco),2) from produto;
select truncate(avg(preco),2) from produto;

-- preço minimo e maximo
select min(preco) from produto;
select max(preco) from produto;
select max(preco), min(preco) from produto;

-- contando quantas linhas tem registros, ou seja não são null
select count(fkIndicado) from cliente;
select count(idcliente) from cliente;

-- diferentes (ou seja se tiver 2 campos iguais ele exibe apenas 1)
select distinct genero from produto;

-- agrupar
	select nome, sum(total) from Venda join Cliente
		on idCliente = fkCliente group by nome order by nome;	
        
	select distinct dtVenda from Venda join Cliente
		on idCliente = fkCliente where nome like 'G%' group by nome order by nome;
        
-- subquery
select sum(total) from Venda;
select truncate(avg(total),2) as 'Média das Vendas' from Venda;
select total from venda;

select sum(total) from venda where total > (select truncate(avg(total),2) as 'Média das Vendas' from Venda);

select nome,total from venda join cliente on fkcliente =idcliente where total > (select truncate(avg(total),2) as 'Média das Vendas' from Venda);

select count(total) from venda join cliente on fkcliente =idcliente where total > (select truncate(avg(total),2) as 'Média das Vendas' from Venda);


