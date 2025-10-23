use loja;
create table produtos(
 id int auto_increment primary key,
 nome varchar (100),
 preco decimal (10.2),
 estoque varchar (100)
 
 );
 
 select * from produtos;
 
 insert into produtos ( nome, preco, estoque) values
 ('Notebook',500.00, 10),
 ( 'Mouse',89.90, 50),
 ('Teclado', 250.00, 30),
 ('Monitor',899.00, 15);
 
 select * from produtos;
 
 -- Atualizar um campo no registro 
 update produtos set estoque = 12 where id = 4; 
 
-- deleta um registro
delete from produtos where id = 3;

-- Funçoes de agregacao
select sum(estoque) from produtos;

-- MIN 
select min(preco) from produtos;

-- MAX
select max(preco) from produtos;

-- Apagar a tabela (produtos)
drop table produtos;

-- Apaga o banco de dados inteiro (loja)
drop database loja;


 