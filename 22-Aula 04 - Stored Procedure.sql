/*
Stored Procedure

CREATE PROCEDURE <nome>
[parâmetro tipo]
AS
<comandos sql>
*/
use empresa3m


create procedure BuscaCliente
@nomeBusca Varchar(50)
As
Select CodCli, Nome, Contato
from clientes
where nome like '%' + @nomeBusca + '%'

exec BuscaCliente 'market'


select * from Categorias
go

create procedure insereCategoria
@descricao varchar(30)
AS
insert into Categorias (Descr)
values (@descricao)
print 'Categoria inserida'

go

exec insereCategoria  'Limpeza'
go



go
Create Procedure ContaCliente
@nomeBusca Varchar(50)
As
Declare @contagem int, @mensagem Char(100)
Select @contagem = Count(*) from clientes
where nome like '%' + @nomeBusca + '%'
if @contagem = 0
	select @mensagem = 'Nenhum cliente'
else
	select @mensagem = 'Foram encontrados '+
	convert(char(3), @contagem) + ' clientes'
Print @mensagem

exec ContaCliente 'market'


/* Apagar Procedure
DROP PROCEDURE nome_procedure

*/