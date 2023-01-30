/* Programação em SQL */
use Empresa3M
/*
Declaração de variáveis

DECLARE @nome_variavel tipo

*/

declare @num1 int = 1;
/* Atribuição de valores através do set*/
set @num1 = 10;

/* Atribuição de valores através do select*/
select @num1 =20

select @num1


/*If / Else
if condiçao
begin
	comandos
end
else
begin
	comandos
end

*/
Declare @num1 int = 1, @num2 int = 2;
if @num1 > @num2
begin
	Print @num1;
	Print 'é maior que ';
	Print @num2
end
else
begin
	Print @num1;
	Print 'é menor que ';
	Print @num2
end

/* case */

select CodFun, Nome, DataNasc,
	case datepart(weekday, DataNasc)
		when 1 then 'Domingo'
		when 2 then 'Segunda-Feira'
		when 3 then 'Terça-Feira'
		when 4 then 'Quarta-Feira'
		when 5 then 'Quinta-Feira'
		when 6 then 'Sexta-Feira'
		when 7 then 'Sábado'
	end as dia_semana

from Funcionarios

/* while */
declare @i int = 0;
while @i <= 10
begin
	print @i;
	set @i += 2;
end