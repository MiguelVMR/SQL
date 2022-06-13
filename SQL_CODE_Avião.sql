create database lab;
use lab;

CREATE TABLE Funcionarios (
    id_Fun INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60),
    salario FLOAT,
    PRIMARY KEY (id_Fun)
);

CREATE TABLE Voos (
    num_Voo INTEGER NOT NULL AUTO_INCREMENT,
    origem VARCHAR(60),
    destino VARCHAR(60),
    distancia TIME,
    partida TIME,
    chegada TIME,
    preco FLOAT,
    PRIMARY KEY (num_Voo)
);

CREATE TABLE Pilota (
    id_Fun INTEGER NOT NULL,
    num_Voo INTEGER NOT NULL,
    -- PK_P integer auto_increment,
    PRIMARY KEY (id_Fun, num_Voo),
    FOREIGN KEY (id_Fun)
        REFERENCES Funcionarios (id_Fun),
    FOREIGN KEY (num_Voo)
        REFERENCES Voos (num_Voo)
);

CREATE TABLE Aeronaves (
    id_Aero INTEGER NOT NULL AUTO_INCREMENT,
    dist_limite VARCHAR(60),
    nome_Aero VARCHAR(30),
    PRIMARY KEY (id_Aero)
);

CREATE TABLE Certificado (
    id_Fun INTEGER NOT NULL,
    id_Aero INTEGER NOT NULL,
    PRIMARY KEY (id_Fun , id_Aero),
    FOREIGN KEY (id_Fun)
        REFERENCES Funcionarios (id_Fun),
    FOREIGN KEY (id_Aero)
        REFERENCES Aeronaves (id_Aero)
);

insert into Funcionarios(nome, salario)
values
('Cleison Top Gun', 10000),
('Ana Esquadrilha Fumaça', 15000),
('Roberval MonoMotor', 8000),
('Godofredo KC', 9000),
('Maria Asa Delta', 10000),
('João Querosene', 8000),
('Carla Carbono Ejet', 15000),
('Klodo Manir', 5000),
('Arnaldak Starklone', 6800),
('Alberto Martalo', 17000);

insert into Voos(origem, destino, distancia, partida, chegada, preco)
values 
('SP', 'NYC', '9:00', '00:00', '9:00', 2000),
('BH', 'Londres', '10:00', '00:00', '10:00', 1500),
('RJ', 'Porto', '12:00', '00:00', '12:00', 3000),
('Acre', 'Barcelona', '14:00', '00:00', '14:00', 35000),
('BH', 'Lisboa', '9:00', '00:00', '9:00', 1500),
('SJC', 'Porto', '15:00', '00:00', '15:00', 2500),
('Itajubá', 'Barcelona', '20:00', '20:00', '00:00', 35000),
('SC', 'SP', '3:00', '00:00', '3:00', 500),
('PALG', 'BH', '4:00', '00:00', '04:00', 350);


insert into Pilota (id_Fun, num_Voo)
Values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(2,8),
(3,9),
(4,3);

insert into  Aeronaves (dist_limite, nome_Aero)
values
('500','Ejet Emb'),
('1000','Super Tucano'),
('2000','KC390'),
('3000','Boing 737'),
('4000','Airbus Max'),
('5000','F100'),
('6000','F1000'),
('500','Linea Air'),
('1000','Jumbo'),
('2000','Concorde'),
('500','Ejet Emb II'),
('1000','Super Tucano II'),
('2000','KC390 II'),
('3000','Boing MAX'),
('4000','Airbus Cargo'),
('5000','B12'),
('6000','B500'),
('500','Sky Spy'),
('1000','Jumbo II'),
('2000','14 BIs'),
('3000','Antonov II');




insert into Certificado (id_Fun, id_Aero)
values
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,2),
(1,20),
(1,7),
(2,8),
(3,9),
(4,10),
(5,11),
(6,12),
(7,13),
(1,14),
(2,15),
(3,16),
(4,17);

-- Atividade A
SELECT 
    V.origem, V.destino, V.preco
FROM
    Voos V
ORDER BY preco ASC;

-- Atividade B
SELECT 
    *
FROM
    Voos
WHERE
    distancia > '6:00'
ORDER BY destino;

-- Atividade C
SELECT 
    *
FROM
    Funcionarios
WHERE
    salario > 10000
ORDER BY nome;

-- Atividade D
SELECT 
    A.nome_Aero, F.nome
FROM
    Funcionarios F,
    Aeronaves A,
    Certificado C
WHERE
    F.id_Fun = C.id_Fun
        AND A.id_Aero = C.id_Aero
        AND F.salario > 6000;

-- Atividade E
SELECT 
    V.origem, V.destino, F.nome
FROM
    Voos V,
    Funcionarios F,
    Pilota P
WHERE
    V.num_Voo = P.num_Voo
        AND F.id_Fun = P.id_Fun
        AND V.origem = 'SP';

-- Atividade F
SELECT 
    V.origem, V.destino, F.nome AS Nome, F.salario AS Salario
FROM
    Voos V,
    Funcionarios F,
    Pilota P
WHERE
    V.num_Voo = P.num_Voo
        AND F.id_Fun = P.id_Fun
        AND F.salario > 7000;

-- Atividade G
SELECT 
    A.nome_Aero AS Aeronave,
    A.dist_limite AS Autonomia,
    F.nome AS Piloto
FROM
    Aeronaves A,
    Funcionarios F,
    Certificado C
WHERE
    A.id_Aero = C.id_Aero
        AND F.id_Fun = C.id_Fun
        AND A.dist_limite > 1000
        AND A.dist_limite < 4000;

-- Atividade H
SELECT 
    A.nome_Aero AS Aeronave, F.nome AS Piloto
FROM
    Aeronaves A,
    Funcionarios F,
    Certificado C
WHERE
    A.id_Aero = C.id_Aero
        AND F.id_Fun = C.id_Fun
        AND A.nome_Aero = 'KC390'
        AND F.id_Fun NOT IN (SELECT 
            F2.id_Fun
        FROM
            Aeronaves A2,
            Funcionarios F2,
            Certificado C2
        WHERE
            A2.id_Aero = C2.id_Aero
                AND F2.id_Fun = C2.id_Fun
                AND A2.nome_Aero = 'Super Tucano');



