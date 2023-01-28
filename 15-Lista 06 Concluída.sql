-- colocar em uso a tabela Empresa

/* exemplos de CONECTIVOS*/

/********************** Exercícios *******************************************************/

/* Conectivos */

/*01) Usando os conectivos IN e NOT IN resolva as seguintes consultas:*/
	use Empresa2M
/* Mostre a descrição e o preço dos produtos das categorias Bebidas e Confeitos*/
	SELECT Descr AS Descrição, Preco AS Preço FROM Produtos WHERE CodCategoria IN (SELECT CodCategoria FROM Categorias
	WHERE Descr ='Bebidas' OR Descr = 'Confeitos' ) ORDER BY Descr ASC
/* Mostre todos os dados dos pedidos dos clientes da Alemanha*/
	SELECT * FROM Pedidos WHERE CodCli IN (SELECT CodCli FROM Clientes WHERE Pais = 'Alemanha'); 
/* Exiba todos os produtos da categoria Condimentos*/
	SELECT * FROM Produtos WHERE CodCategoria IN (SELECT CodCategoria FROM Categorias WHERE Descr = 'Condimentos'); 
/* Mostre a descrição de todos os produtos que NÃO são fornecidos por fornecedores dos EUA */
	SELECT Descr FROM Produtos WHERE CodFor NOT IN (SELECT CodFor FROM Fornecedores WHERE Pais = 'EUA'); 
/* Mostre a descrição de todos produtos que NÃO fizeram parte dos pedidos de março de 1997 */
	SELECT Descr FROM Produtos WHERE CodProd NOT IN (SELECT CodProd FROM  DetalhesPed WHERE NumPed 
	IN (SELECT NumPed FROM Pedidos WHERE YEAR(DataPed) = '1997' AND MONTH(DataPed) = '03'))
/* Mostre os dados dos clientes que fizeram pedidos em junho de 1997*/
	SELECT * FROM Clientes WHERE CodCli IN (SELECT CodCli FROM Pedidos WHERE YEAR(DataPed) = '1997' AND MONTH(DataPed) = '06')