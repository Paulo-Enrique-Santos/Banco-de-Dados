-- CRIANDO O BANCO DE DADOS
create database sprint1;

-- USANDO O BANCO DE DADOS 
use sprint1;

-- CRIANDO A TABELA
create table Atleta(
idAtleta		int primary key,
nome 			varchar(40),
modalidade 		varchar(40),
qtdMedalha		int
);

-- INSERINDO DADOS NA TABELA 
insert into Atleta values(1,'Pedro','Surf', 5),
						 (2,'Paulo','Skate', 3),
                         (3,'João','Atletistmo',7),
                         (4,'Joana','Natação',1 ),
                         (5,'Carlos','Futebol',10);

-- MOSTRANDO OS DADOS DA TABELA 
select * from Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1
update Atleta set qtdMedalha = 3 where idAtleta=1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3
update Atleta set qtdMedalha = 4 where idAtleta in (2,3);
select * from Atleta;

-- Atualizar o nome do atleta com o id=4
update Atleta set nome = 'Francisco' where idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date
alter table Atleta add column dtNasc date;
describe Atleta;

-- Atualizar a data de nascimento de todos os atletas
update Atleta set dtNasc = '1999-03-08' where idAtleta >0;
select * from Atleta;

-- Excluir o atleta com o id=5
delete from Atleta where idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação
select * from Atleta where modalidade != 'Natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3
select * from Atleta where qtdMedalha >=3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60
alter table Atleta modify column modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade
desc Atleta;

-- Limpar os dados da tabela
truncate Atleta;
select * From Atleta;

-- EXERCÍCIO 2 

create table Musica (
idMusica 	int primary key,
titulo		varchar(40),
artista 	varchar(40),
genero		varchar(40) 
);

-- INSERINDO DADOS NA TABELA
insert into Musica values ('1', 'Todo Mundo Vai Sofrer', 'Marília Mendonça', 'Sertanejo' ),
						  ('2', 'Graveto', 'Marília Mendonça', 'Sertanejo'),
                          ('3', 'Máquina do Tempo', 'Matuê', 'Trap'),
                          ('4', 'Um Minuto Para o Fim do Mundo', 'CPM 22', 'Rock'),
                          ('5', 'Na Sua Estante', 'Pitty', 'Rock'),
                          ('6', 'Baby', 'Justin Bieber', 'POP'),
                          ('7', '777-666', 'Matuê', 'Trap');

-- Exibir todos os dados da tabela.
select * from Musica;

-- Adicionar o campo curtidas do tipo int na tabela;
alter table Musica add column curtidas int;
desc Musica;

-- Atualizar o campo curtidas de todas as músicas inseridas;
update Musica set curtidas=450 where idMusica>0;
select * from Musica;

-- Modificar o campo artista do tamanho 40 para o tamanho 80
alter table Musica modify column artista varchar(80);
desc Musica;

-- Atualizar a quantidade de curtidas da música com id=1;
update Musica set curtidas = 708 where idMusica=1;
select * from Musica;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update Musica set curtidas = 950 where idMusica in (2,3);
select * from Musica;

-- Atualizar o nome da música com o id=5;
update Musica set titulo = 'Teto de Vidro' where idMusica =5;

-- Excluir a música com o id=4;
delete from Musica where idMusica= 4;
select * from Musica;

-- Exibir as músicas onde o gênero é diferente de funk;
select * from Musica where genero != 'Funk' ;

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica where curtidas>=20;

-- Descrever os campos da tabela mostrando a atualização do campo artista;
desc Musica;

-- Limpar os dados da tabela; 
truncate Musica;

-- EXERCÍCIO 3

-- CRIANDO A TABELA FILME
create table Filme(
idFilme 		int primary key,
titulo			varchar(50),
genero 			varchar(40),
diretor			varchar(40)
);

-- INSERINDO DADOS NA TABELA
insert into Filme Values ('1','Procurando Nemo','Animação','Pixar'),
						 ('2','Monstros SA','Animação','Pixar'),
                         ('3','Vingadores','Ação','Marvel'),
                         ('4','Ted','Comédia','Universal'),
                         ('5','Crepúsculo','Romance','Paris Filmes'),
                         ('6','Birdbox','Suspense','Netflix'),
                         ('7','It a Coisa','Terror','Warner Bros.');

-- Exibir todos os dados da tabela.
select * from Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table Filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update Filme set protagonista= 'Nemo' where idFilme =1 ;
select * from Filme where idFilme =1 ;

update Filme set protagonista= 'Todos' where idFilme>1;
select * from Filme;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table Filme modify column diretor varchar (150);
desc Filme;

-- Atualizar o diretor do filme com id=5;
update Filme set diretor = 'Universal Movie' where idFilme = 5;
select * from Filme;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update Filme set diretor='Disney' where idFilme in (2,7);

-- Atualizar o título do filme com o id=6;
update Filme set titulo= 'Truque de Mestre' where idFilme= 6;
select * from Filme;

-- Excluir o filme com o id=3;
delete from Filme where idFilme=3;
select * from Filme;

-- Exibir os filmes em que o gênero é diferente de drama;
select * from Filme where genero !='Drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select * from Filme where genero = 'Suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
desc Filme;

-- Limpar os dados da tabela;
truncate Filme;



-- EXERCÍCIO 4 

-- CRIANDO A TABELA 
create table Professor (
idProfessor 	int primary key,
nome 			varchar(50),
especialidade 	varchar(40),
dtNasc			date
);

-- INSERINDO DADOS NA TABELA 
insert into Professor values('1','Vivian Silva','Banco de Dados','1995-10-13'),
						     ('2','Roberto','Biologia','1970-07-03'),
							 ('3','Michele','História','1983-02-18'),
							 ('4','Elisa','TI','1976-07-03'),
							 ('5','Claudio','Inglês','1979-03-14'),
							 ('6','Matheus','Português','1975-12-25');

-- Exibir todos os dados da tabela.
select * from Professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,‘assistente’ ou ‘titular’;
alter table Professor add column função varchar(50),
	add check ( função in ('Monitor','Assistente','Titular'));
desc Professor;

-- Atualizar os professores inseridos e suas respectivas funções;
update Professor set função='Titular' where idProfessor=1;
update Professor set função='Assistente' where idProfessor=2;
update Professor set função='Monitor' where idProfessor>2;
select * from Professor;

-- Inserir um novo professor;
insert into Professor value(7,'Joana','Matemárica','1999-08-03','Titular');

-- Excluir o professor onde o idProfessor é igual a 5;
delete from Professor where idProfessor= 5;

-- Exibir apenas os nomes dos professores titulares;
select nome from Professor where função='Titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade,dtNasc from Professor where função='Monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3;
update Professor set dtNasc='1974-08-06' where idProfessor=3;
select * from Professor;

-- Limpar a tabela Professor;
truncate Professor;



-- EXERCICIO 5

-- CRIANDO A TABELA 
create table Curso (
idCurso int primary key,
nome 	varchar(50),
sigla	char(3),
coordenador varchar(50));

-- INSERINDO DADOS NA TABELA
insert into Curso values ('1','Sistemas de Informaçao', 'SIS', 'João'),
						('2','Ciência da Computação', 'CCO', 'Claudia'),
                        ('3','Análise e Desenvolvimento de Sistemas','ADS','Gerson');

-- Exibir todos os dados da tabela.
select * from Curso;


-- Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'SIS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from Curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'C%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%S';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra. (I)
select * from Curso where nome like '_I%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso where nome like '%A_';

-- Elimine a tabela.
drop table Curso;




-- EXERCÍCIO 6 

-- CRIANDO A TABELA
create table Revista (
idRevista 	int primary key auto_increment,
nome	 	varchar (40),
categoria	varchar (30)
) auto_increment=1;

-- Inserir 4 registros na tabela, mas sem informar a categoria.
insert into Revista(nome) values('Veja'),
								('Recreio'),
								('Capricho');

-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria= 'Entretenimento' where idRevista>0;

-- Insira mais 3 registros completos.
insert into Revista (nome, categoria) values ('SPTechNews','Escolar'),
											 ('Caras','Entretenimento'),
                                             ('Forbes','Negócios');

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop column periodicidade;
