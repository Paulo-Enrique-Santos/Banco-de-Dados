use func1adsa;

-- CRIANDO A TABELA CLIENTE
CREATE TABLE Cliente (
idCliente 		int primary key auto_increment,
Nome			varchar (45),
Sobrenome		varchar (45),
TelFixo			char (10),
TelCel			char (11),
NomeRua			varchar (45),
Bairro			varchar (45),
Numero			varchar(6),
Estado			varchar (45)
);

-- INSERINDO DADOS 
insert into Cliente values 
(null, 'João','Santos',  1123230505 , 11983729091, 'Avenida Brasil', 'Jardim Brasil', 1230 , 'São Paulo'),
(null, 'Carlos','Silva', 1184739482 , 11984736472, 'Rua da Sorte', 'Tiradentes', 340 , 'São Paulo'),
(null, 'Marcia','Santos', 1173595729 , 11938274625, 'Rua Padre Olivetanos', 'Penha', 123, 'São Paulo'),
(null, 'José','Pereira', 1184938573 , 11918463729, 'Avenida Rio das Pedras', 'Aricanduva', 12098 , 'São Paulo');

select * from Cliente;

-- CRIANDO A TABELA PET
create table Pet (
idPet 			int primary key auto_increment,
Tipo 			varchar (45),
NomeAnimal		varchar (45),
Raca			varchar (45),
DtNasc			date,
fkCliente		int,
foreign key (fkCliente) references Cliente (idCliente)
)auto_increment 101;

insert into Pet values 
(null,'Gato','Max','Viralata','2019-03-30', 2),
(null,'Cachorro','Betovem','São Bernardo','2015-07-12', 2),
(null,'Gato','Babi','Garfield','2012-10-23', 3),
(null,'Coelho','Luccy','Bith','2020-05-08', 1);

-- Exibir todos os dados de cada tabela criada, separadamente.
Select * from Pet;
select * from Cliente;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.

-- Altere o tamanho da coluna nome do cliente.
alter table Cliente modify column nome varchar (50);
describe Cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from Pet where tipo = 'Gato';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nomeanimal, DtNasc from Pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from Pet order by nomeanimal;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nomeanimal like 'L%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from Cliente where sobrenome = 'Santos';

-- Alterar o telefone de um determinado cliente.
update cliente set telcel = 11983749283 where idcliente = 1;

-- Exibir os dados dos clientes para verificar se alterou.
select * from Cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from Pet join Cliente on  fkcliente=idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from Pet join Cliente on  fkcliente=idCliente where idcliente = 1;

-- Excluir algum pet.
delete from pet where idPet = 101;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
drop table pet;
drop table cliente;



-- EXERCÍCIO 2 ###################################################################################################

-- CRIANDO A TABELA 
create table Pessoa(
idPessoa 		int primary key auto_increment,
nome 			varchar (45),
dtnasc			date,
profissao		varchar(45));

create table Gasto (
idGasto			int primary key auto_increment,
dt				date,
valor			decimal(10,2),
descricao		varchar(45),
fkpessoa		int,
foreign key (fkpessoa) references pessoa (idPessoa));

-- Insira dados nas tabelas.
insert into Pessoa values 
(null, 'Paulo', '1999-03-08', 'Estudante'),
(null, 'Claudio', '1979-03-14', 'Autônomo'),
(null, 'Elisa', '1976-07-03', 'Empresária');

insert into Gasto values 
(null, '2022-03-31', 299.99 , 'Conta Agua', 1),
(null, '2022-03-22', 345.99 , 'Conta Luz', 2),
(null, '2022-03-12', 1982.99 , 'Aluguel', 1),
(null, '2022-03-02', 978.99 , 'Financiamento', 3);

-- Exiba os dados de cada tabela individualmente.
select * from Pessoa;
select * from Gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from gasto where valor >= 400; 
select * from Pessoa where profissao = 'Estudante';

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from Pessoa join gasto on idpessoa = fkpessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa join gasto on idpessoa = fkpessoa where idpessoa = 1;

-- Atualize valores já inseridos na tabela.
update pessoa set profissao = 'Estagiario' where idpessoa =1 ;

-- Exclua um ou mais registros de alguma tabela.
delete from gasto where idgasto =4;

-- EXERCÍCIO 3 ###################################################################################################

-- Criar um banco de dados chamado PraticaFuncionario.
create database PraticaFuncionario;

-- Selecionar esse banco de dados.
use PraticaFuncionario;

-- Criar as tabelas correspondentes à sua modelagem.
create table Setor (
idSetor		int primary key auto_increment,
nomeSetor	varchar (45),
Andar		varchar(3));

create table Funcionario (
idFuncionario		int primary key auto_increment,
nomeFunc			varchar (45),
Telefone			varchar (11),
salario 			decimal (10,2),
fkSetor				int,
foreign key (fkSetor) references Setor (idSetor),
check (salario > 0));

create table Acompanhante (
idAcompanhante 		int auto_increment,
nomeAcomp			varchar (45),
parentesco			varchar (45),
dtNasc				date,
fkFunc				int,
primary key (idAcompanhante,fkFunc),
foreign key (fkFunc) references Funcionario (idFuncionario));

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into Setor values 
(null,'Consultoria',11),
(null,'Professores',10),
(null,'Manutenção',7);

insert into Funcionario values 
(null, 'João', '11222222888', 2999.21,1),
(null, 'Maria', '12987625389', 1998.30,1),
(null, 'Carlos', '36829993029', 3504.12,2),
(null, 'Vitoria', '17828382930', 3920.43,2),
(null, 'Paulo', '13948372839', 1603.23,3),
(null, 'Giovanna', '10293827322', 1230.40,3);

insert into Acompanhante values 
(null, 'Lorena', 'Filho', '1999-02-02',5),
(null, 'Enzo', 'Filho', '2021-05-12',6),
(null, 'Vinicius', 'Marido', '1987-12-22',2),
(null, 'Carolina', 'Esposa', '1978-10-16',1),
(null, 'Josefa', 'Mãe', '1953-05-31',3),
(null, 'João', 'Pai', '1950-06-21',3);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from Acompanhante;
select * from Setor;
select * from Funcionario;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.

-- Exibir os dados dos setores e dos seus respectivos funcionários.
select * from Setor join Funcionario on idSetor = fkSetor;

-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select * from Setor join Funcionario on idSetor = fkSetor where Setor.nomeSetor = 'Professores';

-- Exibir os dados dos funcionários e de seus acompanhantes.
select * from Funcionario join Acompanhante on idFuncionario = fkFunc;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from Funcionario join Acompanhante on idFuncionario = fkFunc where nomeFunc = 'Carlos';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from Setor 
	join Funcionario on idSetor = fkSetor
		join Acompanhante on idFuncionario = fkFunc;

-- EXERCÍCIO 4 ###################################################################################################

-- Criar um banco de dados chamado Treinador.
create database Treinador;

-- Selecionar esse banco de dados.
use Treinador;

-- Criar as tabelas correspondentes à sua modelagem.
create table Treinador (
idTreinador		int primary key auto_increment,
nomeTreinador	varchar (45),
telefone		varchar (11),
email			varchar (45),
fkTreinador 	int,
foreign key 	(fkTreinador) references Treinador (idTreinador)
)auto_increment = 10;

create table Nadador (
idNadador 	int primary key auto_increment,
nomeNadador varchar (45),
uf			char(2),
dtNasc		date,
fkTreinador int,
foreign key (fkTreinador) references Treinador (idTreinador)
)auto_increment = 100;

-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.
insert into Treinador Values 
(null, 'Calos', '11202938293','Carlos@treinador.com', null),
(null, 'Jonas', '47837283728','Jonas@treinador.com', 10),
(null, 'João', '29839283748','Joao@treinador.com', 10),
(null, 'Maria', '20938472948','Maria@treinador.com', null);

insert into Nadador values 
(null,'Carlos','SP','2002-02-09', 11),
(null,'Marcia','RS','2000-07-29', 13),
(null,'Vinicius','RJ','1998-09-12', 10),
(null,'Aline','MG','1999-05-16', 10);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from Nadador;
select * from Treinador;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select * from Treinador join Nadador on idTreinador = Nadador.fkTreinador;

-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
update Treinador set nomeTreinador = 'Carlos' where idTreinador = 10;

select * from Treinador join Nadador on idTreinador = Nadador.fkTreinador where nomeTreinador = 'Carlos';

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select * from Treinador as Orientadores join Treinador on Orientadores.fkTreinador = Treinador.idTreinador;

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).
select * from Treinador as Orientadores join Treinador on Orientadores.fkTreinador = Treinador.idTreinador where Orientadores.nomeTreinador = 'João';

-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select * from Treinador join Nadador on idTreinador = Nadador.fkTreinador join Treinador as Orientadores on Treinador.idTreinador = Orientadores.fkTreinador;

-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.
select * from Treinador join Nadador on idTreinador = Nadador.fkTreinador join Treinador as Orientadores on Treinador.idTreinador = Orientadores.fkTreinador where Orientadores.nomeTreinador = 'Jonas';
