create database loja;

use loja;

create table clientes(
    id int auto_increment primary key,
    nome varchar(100),
    telefone varchar (15),
    email varchar (100),
    ativo boolean
);
-- inserir dados na tabela
insert INTO clientes(nome, email, telefone, ativo)
values ('João Silva' , 'joao@gmail.com' , '11912345670', true);

-- consultar dados
select * from clientes;

select nome, email from clientes;

insert into clientes ( nome, telefone, email, ativo)
values ('Maria', '11223343434', 'maria@gamil.com', true),
('Rodrigo','11123456789', 'rodrigo@gmail.com', false),
('Rafael', '115678900', 'rafael@gmail.com', true);


select * from clientes where id = 1;
select * from clientes where ativo = false;

-- diferente 
select * from clientes where id != 1;
select * from clientes where id <> 1;

-- maior que 
select * from clientes where id > 1;

-- menor que 
select * from clientes where id < 1;

-- maior oou igual a que 
select * from clientes where id >= 1;

-- menor ou igual a que 
select * from clientes where id <= 1;

