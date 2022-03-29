-- CRIANDO O BANCO DE DADOS
create database sprint1;

-- UTILIZANDO O BANCO DE DADOS
use sprint1;

-- CRIANDO A TABELA ATLETA
create table Atleta(
idAtleta 	int primary key,
nome 		varchar(40),
modalidade 	varchar (40),
qtdMedalha 	int 
);

-- INSERINDO DADOS NA TABELA ATLETA 
insert into Atleta Values('1','Arnaldo','Surf','4'),
						 ('2','José','Natação','17'),
                         ('3','Carla','Atletismo','6'),
                         ('4','Pedro','Skate','1');
                   
-- Exibir todos os dados da tabela.                   
select * from Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
select * from Atleta where modalidade ='Surf';

-- Exibir os dados da tabela ordenados pela modalidade.
select * from Atleta order by modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from Atleta order by qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from Atleta where nome like '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from Atleta where nome like 'A%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from Atleta where nome like '%0';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r
select * from Atleta where nome like '&r_';

-- Eliminar a tabela.
drop table Atleta;
						
                        
-- CRIANDO A TABELA MUSICA  
create table Musica (
idMusica 	int primary key,
titulo 		char(40),
artista		char(40),
genero		char(40));

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

-- Exibir apenas os títulos e os artistas das músicas
select titulo, artista from Musica;         

-- Exibir apenas os dados das músicas de um determinado gênero
select * from Musica where genero ='Sertanejo';

-- Exibir apenas os dados das músicas de um determinado artista.
select * from Musica where artista = 'Matuê';

-- Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
select * from Musica order by Artista desc;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from Musica where titulo like 'N%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from Musica where titulo like '%6';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from Musica where titulo like '_M%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from Musica where titulo like '%t_';

-- Elimine a tabela.
drop table Musica;


-- CRIANDO A TABELA 
create table Filme (
idFilme 		int primary key,
titulo 			varchar(50),
genero 			varchar(40),
diretor			varchar(40));

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

-- Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
select * from Filme where genero = 'Animação';

-- Exibir apenas os dados dos filmes de um determinado diretor.
select * from Filme where diretor = 'Marvel';

-- Exibir os dados da tabela ordenados pelo título do filme.
select * from Filme order by titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from Filme order by diretor desc;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from Filme where titulo like 'B%';

-- Exibir os dados da tabela, dos filmes cujo artista termine com uma determinada letra. (Não tinha artista na tabela então selecionei diretor)
select * from Filme where diretor like '%r';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from Filme where genero like '_o%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from Filme where titulo like '%e_';

-- Elimine a tabela.
drop table Filme;

-- CRIANDO A TABELA 
create table Professor (
idProfessor 	int primary key,
nome 			varchar(50),
especialidade   varchar(40),
dtNasc			date);

insert into Professor values ('1','Vivian Silva','Banco de Dados','1995-10-13'),
						     ('2','Roberto','Biologia','1970-07-03'),
							 ('3','Michele','História','1983-02-18'),
							 ('4','Elisa','TI','1976-07-03'),
							 ('5','Claudio','Inglês','1979-03-14'),
							 ('6','Matheus','Português','1975-12-25');

-- Exibir todos os dados da tabela.
select * from Professor;

-- Exibir apenas as especialidades dos professores.
select especialidade from Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
select * from Professor where especialidade = 'Banco de Dados';

-- Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dtNasc desc;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from Professor where nome like 'M%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor where nome like '%A';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor where nome like '_i%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor where nome like '%u_';

-- Elimine a tabela.
drop table Professor;

-- CRIANDO A TABELA 
create table Curso (
idCurso 		int primary key,
nome 			varchar (50),
sigla			char	(3),
cordenador		varchar (50));

-- INSERINDO DADOS NA TABELA 
insert into Curso values('1','Sistemas de Informaçao', 'SIS', 'João'),
						('2','Ciência da Computação', 'CCO', 'Claudia'),
                        ('3','Análise e Desenvolvimento de Sistemas','ADS','Gerson');

-- Exibir todos os dados da tabela.
select * from Curso;

-- Exibir apenas os coordenadores dos cursos.
select cordenador from Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'SIS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from Curso order by cordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'C%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%s';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso where nome like '_i%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso where nome like '%A_';

-- Elimine a tabela.
drop table Curso;

-- CRIANDO A TABELA 
create table Revista (
idRevista 		int primary key auto_increment,
nome 			varchar(40),
categoria		varchar(30)
) auto_increment=1;

-- INSERINDO DADOS NA TABELA 
insert into Revista values (null,'Veja',null),
						   (null,'Recreio',null),
                           (null,'Capricho',null),
                           (null,'Caras',null);

-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. 
update Revista set categoria = 'Notícia' where idRevista = '1'; 
update Revista set categoria = 'Infantil' where idRevista = '2';
update Revista set categoria = 'Teen' where idRevista = '3';
-- Exibir os dados da tabela novamente para verificar se atualizou corretamente.
select * from Revista;

-- Insira mais 3 registros completos.
insert into Revista values (null, 'Forbes','Finanças'),
						   (null, 'Contigo','Entretenimento'),
                           (null, 'Istoé','Negócios');
                           
-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
describe Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop periodicidade;



                          