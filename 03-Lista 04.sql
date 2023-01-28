-- Exercícios

/* 01) Exiba todos os dados dos produtos que começam
com a letra L, em ordem decrescente de preço  */

SELECT * FROM Produtos WHERE Descr LIKE 'l%' ORDER BY preco DESC; 

/* 02) Exiba todos os dados dos produtos que contenham
em seu nome a palavra chef , em ordem crescente de preço  */

SELECT * FROM Produtos WHERE Descr LIKE '%chef%'; 

/* 03) Exiba todos os dados dos produtos cuja descrição
termine com ing , em ordem decrescente de unidade  */

SELECT * FROM Produtos WHERE Descr LIKE '%ing'; 

/* 04) Exiba Código, nome e contato dos clientes cujo
contato comece com Jo */

SELECT CodCli, Nome, Contato FROM Clientes WHERE Contato LIKE 'Jo%';  

/* 05) Exiba todos os dados dos clientes cujo cargo seja
de gerente. Em ordem de cargo*/

SELECT * FROM Clientes WHERE Cargo LIKE '%gerente%' ORDER BY Cargo; 

/* 06) Exiba código e nome dos funcionarios cujo código
esteja entre 3 e 7*/

SELECT CodFun, Nome FROM Funcionarios WHERE CodFun >= 3 AND Codfun <= 7; 

/* 07) Mostre todos os dados dos pedidos entregues
entre 05/01/1998 e 6/02/1998 */

SELECT * FROM Pedidos WHERE DataEntrega BETWEEN '05/01/1998' AND '6/02/1998'; 

/* 08) Exiba Nome, sobrenome, cargo e salario dos 
funcionários que ganham entre 5000 e 10000. Em
ordem crescente de salário*/

SELECT Nome, Sobrenome, cargo, salario FROM Funcionarios WHERE Salario BETWEEN 5000 AND 10000 ORDER BY salario ASC; 

/* 09) Exiba todos os dados dos funcionários que
nasceram entre 1960 e 1965. Em ordem decrescente 
de salário*/

SELECT * FROM Funcionarios WHERE YEAR(DataNasc) BETWEEN '1960' AND '1965';  

/* 10) Exiba todos os dados dos pedidos de agosto
de 1997 */

SELECT * FROM Pedidos WHERE YEAR(DataPed)  = '1997' AND MONTH(DataPed) = '8';  

/* 11) Exiba todos os dados dos pedidos feitos todo
dia 10*/

SELECT * FROM Pedidos WHERE DAY(DataPed) = '10'; 

/* 12) Mostre o cargo e a quantidade de funcionários
por cargo */

SELECT COUNT(*)AS QTD, Cargo FROM Funcionarios GROUP BY Cargo ORDER BY QTD;

/* 13) Exiba a cidade e a quantidade de clientes por
cidade. Em ordem descrecente de quantidade. */

SELECT Cidade, count(*) AS QTD from Clientes GROUP BY Cidade ORDER BY QTD DESC; 

/* 14) Mostre o país e a quantidade de funcionários
por país. Em ordem de país. */

SELECT Pais, count(*) AS QTD FROM Funcionarios GROUP BY Pais ORDER BY Pais; 

/* 15) Exiba o código da categoria e a quantidade
de produtos da categoria. */ 

SELECT CodCategoria, COUNT(*) AS QTD FROM Produtos GROUP BY CodCategoria ORDER BY CodCategoria;  

/* 16) Exiba os dados das Categorias em ordem decrescente 
de descrição */

SELECT * FROM Categorias ORDER BY Descr DESC; 

/* 17) Mostre o Contato e a Cidade dos clientes dos EUA */

SELECT Contato, Cidade FROM Clientes WHERE Pais = 'EUA'; 

/* 18) Exiba todos os dados dos clientes da cidade de 
  Lisboa*/

  SELECT * FROM Clientes WHERE Cidade = 'Lisboa'; 

/* 19) Exiba os dados dos clientes que tenham a palavra 
vendas em qualquer parte do cargo */
 
 SELECT * FROM Clientes WHERE Cargo LIKE '%vendas%'; 

/* 20) Exiba a cidade e a quantidade de clientes por 
cidade */

SELECT Cidade, COUNT(*) AS quantidade FROM Clientes group by Cidade order by quantidade; 

/* 21) Mostre todos os dados dos funcionarios em ordem 
crescente de nome*/
 SELECT * FROM  Funcionarios order by Nome ASC;  
/* 22) Mostre o cargo e a quantidade de funcionarios
por cargo */
SELECT cargo, COUNT(*) AS Quantidade FROM Funcionarios GROUP BY Cargo ORDER BY Cargo;
