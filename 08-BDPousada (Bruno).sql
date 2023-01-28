--Script de criação do banco de dados BDpousada
	Create database BDpousada; 
	go -- Permite que seja executado vários comandos de uma vez. 
-- Usar o banco de dados
	use BDPousada; 
	go
-- Criar tabelas

	create table TbHospedes (
CodHospede int, 
Nome varchar(70), 
Endereco varchar(100), 
Cidade varchar(70), 
DataNasc date, 
Fone varchar(20), 
Email varchar(70),
primary key(CodHospede)
)
	create table TbQuartos (
			NumQuarto int, 
			Localizacao varchar(20), 
			Tipo varchar(20), 
			Categoria varchar(20),
			primary key(NumQuarto)
			)
	go
 create table TbFuncionarios (
				CodFuncionario int identity(1,1), 
				Nome varchar(70), 
				Funcao varchar(50), 
				DataAdm date,
				Primary key(CodFuncionario)
)
	go


-- autonumerado: identity(1,1), começa no 1 e vai incrementando 1 a cada resgistro .
create table TbEstadia (
			CodHospede int, 
			NumQuarto int, 
			DataEntrada date, 
			DataSaida date, 
			CodFuncionario int,
			Primary key(CodHospede, NumQuarto, DataEntrada),
			Foreign Key (CodHospede) references TbHospedes(CodHospede),
			Foreign Key (NumQuarto) references TbQuartos(NumQuarto),
			Foreign Key (CodFuncionario) references TbFuncionarios(CodFuncionario)
			)



-- Modificar a estrutura da tabela: Alter table Nomedatabela
	--Add adicionar um campo na tabela 
	--Renomear Exec sp_rename 'NomeDaTabela.NomeDaColuna' , 'NomeDaTabela.NovoNomeDaColuna', 'Column' 
	Alter table TbEstadia add Valor money 
	alter table TbEstadia drop column Valor


	-- Apagar banco 
		-- Colocar outro banco em uso, normalmente o master
		-- Drop database nome_do_banco;
		--use master; 
		--drop database BDPousada; 
	--Apagar tabela 
		--DROP TABLE NOME_TABELA; 
