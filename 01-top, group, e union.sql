use Empresa2M

-- operador TOP

-- 01 - mostre o descrição e o preço dos 3 produtos mais caros
select top 3 descr, preco
from produtos
order by preco desc

-- menor preço
select top 3 descr, preco
from produtos
order by preco 

-- 02 - mostre o número e a data dos pedidos que tiveram os 5 menores fretes
select top 5 numped, dataped, frete
from pedidos
order by frete

-- exemplos de Union

-- 01) Mostre o nome e o cargo de todos os clientes e de todos os funcionários do Reino Unido
select nome, cargo, contato,  'clientes' as tipo
from clientes
where pais = 'Reino Unido'
UNION
select nome, cargo, 'funcionários' as tipo
from funcionarios
where pais = 'Reino Unido'
order by tipo

-- 02) Mostre o nome e o cargo de todos os clientes do Brasil e de todos os funcionários dos Estados Unidos
select nome, cargo, pais,  'clientes' as tipo
from clientes
where pais = 'Brasil'
UNION
select nome, cargo, pais, 'funcionários' as tipo
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

-- exemplos de funções de cálculo

-- 01) Exiba maior, menor, média e soma de todos os preços dos produtos
select MAX(Preco) as Maior, MIN(Preco) as Menor, AVG(Preco) as Média, SUM(Preco) as Soma
from Produtos

Select year(dataped), AVG(Frete) as Media
from pedidos
group by year(dataped)
 
 select codCategoria, codfor, sum(preco) as soma
 from produtos
 group by CodCategoria, codfor
 order by soma desc
