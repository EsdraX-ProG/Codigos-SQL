-- criar um database biblioteca
-- criar a tabela autores 
-- id
-- nome 
-- nacionalidade

-- criar a tabela livros 
-- id 
-- titulo
-- ano_publicado

-- criar a tabela emprestimo
-- id 
-- nome_usuario 
-- data_emprestimo
-- data_devolucao

create database biblioteca;

use biblioteca;

create table autores( 
id int auto_increment primary key,
nome varchar (100),
nacionalidade varchar (100)
 );
 
 create table livros(
 id int auto_increment primary key,
 nome varchar (100),
 titulo varchar (100),
 ano_publicado int,
 autor_id int not null,
 foreign key (autor_id) references autores(id)
 );
 
 create table emprestimos(
 id int auto_increment primary key,
 nome_usuario varchar(100),
 data_emprestimo date,
 data_devolucao date,
 livro_id int not null,
 foreign key (livro_id) references livros(id)
 
 );
 
insert into autores (nome, nacionalidade)
values ('Machado de assis' ,  'Brasileiro'),
('clarice lispector', 'Brasileiro'),
('Jorge amado', 'Brasileiro');

select * from autores;

insert into livros(titulo, ano_publicado, autor_id)
values('Dom casmurro', 1899, 1),
('A hora da estrela', 1977, 2),
('Cpaitães da Areia', 1937, 3),
('Memorias póstumas de brás cubas',1881, 1);

select * from livros;

insert into emprestimos(livro_id, nome_usuario, data_emprestimo, data_devolucao)
values(1,'Kaio','2025-10-01', '2025-10-10'),
(2, 'Tamires', '2025-10-07', null),
(3,'Rodrigo', '2025-10-20',null);

-- (drop table emprestimos) para refazer a tabela
-- lista todos os livros com o nome do autor


select e.nome_Usuario , e.data_emprestimo, a.nome from emprestimos as e
inner join livros as l on e.livro_id = l.id
inner join autores as a on l.autor_id = a.id
where data_devolucao is null
 
 