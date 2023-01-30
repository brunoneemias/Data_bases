use Empresa3M
/* Exerc�cios Consultas com mais de uma tabela */

/* 01) Mostrar todos os clientes que fizeram pedidos em 1996 */

SELECT * FROM Clientes WHERE CodCli IN (SELECT CodCli FROM Pedidos WHERE YEAR(DataPed) = '1996');

/* 02) Mostrar todos os funcion�rios que fizeram pedidos para o cliente 'Around the horn' */

SELECT * FROM Funcionarios WHERE CodFun IN (SELECT CodFun FROM Pedidos WHERE  CodCli IN (SELECT CodCli FROM Clientes WHERE Nome = 'Around the horn')); 

/* 03) Mostre todos os pedidos feitos pelo cliente 'Com�rcio Mineiro'. */

SELECT * FROM Pedidos WHERE CodCli IN (SELECT CodCli FROM Clientes WHERE Nome = 'Com�rcio Mineiro'); 

/* 04) Mostrar todos os dados dos Funcion�rios que participaram dos pedidos de setembro de 1996. */

SELECT * FROM Funcionarios WHERE  CodFun IN (SELECT CodFun FROM Pedidos WHERE MONTH(DataPed) = '09' AND YEAR(dataped) = '1996'); 

/* 05) Mostrar a todos os dados dos produtos e suas categorias de todos os produtos da categoria 'latic�nios' */

SELECT Produtos.*, Categorias.* FROM  Produtos, Categorias WHERE Produtos.CodCategoria = Categorias.CodCategoria AND Categorias.Descr = 'latic�nios'; 

/* 06) Mostrar todos os dados dos produtos e o n�mero do pedido em que eles fizeram parte na data '1996-07-08' */

SELECT Produtos.*, DetalhesPed.NumPed FROM Produtos, DetalhesPed WHERE Produtos.CodProd = DetalhesPed.CodProd AND 
DetalhesPed.CodProd IN (SELECT Produtos.CodProd FROM Pedidos WHERE DAY(DataPed) = '8' AND MONTH(dataped) = '7' AND YEAR(dataped) = '1996');
/* 07) Mostre o nome de todos os funcion�rios e o n�mero dos pedidos que eles fizeram em '1997-05-01'. */

SELECT F.Nome, P.Numped FROM Funcionarios F, Pedidos P WHERE F.CodFun = P.CodFun AND DAY(P.DataPed) = '01' AND MONTH(dataped) = '05' AND YEAR(dataped) = '1997'; 

/*08) Mostre o n�mero dos pedidos feitos em maio de 1997 e o nome de todos os clientes.*/

SELECT P.NumPed,C.Nome FROM Pedidos P, Clientes C WHERE MONTH(P.dataped) = '05' AND YEAR(P.dataped) = '1997'; 
