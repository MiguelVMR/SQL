create database supermercado;

use supermercado;
-- ----------------------------------------------------------------------------------------------------------------DDL Criando as Tabelas
CREATE TABLE Produtos (
    cod INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(25),
    preco REAL,
    estoque INTEGER,
    PRIMARY KEY (cod)
);


CREATE TABLE Fornecedores (
    cnpj INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    endereco VARCHAR(30),
    tipo ENUM('Padaria', 'Grãos', 'Guloseimas', 'Bebidas', 'Açougue'),
    PRIMARY KEY (cnpj)
);


CREATE TABLE Fornecimento (
    cod INTEGER,
    cnpj INTEGER,
    entregue DATE,
    PRIMARY KEY (cod , cnpj , entregue),
    FOREIGN KEY (cod)
        REFERENCES Produtos (cod),
    FOREIGN KEY (cnpj)
        REFERENCES Fornecedores (cnpj)
);


CREATE TABLE Caixas (
    cpf INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    nascimento YEAR,
    endereco VARCHAR(50),
    salario REAL,
    PRIMARY KEY (cpf)
);

CREATE TABLE Vendidos (
    cod INTEGER,
    cpf INTEGER,
    data_venda DATE,
    PRIMARY KEY (cod , cpf),
    FOREIGN KEY (cod)
        REFERENCES Produtos (cod),
    FOREIGN KEY (cpf)
        REFERENCES Caixas (cpf)
);

CREATE TABLE Delivery (
    cod_entregador INTEGER AUTO_INCREMENT,
    nome_moto VARCHAR(30),
    tipo ENUM('Expres', 'Diurna', 'Noturna', 'FDS'),
    PRIMARY KEY (cod_entregador)
);

CREATE TABLE Clientes (
    id_cli INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    endereco VARCHAR(50),
    desde YEAR,
    PRIMARY KEY (id_cli)
);

CREATE TABLE Controle_Entrega (
    cod INTEGER,
    cpf INTEGER,
    id_cli INTEGER,
    cod_entregador INTEGER,
    descritivo VARCHAR(100),
    PRIMARY KEY (cod , cpf , id_cli , cod_entregador),
    FOREIGN KEY (cod , cpf)
        REFERENCES Vendidos (cod , cpf),
    FOREIGN KEY (id_cli)
        REFERENCES Clientes (id_cli),
    FOREIGN KEY (cod_entregador)
        REFERENCES Delivery (cod_entregador)
);

-- --------------------------------------------------------------------------------------------------------------------DML Populando o Banco

insert 
into Produtos (nome, preco, estoque)
values
('Açucar', 1, 150),
('Presunto', 2, 300),
('Queijo', 3, 400),
('Arroz', 30, 500),
('Feijão', 10, 250),
('Alface', 1, 150),
('Carne', 50, 250),
('Caviar', 500, 3),
('Cerveja', 3, 1000),
('Leite', 3, 50),
('Chocolate', 1, 150),
('Sabão', 5, 25),
('Frango', 15, 280),
('Refrigerante', 6, 230),
('Macarrão', 4, 150);

select *from Produtos;

insert
into Fornecedores (nome, endereco, tipo)
values
('Carreteiro SA', 'Rua do Arroz doce', 'Grãos'),
('Clicletinho é quase amor', 'Rua Halls', 'Guloseimas'),
('Sidra & Conhaque', 'Rua Colarinho', 'Bebidas'),
('Fazendinha do Cesão', 'Rua Caraguatatuba', 'Açougue');

select *from Fornecedores;

insert
into Fornecimento (cod, cnpj, entregue)
values
(2, 1, '2021-02-15'),
(3, 1, '2021-01-16'),
(4, 1, '2021-01-15'),
(5, 1, '2021-03-17'),
(6, 4, '2021-01-15'),
(7, 4, '2021-01-15'),
(8, 4, '2021-02-23'),
(9, 4, '2016-02-01'),
(10, 2, '2018-02-03'),
(11, 2, '2019-02-04'),
(12, 2, '2020-12-18'),
(13, 3, '2020-10-15'),
(14, 3, '2020-06-15'),
(15, 3, '2020-02-16'),
(15, 1, '2020-05-15');

select *from Fornecimento;

insert
into Caixas (nome, nascimento, endereco, salario)
values
('Xuxa', '1901', 'Planeta Xuxa', 10800),
('Bin Lado', '1950', 'AfegananisCity', 500),
('Barack Brahma', '1936', 'Estados da Lado', 2000),
('Frida Fedrida', '2000', 'Cidade do Mexe', 3000),
('Angela Mel', '1901', 'Frank Cotia', 1800);

insert 
into Vendidos (cod, cpf, data_venda)
values
(1, 2, '2020-01-01'),
(1, 3, '2021-01-01'),
(2, 4, '2019-01-01'),
(2, 5, '2018-01-01'),
(3, 1, '2016-01-01'),
(3, 2, '2021-01-01'),
(4, 3, '2017-01-01'),
(4, 4, '2016-01-01'),
(5, 4, '2021-01-01'),
(5, 2, '2020-01-02'),
(6, 3, '2021-01-03'),
(6, 4, '2019-01-04'),
(7, 5, '2018-01-05'),
(8, 1, '2016-01-06'),
(9, 2, '2021-01-07'),
(10, 3, '2017-01-08'),
(11, 4, '2016-01-09'),
(12, 4, '2021-01-10');

insert
into Clientes (nome, endereco, desde)
values
('Ana Albuquerque', 'Rua do Chateu', '2016'),
('Jose Marmelo', 'Rua Marmelopolis', '2013'),
('Rogerio Bezerra', 'Rua do Curral', '2018'),
('Mariana Oliveira', 'Rua do Azeite', '2020'),
('Francisco Apostolino', 'Rua da Parabola', '2013'),
('Carla Caxias', 'Rua das Caixas', '2020'),
('Felipe Tavares', 'Rua da Taverna', '2015'),
('Bruna Brandão', 'Rua do Arpoador', '2015'),
('Antonio Mendes', 'Rua do Pescador', '2017');

insert 
into Delivery (nome_moto, tipo)
values
('iFood', 'FDS'),
('iFood', 'Diurna'),
('iFood', 'Noturna'),
('iFood', 'Expres'),
('aiqFome', 'FDS'),
('aiqFome', 'Diurna'),
('aiqFome', 'Noturna'),
('Tonho da Biz', 'Expres'),
('Tonho da Biz', 'FDS'),
('Tonho da Biz', 'Diurna'),
('Tonho da Biz', 'Noturna'),
('Tonho da Biz', 'Expres');

insert
into Controle_Entrega (cod, cpf, id_cli, cod_entregador, descritivo)
values
(1,2, 1, 2, 'Entregue'),
(1,3, 2, 3, 'Entregue'),
(2,4, 3, 4, 'Entregue'),
(2,5, 4, 5, 'Entregue'),
(3,1, 5, 6, 'Entregue'),
(3,2, 6, 7, 'Entregue'),
(4,3, 7, 8, 'Entregue'),
(4,4, 8, 9, 'Entregue'),
(5,2, 9, 10, 'Entregue'),
(5,4, 1, 11, 'Entregue'),
(6,3, 2, 12, 'Entregue'),
(6,4, 3, 1, 'Entregue'),
(7,5, 4, 2, 'Entregue');


select *from Delivery;


SELECT count(*)
FROM produtos p;

select avg (p.preco) from produtos p;

select p.nome, p.estoque
from produtos p
where p.estoque=(select max(p.estoque) from produtos p);

select p.nome, p.preco
from produtos p
where p.preco > 5;

select f.nome, f.tipo
from fornecedores f
where f.tipo = 'bebidas';

select f.cnpj
from fornecedores f
where f.cnpj=(select max(f.cnpj)from fornecedores f);


select f.nome, f.endereco
from  fornecedores f
where f.endereco = 'Rua Halls';

-- Consultas 2

select f1.nome, f2.entregue, p.nome
from fornecedores f1, fornecimento f2, produtos p
where f1.cnpj = f2.cnpj  and  p.nome = 'Carne';


-- B Qualo nome dos fornecedores que não entregam cerveja ou chocolate?

select distinct f.nome, p.nome, p.cod
from fornecedores f, produtos p, fornecimento f1
where  f.cnpj = f1.cnpj and f1.cod = p.cod and  p.nome <> 'Cerveja' or p.nome <> 'Chocolate';


-- Quais produtos foram entregues entre 2019 e 2020?

select f.entregue, p.nome
from fornecimento f, produtos p
where f.cod = p.cod  and f.entregue > '2019-01-01' and f.entregue < '2020-01-01';



-- A.Qual caixa vendeu Presunto?

SELECT 
    c.cpf, p.nome, c.nome
FROM
    caixas c,
    produtos p,
    vendidos v
WHERE
    c.cpf = v.cpf AND p.cod = v.cod
        AND p.nome IN (SELECT 
            p1.nome
        FROM
            produtos p1
        WHERE
            p1.nome = 'presunto');

-- Encontre os nome dos Caixas que Venderam algum produto em 2017 e 2018 ?UtilizeaninhamentoeIN.

SELECT 
    P.nome, C.nome, V.data_venda
FROM
    Produtos P,
    Caixas C,
    Vendidos V
WHERE
    V.cod = P.cod AND c.cpf = v.cpf
        AND V.data_venda IN (SELECT 
            V1.data_venda
        FROM
            Vendidos V1
        WHERE
            V1.data_venda BETWEEN '2017-01-01' AND '2018-12-31');
            
-- Encontre os nomes dos caixas que venderam Caviar
SELECT 
    c.cpf, p.nome, c.nome
FROM
    caixas c,
    produtos p,
    vendidos v
WHERE
    c.cpf = v.cpf AND p.cod = v.cod
        AND p.nome IN (SELECT 
            p1.nome
        FROM
            produtos p1
        WHERE
            p1.nome = 'Caviar');
            



-- Encontre os nomes dos caixas que NÃO venderam Carne.

SELECT 
    c.nome
FROM
    caixas c
WHERE
    c.cpf NOT IN (SELECT 
            v.data_venda
        FROM
            vendidos v
        WHERE
            v.cpf NOT IN (SELECT 
                    p.nome
                FROM
                    produtos p
                WHERE
                    p.nome <> 'carne'));
                    




            
            















