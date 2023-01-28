-- colocar em uso a tabela Empresa

/* exemplos de CONECTIVOS*/

/********************** Exerc�cios *******************************************************/

/* Conectivos */

/*01) Usando os conectivos IN e NOT IN resolva as seguintes consultas:*/
	use Empresa2M
/* Mostre a descri��o e o pre�o dos produtos das categorias Bebidas e Confeitos*/
	SELECT Descr AS Descri��o, Preco AS Pre�o FROM Produtos WHERE CodCategoria IN (SELECT CodCategoria FROM Categorias
	WHERE Descr ='Bebidas' OR Descr = 'Confeitos' ) ORDER BY Descr ASC
/* Mostre todos os dados dos pedidos dos clientes da Alemanha*/
	SELECT * FROM Pedidos WHERE CodCli IN (SELECT CodCli FROM Clientes WHERE Pais = 'Alemanha'); 
/* Exiba todos os produtos da categoria Condimentos*/
	SELECT * FROM Produtos WHERE CodCategoria IN (SELECT CodCategoria FROM Categorias WHERE Descr = 'Condimentos'); 
/* Mostre a descri��o de todos os produtos que N�O s�o fornecidos por fornecedores dos EUA */
	SELECT Descr FROM Produtos WHERE CodFor NOT IN (SELECT CodFor FROM Fornecedores WHERE Pais = 'EUA'); 
/* Mostre a descri��o de todos produtos que N�O fizeram parte dos pedidos de mar�o de 1997 */
	SELECT Descr FROM Produtos WHERE CodProd NOT IN (SELECT CodProd FROM  DetalhesPed WHERE NumPed 
	IN (SELECT NumPed FROM Pedidos WHERE YEAR(DataPed) = '1997' AND MONTH(DataPed) = '03'))
/* Mostre os dados dos clientes que fizeram pedidos em junho de 1997*/
	SELECT * FROM Clientes WHERE CodCli IN (SELECT CodCli FROM Pedidos WHERE YEAR(DataPed) = '1997' AND MONTH(DataPed) = '06')