-- Exerc�cios utilizando fun��es de data

/* 01) Mostre os funcionarios que nasceram no dia 19*/
	USE Empresa2M; 
	SELECT Nome, Sobrenome FROM Funcionarios WHERE day(DataNasc) = 19;  

/* 02) Mostre o nome dos funcion�rios nascidos 
em Julho*/
	SELECT Nome FROM Funcionarios WHERE month(DataNasc) = 07; 

/* 03) Mostre todos os pedidos entregues em 1998*/
	SELECT * FROM Pedidos WHERE YEAR(DataPed) = 1998; 

/* 04) Exiba o nome e a idade de todos os funcion�rios */
	SELECT Nome,DATEDIFF(YEAR, DataNasc, GETDATE()) FROM Funcionarios;   

/* 05) Exiba o n�mero do pedido, a data do pedido, a data de entrega e 
a diferen�a de dias entre o pedido e a entrega*/
	SELECT NumPed, DataPed, DataEntrega, DATEDIFF(DAY, DataPed, DataEntrega) FROM Pedidos; 

/* 06) Exiba os pedidos com 10 dias a mais para a data de entrega *?*/ 
	SELECT *, DATEADD(DAY,10,DataEntrega) FROM Pedidos;  

/* 07) Exiba todos os nomes dos funcion�rios e o nome do m�s que eles nasceram */ 
	SELECT Nome, DATENAME(MONTH,DataNasc) FROM Funcionarios;  

/* 08) Exiba quantos dias j� se passou do seu nascimento */
	SELECT DATEDIFF(DAY, '1998-09-30',  GETDATE()); 