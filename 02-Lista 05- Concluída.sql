
/********************** Exercícios *******************************************************/

/* TOP */

--01) Exiba o nome, o sobrenome, o cargo e o salário dos 3 funcionários que possuem o maior salário

SELECT TOP 3  Nome, Sobrenome, Cargo, Salario FROM Funcionarios ORDER BY Salario DESC; 

--02) Exiba o nome e o sobrenome do funcionário mais velho.

SELECT TOP 1  Nome, Sobrenome FROM Funcionarios ORDER BY DataNasc ASC;

--03) Exiba o nome e o sobrenome do funcionário mais novo.

SELECT TOP 1 Nome, Sobrenome FROM Funcionarios ORDER BY DataNasc DESC; 

--04) Mostre todos os dados dos 5 pedidos mais recentes.

SELECT TOP 5 * FROM Pedidos ORDER BY DataPed DESC; 

--05) Mostre todos os dados dos 6 últimos pedidos do ano de 1996.

SELECT TOP 6 * FROM Pedidos WHERE YEAR(dataped) = '1996' ORDER BY DataPed DESC; 

--06) Exiba Nome e Contato dos 3 primeiros clientes do Reino Unido. Ordenado por nome

SELECT TOP 3 Nome, Contato FROM Clientes WHERE Pais = 'Reino Unido' ORDER BY Nome ASC; 

--07) Exiba todos os dados dos 10 produtos mais caros.

SELECT TOP 10 * FROM Produtos ORDER BY Preco DESC; 

--08) Exiba a Descrição e o preço dos 5 produtos mais baratos.

SELECT TOP 5 Descr, Preco FROM  Produtos ORDER BY Preco ASC; 

--09) Exiba todos os dados dos 3 pedidos com maior frete.

SELECT TOP 3 * FROM Pedidos ORDER BY Frete DESC; 

--10) Exiba todos os dados dos 5 pedidos com menor frete no ano de 1996

SELECT TOP 5 * FROM Pedidos WHERE YEAR(DataPed) = '1996' ORDER BY Frete ASC; 

/* Union */

--01) Exiba o nome e o cargo de todos os funcionários dos EUA e o contato e o cargo de todos os fornecedores dos EUA (Usando UNION)

SELECT Nome, Cargo, 'Funcionário' AS tipo FROM Funcionarios WHERE Pais = 'EUA' 
UNION 
SELECT Contato, Cargo, 'Fornecedor' AS tipo FROM Fornecedores WHERE Pais = 'EUA' ORDER BY tipo; 

--02) Exiba nome, contato e país de todos os clientes do Brasil e da Alemanha (Usando UNION)
 
 SELECT Nome, Contato, Pais FROM Clientes WHERE Pais = 'Brasil' 
 UNION 
 SELECT Nome, Contato, Pais FROM Clientes WHERE Pais = 'Alemanha' ORDER BY Pais;

--03) Exiba nome, contato e a cidade de todos os clientes de Madrid e de Paris (Usando UNION)

SELECT Nome, Contato, Cidade FROM Clientes WHERE Cidade = 'Madrid' 
UNION 
SELECT Nome, Contato, Cidade FROM Clientes WHERE Cidade ='Paris' ORDER BY Cidade; 

--04) Mostre a descrição e o preço dos produtos das categorias de código 1 e 3 (Usando UNION)

SELECT Descr, Preco FROM Produtos WHERE CodCategoria = 1 
UNION 
SELECT Descr, Preco FROM Produtos WHERE CodCategoria = 3 ORDER BY Descr; 

--05) Exiba o nome, o cargo e o país de todos os funcionários do Reino Unido e o contato e o cargo de todos os fornecedores da França

SELECT Nome, Cargo, Pais, 'Funcionario' AS tipo FROM Funcionarios W HERE Pais = 'Reino Unido' 
UNION 
SELECT Contato, Cargo, Pais, 'Fornecedor' AS tipo FROM Fornecedores WHERE Pais = 'França' ORDER BY Pais; 


/* Grupo */

-- 01) Exiba maior, menor, média e soma dos fretes dos pedidos.
	SELECT MAX(Frete) AS Maior, MIN(Frete) AS Menor, AVG(Frete) AS Média, SUM(Frete) AS Soma FROM Pedidos 
-- 02) Exiba maior, menor, média e soma dos fretes dos pedidos no primeiro semestre de 1997.
	SELECT MAX(Frete) AS Maior, MIN(Frete) AS Menor, AVG(Frete) AS Média, SUM(Frete) AS Soma FROM Pedidos 
	WHERE YEAR(DataPed) = '1997' and MONTH(DataPed) BETWEEN '01' AND '06' 
	
-- 03) Exiba maior, menor, média e soma dos fretes dos pedidos entregues em setembro de 1997.
	SELECT MAX(Frete) AS Maior, MIN(Frete) AS Menor, AVG(Frete) AS Média, SUM(Frete) AS Soma FROM Pedidos 
	WHERE YEAR(DataEntrega) = '1997' and MONTH(DataPed) = '09'
-- 04) Exiba maior, menor, média e soma dos preços dos produtos.
	SELECT MAX(Preco) AS Maior, MIN(Preco) AS Menor, AVG(Preco) AS Média, SUM(Preco) AS Soma FROM Produtos 
-- 05) Exiba maior, menor, média e soma dos preços dos produtos que começam com a letra A.
	SELECT MAX(Preco) AS Maior, MIN(Preco) AS Menor, AVG(Preco) AS Média, SUM(Preco) AS Soma FROM Produtos WHERE Descr LIKE'A%'
-- 06) Exiba maior, menor, média e soma dos preços dos produtos que terminam com ild.
	SELECT MAX(Preco) AS Maior, MIN(Preco) AS Menor, AVG(Preco) AS Média, SUM(Preco) AS Soma FROM Produtos WHERE Descr LIKE'%ild'
-- 07) Exiba maior, menor, média e soma dos preços dos produtos da categoria de codigo 20.
	SELECT MAX(Preco) AS Maior, MIN(Preco) AS Menor, AVG(Preco) AS Média, SUM(Preco) AS Soma FROM Produtos WHERE CodCategoria = 20; 
-- 08) Exiba maior e o menor código dos produtos.
	SELECT MAX(CodProd) AS Maior, MIN(CodProd) AS Menor FROM Produtos 
-- 09) Exiba maior e o menor código dos funcionários.
	SELECT MAX(CodFun) AS Maior, MIN(CodFun) AS Menor FROM Funcionarios
-- 10) Exiba maior e o menor código das categorias.
	SELECT MAX(CodCategoria) AS Maior, MIN(CodCategoria) AS Menor FROM Categorias
