-- Lista de Exercícios sobre introdução a programação

-- Utilize o banco de dados Empresa3M
Use Empresa3M 

/* 1 - Mostre os números ímpares inteiros de 0 a 50 */

Declare @Num int = 0;
while @Num <=50 
begin 
	if @Num % 2 <> 0
	begin 
	print @Num; 
	end 
	set @Num += 1
end 


/* 2 - Dados os números inteiros n1 = 5, n2 = 10 e n3 = 2, mostre-os em ordem decrescente */
declare @n1 int = 5, @n2 int = 10, @n3 int = 2;
print @n2; 
print @n1; 
print @n3; 

/* 3 - Utilizando a tabela DetalhesPed exiba a quantidade e a porcentagem de desconto para os itens de 
acordo com a tabela abaixo:
	Quantidade < 10, desconto 2%
	Quantidade entre 10 e 20, desconto 5%
	Quantidade entre 20 e 40, desconto 8%
	Quantidade acima de 40, desconto 12%
*/

select Qtde, 
case  
	when Qtde < 10  then '2%'
	when Qtde >= 10 and Qtde <= 20 then '5%'
	when Qtde >20 and Qtde <= 40 then '8%'
	when Qtde > 40 then '12%' 
end as Porcentagem_De_Desconto
from DetalhesPed order by Qtde;

/* 4 - Para cada cliente mostre nome, país e informe "importação" para países diferentes do Brasil e 
exportação" para clientes do Brasil */

select Nome, Pais, 
	case 
		when Pais = 'Brasil' then 'Importação'
		when Pais <> 'Brasil' then 'Exportação'
	end as Tipo_Envio

from Clientes order by Pais; 

/* 5 - Mostre Nome, País e Usando o CASE mostre o nome dos meses da data de nascimento dos clientes */
select Nome, Pais, 
	Case DATEPART(MONTH, DataNasc) 
	when 1 then 'Janeiro' 
	when 2 then 'Fevereiro' 
	when 3 then 'Março' 
	when 4 then 'Abril' 
	when 5 then 'Maio' 
	when 6 then 'Junho' 
	when 7 then 'Julho'
	when 8 then 'Agosto' 
	when 9 then 'Setembro'
	when 10 then 'Outubro'
	when 11 then 'Novembro' 
	when 12 then 'Dezembro' 
end as Mes_De_Nascimento 
from Funcionarios order by Nome; 
