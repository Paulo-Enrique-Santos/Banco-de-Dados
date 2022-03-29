-- Crie um banco de dados chamado Sprint2;
create database Sprint2;

-- Use o banco de dados Sprint2;
use Sprint2;

-- CRIANDO A TABELA 
create table Atleta (
idAtleta		INT primary key auto_increment,
nome			varchar (40),
modalidade 		varchar (40),
qtdMedalha 		int
);

-- INSERINDO DADOS NA TABELA 
insert into Atleta values(null,'Pedro','Surf', 5),
						 (null,'Paulo','Skate', 3),
                         (null,'João','Atletismo',7),
                         (null,'Joana','Natação',1),
                         (null,'Carlos','Futebol',10),
                         (null,'Jonas','Surf', 55),
						 (null,'José','Skate', 32),
                         (null,'Marcia','Atletismo',27),
                         (null,'Leonardo','Natação',12 ),
                         (null,'Fabio','Futebol',15);

-- CRIANDO OUTRA TABELA CHAMADA PAIS
create table Pais (
idPais		int primary key auto_increment,
nome		varchar (30),
capital		varchar (40)
);

-- INSERINDO DADOS NA TABELA PAÍS
insert into Pais Values (null,'Brasil','Brasília'),
						(null,'França','Paris'),
                        (null,'Argentina','Buenos Aires'),
                        (null,'Russia','Moscou');

select * from Atleta;

-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table Atleta add column Nacionalidade int,
	add foreign key (Nacionalidade) references Pais (idPais);
    
select * from Atleta;

-- Atualizar o país de todos os atletas;
update Atleta set Nacionalidade = 2 where idAtleta in (1,2,4);
update Atleta set Nacionalidade = 1 where idAtleta in (2,7,9);
update Atleta set Nacionalidade = 3 where idAtleta in (3,8,10);
update Atleta set Nacionalidade = 4 where idAtleta in (5,6);

-- Exibir os atletas e seu respectivo país;
select * from Atleta join Pais on nacionalidade= idPais ;

-- Exibir apenas o nome do atleta e o nome do respectivo país;
select Atleta.nome, Pais.nome from Atleta
	join Pais on nacionalidade= idPais;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
select * from Atleta join Pais on nacionalidade = idPais 
	where capital = 'Paris';


-- CRIANDO A TABELA CHAMADA MÚSICA
create table Musica (
idMusica 			int primary key auto_increment,
titulo				varchar (40),
artista 			varchar (40),
genero				varchar (40)
);

-- INSERINDO DADOS NA TABELA 
insert into Musica values (null,'Todo Mundo Vai Sofrer', 'Marília Mendonça', 'Sertanejo' ),
						  (null,'Graveto', 'Marília Mendonça', 'Sertanejo'),
                          (null,'Máquina do Tempo', 'Matuê', 'Trap'),
                          (null,'Um Minuto Para o Fim do Mundo', 'CPM 22', 'Rock'),
                          (null,'Na Sua Estante', 'Pitty', 'Rock'),
                          (null,'Baby', 'Justin Bieber', 'POP'),
                          (null,'777-666', 'Matuê', 'Trap');

-- CRIANDO A TABELA CHAMADA ALBUM
create table Album (
idAlbum			int primary key auto_increment,
nome 			varchar (40),
tipo			varchar (7) constraint Tipinho check (tipo in ('digital', 'fisico')),
dtLancamento	date
);

describe Album;

-- INSERINDO DADOS NA TABELA ALBUM
insert into Album values (null,'Novas','digital','2022-02-27'),
						 (null,'Antigas','fisico','1999-05-11');

-- Exibir todos os dados das tabelas separadamente;
select * from Musica;
select * from Album;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table Musica add column albumMsc int,
	add foreign key (albumMsc) references Album (idAlbum);

-- Atualizar os álbuns de cada música;
select * from Musica;

update Musica set albumMsc = 1 where idMusica in (1,3,4,6);
update Musica set albumMsc = 2 where idMusica in (2,5,7);

-- Exibir as músicas e seus respectivos álbuns;
select * from Musica join Album on albumMsc = idAlbum;

-- Exibir somente o título da música e o nome do seu respectivo álbum;
select Musica.titulo, Album.nome from Musica 
	join Album on albumMsc = idAlbum;


-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
select * from Musica join Album on albumMsc= idAlbum where Album.nome = 'Novas';
