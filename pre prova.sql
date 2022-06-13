/*
1)Chave primaria é um atributo unico que torna uma entidade unico,nunca pois a chave primaria é unica ,sim
2)É usaod para deifnir o tipo de atributo que ele é, exp: varchar,int,time,double,date. Uma restrição de chave estrangeira ocorre quando
violamos algo, exp:Quando tentamos auto incrementala.
3)

6)
1-V
2-V
3-F
4-V
5-F
6-F

*/
CREATE TABLE Produtos (
    cod INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(25),
    preco DOUBLE,
    estoque INT
);
insert
into Produtos(nome,preco,estoque)
values
('Cerveja',1,150),
('Presunto',2,300),
('Queijo',3,400),
('Arroz',30,500),
('Feijão',10,250),
('Alface',1,150),
('carne',50,250),
('Caviar',500,3),
('açucar',3,1000),
('Leite',3,50),
('Chocolate',1,150),
('Sabão',5,25),
('Frango',15,280),
('Refrigerante',6,230),
('Macarrão',4,150);
select * from Produtos; 	

CREATE TABLE Fornecedores (
    cnpj INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    endereco VARCHAR(30),
    tipo ENUM('Padaria', 'Grãos', 'Farmaçia', 'Bebidas', 'Açogue')
);

insert 
into Fornecedores(nome,endereco,tipo)
values
('Carlos','Void','Bebidas'),
('João','Piaui','Grãos'),
('Elanor','Moria','Açogue'),
('Bilbo','Condado','Padaria'),
('Violet','Leidensheftlir','Farmacia');
select * from fornecedores;

CREATE TABLE Fornecimento(
    cod INTEGER ,
    cnpj INTEGER , 
    entregue DATE PRIMARY KEY,
    foreign key (cod)
    references Produtos(cod),
        foreign key (cnpj)
    references Fornecedores(cnpj)
);

insert 
into Fornecimento(cod,cnpj,entregue)
values
(1,1,'2018-10-1'),
(2,2,'2018-11-15'),
(3,3,'2018-11-22'),
(4,4,'2018-10-14'),
(5,5,'2018-9-8');
select * from fornecimento;

create table Delivery(
cod_entregador INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_moto varchar(30),
tipo enum('Express','Diurna','Noturna','FDS')
);

insert 
into Delivery(nome_moto,tipo)
values
('Honda','Express'),
('Suzuki','Diurna'),
('Fragile','Noturna'),
('Lambreta','FDS');
select * from Delivery;

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    endereco VARCHAR(50),
    desde YEAR
);

insert
into Clientes(nome,endereco,desde)
values
('Sunset','Brooklin',1901),
('Sunburst','Seatle',1980),
('Midnight','Over City',2089),
('Trimendsional Doplhin','Outra dimensão...',2155),
('Pedro','Itájuba',2015),
('Myonir','Valhala',2022);
select * from Clientes;

CREATE TABLE Caixas (
    cpf INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    nascimento YEAR,
    edenreço VARCHAR(50),
    salario DOUBLE
);

insert 
into Caixas(nome,nascimento,edenreço,salario)
values
('Maria','2003','Capitão João',10800),
('Pedro','1950','Bela Vista',1080),
('Sabrina','1926','Estados De Lado',2000),
(' Merida','2000','Cidade UgaBuga',3000),
('Amélia','1901',' Dom Viscoso',1080);
select * from Caixas;

CREATE TABLE Controle_Entrega (
    cod INTEGER,
    cpf INTEGER,
    id_cliente INTEGER,
    cod_entregador INTEGER,
    descritivo VARCHAR(100),
    FOREIGN KEY (cod)
        REFERENCES Produtos (cod),
    FOREIGN KEY (cpf)
        REFERENCES Caixas (cpf),
    FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente),
    FOREIGN KEY (cod_entregador)
        REFERENCES Delivery (cod_entregador)
);

insert
into Controle_Entrega(cod,cpf,id_cliente,cod_entregador,descritivo)
values
(1,1,1,1,'Entregue'),
(2,2,2,2,'Entregue'),
(3,3,3,3,'Não Entregue'),
(4,4,4,4,'Entregue');
select * from Controle_Entrega;

CREATE TABLE Vendidos (
    cod INTEGER,
    cpf INTEGER,
    data_venda DATE,
    FOREIGN KEY (cod)
        REFERENCES Produtos (cod),
    FOREIGN KEY (cpf)
        REFERENCES Caixas (cpf)
);

insert 
into Vendidos(cod,cpf,data_venda)
values
(4,1,'2054-2-11'),
(2,2,'2018-8-23'),
(5,3,'2104-4-24'),
(8,4,'2004-2-17'),
(2,2,'2001-1-10'),
(3,2,'1945-8-1');
select * from Vendidos;




select max(p.preco),p.preco, c.nome, p.nome
from  Caixas as c , Vendidos as v, Produtos as p
where p.cod = v.cod and c.cpf = v.cpf and c.nome = 'Sabrina';

select avg (preco) from produtos;

select min(desde), c.nome
 from clientes c;
 
 select p.nome, fr.nome
 from fornecedores fr, Fornecimento f, produtos p
where f.cod = p.cod and f.cnpj = fr.cnpj and p.nome = 'Arroz' and fr.cnpj in (select fr2.cnpj
 from fornecedores fr2, Fornecimento f2, produtos p2
 where f2.cod = p2.cod and f2.cnpj = fr2.cnpj and p2.nome = 'Feijão');
 
 select p.nome, c.nome, cx.nome, d.nome_moto
 from caixas cx, cliente c , produtos p , vendidos v, controle_entrega ce, delivery d
 where cx.cpf = v.cpf and p.cod = v.cod and d.cod_entregador = ce.cod_entregador 
 and c.id_cliente = ce.id_cliente and v.cod = ce.cod and v.cpf = ce.cpf;
 cs
















