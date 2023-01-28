/*
Resolva os exercícios abaixo:
*/

-- 1) inserir os seguintes clientes:
USE Locadora; 

INSERT INTO tbClientes(CodCli,Nome,Endereco,Cidade,Sexo,Datanasc,CNH) VALUES (1,'José de Oliveira','Av. Jatobá','Jundiaí','M','1965-05-11','0009');
INSERT INTO tbClientes(CodCli,Nome,Endereco,Cidade,Sexo,Datanasc,CNH) VALUES (2,'Maria da Silva','Av. Presidente','Itatiba','F','1979-10-08', '0008'); 
INSERT INTO tbClientes(CodCli,Nome,Endereco,Cidade,Sexo,Datanasc,CNH) VALUES (3,'Antonio Carlos','R. Florença','Jundiaí','M','1980-09-20','0007');
INSERT INTO tbClientes(CodCli,Nome,Endereco,Cidade,Sexo,Datanasc,CNH) VALUES (4,'Luisa de Souza','Av. Jequitibá','Jundiaí','F','1975-10-10', '0005'); 

SELECT* FROM  tbClientes; 

-- 2) inserir os seguintes carros:

INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (1,'Ford','Ka','AAA-0001', 180.00, 'Econômico'); 
INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (2,'GM','Onix','AAA-0002', 180.00, 'Econômico'); 
INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (3,'Honda','HRV','AAA-0003', 270.00, 'SUV');
INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (4,'Jeep','Compass','AAA-0004', 310.00, 'SUV Média');
INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (5,'VW','Jetta','AAA-0005', 270.00, 'Sedan');
INSERT INTO TbCarros(CodCarro,Marca,Modelo,Placa,ValorDiaria,Categoria) VALUES (6,'Fiat','Mobi','AAA-0006', 130.00, 'Compacto'); 

SELECT * FROM TbCarros; 

-- 3) inserir os seguintes aluguéis:

SET IDENTITY_INSERT tbAluguel ON; 
INSERT INTO tbAluguel(CodAluguel,CodCli,CodCarro,DataRetirada,DataDevolucao,ValorPago) VALUES (1,1,1,02-08-2019, 07-08-2019, 900); 
INSERT INTO tbAluguel(CodAluguel,CodCli,CodCarro,DataRetirada,DataDevolucao,ValorPago) VALUES (2,2,3,12-08-2019, 15-08-2019, 500);
INSERT INTO tbAluguel(CodAluguel,CodCli,CodCarro,DataRetirada,DataDevolucao,ValorPago) VALUES (3,3,2,02-08-2019, 07-08-2019, 900);
INSERT INTO tbAluguel(CodAluguel,CodCli,CodCarro,DataRetirada,DataDevolucao,ValorPago) VALUES (4,4,5,12-08-2019, 15-08-2019, 700); 

SELECT * FROM tbAluguel; 
-- 4) atualizar o campo estado para SP de todos os clientes
	UPDATE tbClientes SET Estado='SP'; 
	SELECT * FROM tbClientes; 

-- 5) atualizar o campo Valor Diária para 350 do Compass
	UPDATE TbCarros SET ValorDiaria = 350 WHERE Modelo = 'Compass'; 
	SELECT * FROM TbCarros; 

-- 6) atualizar para 'Vinhedo' a cidade do cliente de código 2
	UPDATE tbClientes SET Cidade ='Vinhedo' WHERE CodCli = 2; 
	SELECT Cidade FROM tbClientes WHERE CodCli = 2; 

-- 7) apagar o carro Mobi
	SELECT CodCarro FROM TbCarros WHERE Modelo = 'Mobi';
	DELETE FROM TbCarros WHERE CodCarro = 6; 
	SELECT * FROM TbCarros; 

-- 8) apagar os aluguéis do cliente de código 3
	DELETE FROM tbAluguel WHERE CodCli = 3; 
	SELECT * FROM tbAluguel; 
-- 9) apagar os aluguéis do carro de código 2
	DELETE FROM tbAluguel WHERE CodCli = 2; 
	SELECT * FROM tbAluguel; 

-- 10) atualizar o campo valor diária em 7%
	UPDATE TbCarros SET ValorDiaria = ValorDiaria * 1.07; 
	SELECT * FROM TbCarros; 

