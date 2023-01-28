/* ------------ CONSULTAS SIMPLES -------------------*/
use Empresa2M

select  *
from clientes

select *
from clientes
where pais = 'Brasil'

select nome, cargo
from clientes
where pais = 'Brasil'


/* ------------ FUNÇÕES DE DATA E HORA --------------- */

/* GetDate: Retorna o valor da data atual do sistema */
Select GETDATE()

/* Day: Retorna o DIA de uma data fornecida*/
Select day('2016-12-25')

select day(getdate())

Select nome, DAY(dataNasc), dataNasc
from Funcionarios


/* Month: Retorna o MÊS de uma data fornecida*/
Select month('2016-12-25')

Select nome, MONTH(dataNasc), dataNasc
from Funcionarios
where Month(dataNasc) = 7

Select nome, MONTH(dataNasc), dataNasc
from Funcionarios
where Month(dataNasc) = Month(getdate())

/* Year: Retorna o ANO de uma data fornecida*/
Select nome, YEAR(dataNasc), dataNasc
from Funcionarios
order by datanasc

select *
from funcionarios
where year(dataNasc) > 1960

/* DateAdd: Adiciona um determinado número a uma parte da data
Parte:
Year - ano
Quarter - trimestre
month - mês
Dayofyear - dia do ano
Day - dia
Week - semana
WeekDay - dia da semana
Hour - hora
Minute - minuto
Second - segundo
Milisecond - milisegundos
*/
Select DATEADD(day, 5, GETDATE())
Select DATEADD(year, -5, GETDATE())
Select DATEADD(month, 6, GETDATE())
Select DATEADD(quarter, 1, GETDATE())


/*DateDiff: apresenta a diferença de dias, meses ou anos 
entre duas datas*/
select DATEDIFF(day, '2021-01-01', getdate())
select DATEDIFF(day, getdate(), '2022-01-01')

select DATEDIFF(week, '2020-01-01', getdate())

/*DateName: apresenta o nome da parte da data*/
select DATENAME (month, getdate())
select DATENAME (weekday, '2021-12-25')

