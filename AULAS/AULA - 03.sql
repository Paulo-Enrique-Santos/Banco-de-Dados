use aula01;

create table produto (
id int primary key auto_increment,
nome varchar(100),
marca varchar(50) not null,
dtValidade datetime default current_timestamp,
perecivel char(3), constraint chkpere check (perecivel = 'sim' or perecivel = 'nao')
);

describe produto;

insert into produto (nome,marca, perecivel) values
	('arroz', 'camil','sim');
    
alter table produto Drop check chkpere;

select * from produto;

alter table produto add constraint chkpere check 
	(perecivel in ('sim', 'nao', 'tlz'));
    
insert into produto (nome,marca, perecivel) values
	('feijão', 'tio joão','sim'),
    ('milho', 'yoki','sim'),
    ('agua', 'cristal','nao'),
    ('papelzão', 'neve','nao');

select * from produto;

select marca,dtValidade from produto;


-- SELECIONAR ENTRE UNS DADO
select * from produto where id between 3 and 4;