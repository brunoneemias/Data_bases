-- Consultas utilizando mais de uma tabela.
use Empresa3M

-- Ex 00) Exiba os dados dos produtos e a descrição da categoria que o produto pertence
select produtos.*, categorias.Descr
from produtos, categorias
where produtos.CodCategoria = Categorias.CodCategoria

select P.*, Cat.Descr
from produtos P, categorias Cat
where P.CodCategoria = Cat.CodCategoria

-- Ex 01) Exiba todos os dados dos produtos da categoria Confeitos.
select * from produtos
select * from categorias

select produtos.*, Categorias.Descr
from produtos, categorias
where produtos.CodCategoria = Categorias.CodCategoria and 
	  Categorias.Descr = 'Confeitos'

select p.*, cat.Descr
from produtos p, categorias cat
where p.CodCategoria = cat.CodCategoria and cat.Descr = 'Confeitos'

-- Ex 02) Exiba todos os dados dos clientes que fizeram pedidos com o 
-- funcionário Robert King
select distinct c.*, fun.nome, fun.Sobrenome
from Clientes C, Pedidos Ped, Funcionarios Fun
where C.CodCli = Ped.CodCli and Ped.CodFun = Fun.CodFun and 
	  Fun.Nome = 'Robert' and Fun.Sobrenome = 'King'
order by c.nome

-- Ex 03) Exiba todos os dados dos pedidos que continham o produto 'Tofu'. 
-- Em ordem de data de pedido.
select Ped.*, P.Descr
from Pedidos Ped, DetalhesPed D, Produtos P
where Ped.NumPed = D.NumPed and D.CodProd = P.CodProd and P.Descr = 'Tofu'
order by ped.DataPed


-- Ex 04) Exiba todos os dados dos fornecedores dos produtos que fizeram
-- parte dos pedidos de agosto de 1996
select distinct F.*, Ped.NumPed, Ped.DataPed
from Pedidos Ped, DetalhesPed D, Produtos P, Fornecedores F
where Ped.NumPed = D.NumPed and D.CodProd = P.CodProd and P.CodFor = F.CodFor and
month(Ped.DataPed) = 8 and year(Ped.DataPed) = 1996
order by f.empresa


-- Ex 05) Exiba a descrição do produto e o nome de seu fornecedor
select p.Descr, f.Empresa
from produtos p, Fornecedores f
where p.CodFor = f.CodFor
order by f.Empresa
