use Empresa2M

-- operador TOP

-- 01 - mostre o descri��o e o pre�o dos 3 produtos mais caros
select top 3 descr, preco
from produtos
order by preco desc

-- menor pre�o
select top 3 descr, preco
from produtos
order by preco 

-- 02 - mostre o n�mero e a data dos pedidos que tiveram os 5 menores fretes
select top 5 numped, dataped, frete
from pedidos
order by frete

-- exemplos de Union

-- 01) Mostre o nome e o cargo de todos os clientes e de todos os funcion�rios do Reino Unido
select nome, cargo, contato,  'clientes' as tipo
from clientes
where pais = 'Reino Unido'
UNION
select nome, cargo, 'funcion�rios' as tipo
from funcionarios
where pais = 'Reino Unido'
order by tipo

-- 02) Mostre o nome e o cargo de todos os clientes do Brasil e de todos os funcion�rios dos Estados Unidos
select nome, cargo, pais,  'clientes' as tipo
from clientes
where pais = 'Brasil'
UNION
select nome, cargo, pais, 'funcion�rios' as tipo
from funcionarios
where pais = 'EUA'
order by tipo

-- exemplos de INTERSECT
-- 01) 
select Cargo
from Clientes
INTERSECT
select Cargo
from Clientes
where pais = 'EUA'

-- exemplos de EXCEPT
-- 01) 
select Cargo
from Clientes
EXCEPT
select Cargo
from Clientes
where pais = 'EUA'

-- exemplos de fun��es de c�lculo

-- 01) Exiba maior, menor, m�dia e soma de todos os pre�os dos produtos
select MAX(Preco) as Maior, MIN(Preco) as Menor, AVG(Preco) as M�dia, SUM(Preco) as Soma
from Produtos

Select year(dataped), AVG(Frete) as Media
from pedidos
group by year(dataped)
 
 select codCategoria, codfor, sum(preco) as soma
 from produtos
 group by CodCategoria, codfor
 order by soma desc
