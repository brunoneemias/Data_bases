
USE Empresa3M
/* Exercícios Consultas com mais de uma tabela utilizando Join */

/* 01) Mostrar todos os clientes que fizeram pedidos em março de 1997 */

	SELECT DISTINCT C. * FROM Clientes C INNER JOIN Pedidos P ON P.CodCli = C.CodCli 
		AND MONTH(P.DataPed) = 3
		AND YEAR(P.DataPed) = '1997'; 

/* 02) Mostrar todos os funcionários que fizeram pedidos para o cliente 'Around the horn' */

	SELECT DISTINCT Fun. * FROM Funcionarios Fun INNER JOIN Pedidos Ped ON Fun.CodFun = Ped.CodFun
		INNER JOIN  Clientes C ON Ped.CodCli = C.CodCli AND C.Nome = 'Around the horn' ; 
		

/* 03) Mostre todos os pedidos feitos pelo cliente 'Comércio Mineiro'. */
	
	SELECT * FROM Pedidos Ped INNER JOIN Clientes C ON C.CodCli = Ped.CodCli  AND C.Nome = 'Comércio Mineiro'; 

/* 04) Mostrar todos os dados dos Funcionários que participaram dos pedidos de setembro de 1996. */

	SELECT * FROM Funcionarios Fun INNER JOIN Pedidos Ped ON Fun.CodFun = Ped.CodFun 
		AND MONTH(DataPed) = '09' AND YEAR(dataped) = '1996'; 

/* 05) Mostrar a todos os dados dos produtos e suas categorias de todos os produtos da categoria 'laticínios' */

	SELECT * FROM Produtos P LEFT OUTER JOIN Categorias Cat ON P.CodCategoria = Cat.CodCategoria AND Cat.Descr = 'laticínios';

/* 06) Mostrar todos os dados dos produtos e o número do pedido em que eles fizeram parte na data '1996-07-08' */

		SELECT P.*, Ped.NumPed AS Num_Pedido FROM Produtos P INNER JOIN DetalhesPed Ped ON P.CodProd = Ped.CodProd 
		INNER JOIN Pedidos ON Pedidos.NumPed = Ped.NumPed AND DataPed =  '1996-07-08'; 

/* 07) Mostre o nome de todos os funcionários e o número dos pedidos que eles fizeram em '1997-05-01'. */
		SELECT Funcionarios.Nome, Pedidos.NumPed FROM Funcionarios INNER JOIN Pedidos ON
		Funcionarios.CodFun = Pedidos.CodFun AND DataPed = '1997-05-01'; 

/*08) Mostre o número dos pedidos feitos em maio de 1997 e o nome de todos os clientes.*/
		SELECT Ped.NumPed, Cli.Nome FROM Pedidos Ped INNER JOIN Clientes Cli ON Ped.CodCli = Cli.CodCli 
		AND YEAR(DataPed) = '1997'