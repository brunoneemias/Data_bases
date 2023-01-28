-- 1) Crie o banco de Dados Locadora e coloque-o em uso
Create database Locadora
Go
use Locadora
Go

-- 2) Crie as seguintes tabelas:

Create table tbClientes(
	CodCli int,  
	Nome varchar(50), 
	Endereco varchar(50),
	Cidade  varchar(50),
	Sexo char(1),
	Datanasc date,
	CNH char(25),
	DataHabilitacao date,
	Primary Key(CodCli)
)

Go 

Create table TbCarros (
	CodCarro int, 
	Marca varchar(30),
	Modelo varchar(30),
	Placa char(8),
	ValorDiaria money,
	Fornecedor varchar(50),
	Primary Key(CodCarro)
)

Go

Create table tbAluguel(
	CodAluguel int identity(1,1),
	CodCli int,
	CodCarro int,
	DataRet datetime,
	DataDev datetime,
	ValorPago money,
	Primary key(CodAluguel),
	Foreign Key(CodCli) references TbClientes(CodCli), 
	Foreign Key(CodCarro) references TbCarros(CodCarro)

)

Go

-- 3) Acrescentar o campo Estado (caracter 2) na tabela de Clientes

	Alter table tbClientes  add Estado char (2) 

-- 4) Acrescentar o campo Categoria (texto 30) na tabela de Carros
	
	Alter table tbCarros add Categoria varchar(30)

-- 5) Acrescentar o campo Cor (texto 20) na tabela de Carros
	
	Alter table tbCarros add Cor varchar(20) 

-- 6) Mudar o nome do campo DataRet para DataRetirada na tbAluguel
		Exec sp_rename 'tbAluguel.DataRet' ,'DataRetirada';
-- 7) Mudar o nome do campo DataDev para DataDevolucao na tbAluguel
		
		Exec sp_rename 'tbAluguel.DataDev', 'DataDevolucao';
	
-- 8) Remova o campo DataHabilitacao da tabela de Clientes

	    Alter table tbClientes Drop column DataHabilitacao;

-- 9) Remova o campo Fornecedor da tabela de Carros

		Alter table TbCarros drop column Fornecedor