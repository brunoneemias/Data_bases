	-- colocar o banco em uso
use Empresa2M

-- Consultas usando like
-- Exemplos:

/* 01) Exiba os dados dos clientes cujos nomes começam com Q*/
select * 
from clientes
where nome like 'q%'

/* 02) Exiba os dados dos clientes cujo cargo 
contenha a palavra marketing*/
select * 
from clientes
where cargo like '%marketing%'

/* 03) Exiba os dados dos clientes cujo país tenha no seu nome a segunda letra R*/
select * 
from clientes
where Pais like '_r%'


-- Consultas usando between
-- Exemplos:

/* 01) Exiba os dados dos produtos cujo preco
esteja entre 10 e 20 */
select *
from produtos
where preco between 10 and 20

select *
from produtos
where preco >=10 and preco <=20


/* 02) Exiba os dados dos pedidos feitos entre
janeiro de 97 e setembro de 97*/
select *
from pedidos
where dataped between '1997-01-01' and '1997-09-30'

select *
from pedidos
where year(dataped) = 1997 and MONTH(dataped) between 1 and 9

-- Consultas usando funções de data
-- Exemplos:
/* 01) Mostre os funcionarios que nasceram no dia 19*/
select *
from funcionarios
where day(datanasc) = 19


/* 02) Mostre o nome dos funcionários nascidos 
em Julho*/
select nome
from funcionarios
where month(datanasc) = 7

/* 03) Mostre todos os pedidos entregues em 1998*/
select *
from pedidos
where year(dataentrega) = 1998

-- Consultas usando count e group by
-- Exemplos:
/* 01) Mostre quantidade de clientes do Brasil*/
select * 
from clientes
where pais = 'Brasil'

select count(*) as qtde
from clientes
where pais = 'Brasil'

/* 02) Mostre o país e a quantidade de clientes por
país em ordem de quantidade*/
select pais, count(*) as qtde
from clientes
group by pais
order by qtde 
