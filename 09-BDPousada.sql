--Script de criação do Banco de Dados: BDPousada

/* Criação do Banco de Dados 

CREATE DATABASE NomeDoBanco

*/

Create database BDPousada
go

/* Colocar um banco em uso

USE NomeDoBanco

*/

Use BDPousada
go

/* Criar as tabelas

CREATE TABLE NomeDaTabela (
	NomeDoCampo1 Tipo,
	NomeDoCampo2 Tipo,
	NomeDoCampo3 Tipo,
	PRIMARY KEY (Chave),
	[FOREIGN KEY (Chave) references TabelaOrigem (CampoOrigem)]
)
*/
Create table TbHospedes (
	CodHospede int, 
	Nome varchar(70), 
	Endereco varchar(100), 
	Cidade varchar(70), 
	DataNasc date, 
	Fone varchar(20), 
	Email varchar(70),
	Primary Key (CodHospede)
)
go

Create Table TbQuartos (
	NumQuarto  int, 
	Localizacao varchar(20), 
	Tipo varchar(20), 
	Categoria varchar(20),
	Primary Key (NumQuarto)
)
go

Create Table TbFuncionarios (
	CodFuncionario int identity(1,1), -- Identity cria campos autonumerados 
	Nome varchar(70), 
	Funcao varchar(50), 
	DataAdm date,
	Primary Key (CodFuncionario)
)
go

Create Table TbEstadia (
	CodHospede int, 
	NumQuarto int, 
	DataEntrada datetime, 
	DataSaida datetime, 
	CodFuncionario int,
	Primary Key (CodHospede, NumQuarto, DataEntrada),
	Foreign Key (CodHospede) references tbHospedes(CodHospede),
	Foreign Key (NumQuarto) references tbQuartos(NumQuarto),
	Foreign Key (CodFuncionario) references tbFuncionarios(CodFuncionario)
)


/* Modificar estrutura da tabela

	ALTER TABLE NomeDaTabela 

	ADD NomeDoCampo Tipo -- Adiciona campo na tabela
	DROP COLUMN NomeDoCampo -- Remove o campo
	
*/

/* Renomear Campos e Tabelas

SP_RENAME NomeAntigo, NomeNovo

*/

Alter table tbEstadia add Valor money
Alter table tbEstadia drop column Valor

exec sp_rename 'TbEstadia.Valor', 'ValorFinal', 'COLUMN'

/* Apagar Banco de Dados
   - Colocar outro banco em uso, normalmente o Master

   DROP DATABASE NomeDoBanco


Use Master
Drop Database BDPousada

*/

/* Apagar Tabela
   
   DROP TABLE NomeTabela

Drop Table TbHospedes
*/


