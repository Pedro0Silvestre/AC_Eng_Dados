/*
GRUPO 2
Rodrigo de Sousa Ferrett - Matrícula: 202402103253
Daniel de Jesus Teixeira - Matrícula: 202403660059
Lucas Alves Castela Pereira - Matrícula: 202402705989
João Pedro Santana - Matrícula: 202402717707
Pedro Henrique Silvestre de Mello Moreira - Matrícula: 202402841904
*/

-- Criando o banco:
create schema fabrica;

-- Comando para utilizar o banco:
use fabrica;

-- Exercício 1:

-- Criando a tabela funcionario:
CREATE TABLE funcionario (
    codfuncionario INT PRIMARY KEY,
    nomefuncionario VARCHAR(100) NOT NULL,
    genero CHAR(1),
    estadocivil VARCHAR(20),
    cidade VARCHAR(100),
    estado CHAR(2),
    cargo VARCHAR(50)
);

-- Criando a tabela fabricante:
create table fabricante(
codfabricante int primary key,
email varchar(50),
site varchar(80),
nomefabricante varchar(30)
);

-- Criando a tabela cliente:
CREATE TABLE cliente(
codcliente INTEGER PRIMARY KEY,
nomecliente VARCHAR(30) NOT NULL,
cidadecliente VARCHAR(20),
estadocliente CHAR(2),
generocliente CHAR(1),
estadocivilcliente VARCHAR(20),
dtnascimentocliente DATE
);

-- Criando a tabela produto:
create table produto (
codProduto int primary key,
preco numeric(8,2),
descricao varchar(300),
nomeproduto varchar(40),
codfabricante int,
foreign key (codfabricante) references fabricante(codfabricante)
);

-- Criando a tabela compra:
CREATE TABLE compra (
    codcompra INT PRIMARY KEY,
    hora TIME,
    dt DATE,
    codcliente INT,
    codfuncionario INT,
    FOREIGN KEY (codcliente) REFERENCES cliente (codcliente),
    FOREIGN KEY (codfuncionario) REFERENCES funcionario (codfuncionario)
);

-- Criando a tabela possui:
CREATE TABLE possui (
    codcompra INT,
    codproduto INT,
    qtd INT,
    valordesconto DECIMAL(10,2),
    PRIMARY KEY (codcompra, codProduto),
    FOREIGN KEY (codcompra) REFERENCES compra(codcompra),
    FOREIGN KEY (codproduto) REFERENCES produto(codproduto)
);

-- Exercício 1:

-- Populando a tabela cliente:
insert into cliente (codcliente, nomecliente, cidadecliente, estadocliente, generocliente, estadocivilcliente, dtnascimentocliente) values
(1, 'Carlos Eduardo', 'São Paulo', 'SP', 'M', 'Solteiro', '1990-05-15'),
(2, 'Ana Beatriz', 'Rio de Janeiro', 'RJ', 'F', 'Casado', '1985-08-22'),
(3, 'João Pedro', 'Belo Horizonte', 'MG', 'M', 'Divorciado', '1979-12-02'),
(4, 'Mariana Silva', 'Curitiba', 'PR', 'F', 'Solteiro', '1993-03-17'),
(5, 'Felipe Oliveira', 'Porto Alegre', 'RS', 'M', 'Viúvo', '1968-07-09'),
(6, 'Laura Mendes', 'Recife', 'PE', 'F', 'Casado', '1991-11-30'),
(7, 'Lucas Fernandes', 'Salvador', 'BA', 'M', 'Solteiro', '1997-06-25'),
(8, 'Beatriz Costa', 'Fortaleza', 'CE', 'F', 'Divorciado', '1988-04-14'),
(9, 'Rafael Lima', 'Manaus', 'AM', 'M', 'Casado', '1982-10-01'),
(10, 'Juliana Rocha', 'Brasília', 'DF', 'F', 'Solteiro', '2015-01-12'); 

-- Populando a tabela funcionario:
insert into funcionario (codfuncionario, nomefuncionario, genero, estadocivil, cidade, estado, cargo) values
(1, 'Marcos Aurélio Silva', 'M', 'Casado', 'São Paulo', 'SP', 'Vendedor(a)'),
(2, 'Juliana Ferreira Lima', 'F', 'Solteiro', 'Campinas', 'SP', 'Vendedor(a)'),
(3, 'Carlos Eduardo Ramos', 'M', 'Divorciado', 'Rio de Janeiro', 'RJ', 'Vendedor(a)'),
(4, 'Amanda Nogueira Santos', 'F', 'Casado', 'Niterói', 'RJ', 'Vendedor(a)'),
(5, 'Pedro Henrique Souza', 'M', 'Solteiro', 'Belo Horizonte', 'MG', 'Vendedor(a)'),
(6, 'Renata Alves Pereira', 'F', 'Viúvo', 'Uberlândia', 'MG', 'Vendedor(a)'),
(7, 'Lucas Gabriel Almeida', 'M', 'Solteiro', 'Salvador', 'BA', 'Vendedor(a)'),
(8, 'Camila Rocha Duarte', 'F', 'Casado', 'Feira de Santana', 'BA', 'Vendedor(a)'),
(9, 'Tiago Oliveira Cunha', 'M', 'Casado', 'São Paulo', 'SP', 'Gerente'),
(10, 'Bianca Martins Farias', 'F', 'Solteiro', 'Rio de Janeiro', 'RJ', 'Gerente');

-- Populando a tabela compra:
insert into compra (codcompra, hora, dt, codcliente, codfuncionario) values
(1, '08:10:00', '2024-11-02', 3, 1),
(2, '10:45:00', '2024-11-02', 7, 2),
(3, '13:20:00', '2024-11-03', 1, 3),
(4, '15:50:00', '2024-11-04', 3, 4),
(5, '18:05:00', '2024-11-04', 5, 5),
(6, '07:30:00', '2024-11-05', 3, 6),
(7, '11:40:00', '2024-11-05', 1, 7),
(8, '17:55:00', '2024-11-06', 1, 8),
(9, '20:10:00', '2024-11-06', 3, 1),
(10, '21:35:00', '2024-11-07', 8, 2),
(11, '09:15:00', '2024-11-08', 2, 3),
(12, '14:25:00', '2024-11-08', 9, 4),
(13, '16:40:00', '2024-11-09', 6, 5),
(14, '08:00:00', '2024-11-09', 10, 6),
(15, '12:10:00', '2024-11-10', 7, 7),
(16, '10:30:00', '2024-11-10', 7, 8),
(17, '13:50:00', '2024-11-11', 5, 3),
(18, '15:05:00', '2024-11-11', 4, 5),
(19, '19:20:00', '2024-11-12', 1, 1),
(20, '21:00:00', '2024-11-12', 2, 2);

-- Populando a tabela fabricante:
insert into fabricante (codfabricante, email, site, nomefabricante) values
(1, 'contato@techplus.com', 'www.techplus.com', 'TechPlus'),
(2, 'suporte@biosaude.com', 'www.biosaude.com', 'BioSaúde'),
(3, 'vendas@eletronicx.com', 'www.eletronicx.com', 'EletronicX');

-- Populando a tabela produto:
insert into produto (codproduto, preco, descricao, nomeproduto, codfabricante) values
(1, 249.99, 'Monitor LED 24 polegadas Full HD', 'Monitor Vision24', 1),
(2, 45.00, 'Suplemento vitamínico com 90 cápsulas', 'VitaBoost 90x', 2),
(3, 149.90, 'Fone de ouvido Bluetooth com cancelamento de ruído', 'SoundPro X', 3),
(4, 35.00, 'Termômetro digital de alta precisão', 'ThermoCheck', 2),
(5, 399.00, 'Teclado mecânico com retroiluminação RGB', 'KeyMaster RGB', 1);

-- Populando a tabela possui:
insert into possui (codcompra, codproduto, qtd, valordesconto) values
(1, 1, 3, 5.00),
(2, 3, 5, 10.00),
(3, 1, 1, 0.00),
(4, 4, 4, 2.50),
(5, 5, 6, 0.00),
(6, 2, 2, 3.00),
(7, 3, 3, 0.00),
(8, 5, 7, 5.00),
(9, 4, 2, 0.00),
(10, 1, 8, 12.00),
(11, 2, 5, 4.00),
(12, 1, 6, 0.00),
(13, 4, 5, 1.50),
(14, 1, 7, 0.00),
(15, 2, 3, 6.00),
(16, 5, 8, 0.00),
(17, 3, 3, 0.00),
(18, 4, 4, 0.00),
(19, 1, 3, 0.00),
(20, 4, 2, 5.00); 

-- Exercícios 2:

-- Exercício 2 - a)
SELECT nomecliente,cidadecliente,estadocliente
FROM cliente
WHERE estadocivilcliente = 'Solteiro';

-- Exercício 2 - b)
SELECT nomeproduto
FROM produto
WHERE preco > 50;

-- Exercício 2 - c)
SELECT DISTINCT cliente.nomecliente
FROM cliente, compra
WHERE cliente.codcliente = compra.codcliente
AND hora BETWEEN '06:00:00' AND '11:59:59' ORDER BY nomecliente;

-- Exercício 2 - d)
SELECT cliente.nomecliente, funcionario.nomefuncionario
FROM cliente, compra, funcionario
WHERE cliente.codcliente = compra.codcliente
AND funcionario.codfuncionario = compra.codfuncionario;

--  Exercício 2 - e)
SELECT estado, COUNT(*) AS totalFuncionario
  FROM funcionario
 GROUP BY estado;

--  Exercício 2 - f)
SELECT c.codcliente, c.nomecliente, COUNT(cp.codcompra) AS totalCompras
  FROM cliente c
  JOIN compra cp ON c.codcliente = cp.codcliente
  GROUP BY c.codcliente, c.nomecliente
  ORDER BY totalCompras DESC
  LIMIT 5;

-- Exercício 2 - g;
 SELECT ROUND(AVG(preco), 2) AS valor_medio_produto 
 FROM produto;
 
 -- Exercício 2 - h;
SELECT funcionario.nomefuncionario
FROM funcionario
LEFT JOIN compra ON funcionario.codfuncionario = compra.codfuncionario
WHERE compra.codfuncionario IS NULL;

-- Exercício 2 - i;
SELECT c.nomecliente, COUNT(*) AS total_compras
FROM cliente c
JOIN compra cp ON c.codcliente = cp.codcliente
GROUP BY c.nomecliente;

-- Exercício 2 - j;
SELECT cp.codcompra, 
       SUM(p.preco * po.qtd - po.valordesconto) AS valor_total
FROM compra as cp
JOIN possui as po ON cp.codcompra = po.codcompra
JOIN produto as p ON po.codProduto = p.codProduto
GROUP BY cp.codcompra
ORDER BY cp.codcompra;
