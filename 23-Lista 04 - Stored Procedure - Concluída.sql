/* Exercícios Stored Procedures */
USE Empresa3M
GO
/* 1 - Crie a stored procedure 'insere_fornec' que insira um registro
na tabela de fornecedores */
CREATE PROCEDURE insere_fornec (
@Empresa   VARCHAR(30),
@Contato   VARCHAR(30),
@Cargo     VARCHAR(30),
@Endereco  VARCHAR(30),
@Cidade    VARCHAR(30),
@Cep       VARCHAR(30),
@Pais      VARCHAR(30) 
)

AS 

INSERT INTO Fornecedores (
Empresa,
Contato,
Cargo,
Endereco,
Cidade,
CEP,
Pais 
)

VALUES (
@Empresa, 
@Contato, 
@Cargo,
@Endereco,
@Cidade,
@Cep,
@Pais
) 
PRINT 'Fornecedor inserido'

EXEC insere_fornec 'MRS LOGISTICA', '1140028922', 'TÉCNICO DE MANUTENÇÃO', 'RUA DA ALEGRIA 555', 'SAO PAULO' ,'13871-587', 'BRAZIL'

/* 2 - Crie a stored procedure 'insere_detalhes' que insira um detalhe
de pedido na tabela DetalhesPed. */
CREATE PROCEDURE inseredetalhes (
@numped INT, 
@codprod INT, 
@preco MONEY,
@qtde INT,
@desconto FLOAT 
)
AS
INSERT INTO DetalhesPed (numped, CodProd, Preco, Qtde, Desconto )
VALUE (@numped, @codprod, @preco, @qtde, @desconto)
PRINT 'Detalhe do pedido inserido'

GO

EXEC inseredetalhes 10867,2,16,2,0
GO

/* 3 - Crie a stored procedure 'aumenta_preco' que dado um código de
produto e um percentual, aumente o valor do mesmo na quantidade do
percentual fornecido. Se nenhum código for informado todos os produtos
serão alterados. Obs. o percentual deve ser informado em forma decimal, por
exemplo 10% deve ser indicado como 0.1 */
CREATE	PROCEDURE aumenta_preco
(
@CodProd	INT	=	0,
@PORCEN  	FLOAT		=	0
)

AS

	IF	@CodProd	=	0
	BEGIN
		UPDATE	Produtos	
		SET	Preco		=	Preco	*	(1 + @PORCEN)
	END
	ELSE
	BEGIN
		UPDATE	Produtos 
		SET	Preco		=	Preco	*	(1 + @PORCEN)
		WHERE	CodProd		=	@CodProd	
	END


	EXEC	aumenta_preco	2, 0.15  
	GO


/* 4 - Crie a stored procedure 'diminui_preco' que dado um código de
produto e um percentual, diminua o valor do mesmo na quantidade do
percentual fornecido. Se nenhum código for informado todos os produtos
serão alterados. Obs. o percentual deve ser informado em forma decimal, por
exemplo 10% deve ser indicado como 0.1 */
CREATE	PROCEDURE diminui_preco
(
@CodProd	INT	=	0,
@PORCEN 	FLOAT		=	0
)
WITH 
ENCRYPTION 
AS

	IF	@CodProd	=	0
	BEGIN
		UPDATE	Produtos	
		SET	Preco		=	Preco	/	(1 + @PORCEN )
	END
	ELSE
	BEGIN
		UPDATE	Produtos 
		SET	Preco		=	Preco	/	(1 + @@PORCEN )
		WHERE	CodProd		=	@CodProd	
	END


	EXEC	diminui_preco	2, 0.2  
	GO

/* 5 - Crie a stored procedure 'exclui_produto' que dado um código de
produto exclua o mesmo */
CREATE	PROCEDURE exclui_produto
(
@CodProd	INT		=	0
)
WITH 
ENCRYPTION 
AS

	IF	@CodProd	>	0
	BEGIN
		DELETE	
		FROM	Produtos	
		WHERE	CodProd		=	@CodProd
	END
	ELSE	PRINT('Erro ao tentar apagar produto')

	EXEC	exclui_produto	0
	GO

/* 6 - Crie a stored procedure 'altera_produto' que dado um código de
produto e uma descrição, altere a descrição desse produto */
 CREATE	PROCEDURE altera_produto
(
@CodProd		INT	=	0,
@DESCRICAO	    VARCHAR(40)
)
WITH 
ENCRYPTION 
AS
	IF	@CodProd	>	0
	BEGIN
		UPDATE	Produtos
		SET	    Descr		=	@DESCRICAO		
		WHERE	CodProd		=	@CodProd
	END
	ELSE	PRINT('Erro ao tentar alterar produto')

	EXEC	altera_produto	10, 'Parafuso'
	GO


/* 7 - Crie a stored procedure 'exclui_pedido' que dado um número de
pedido exclua o mesmo e seu detalhe */
CREATE	PROCEDURE exclui_pedido
(
@CodPED 	INT = 0
)
WITH 
ENCRYPTION 
AS

	IF	@CodPED	>	0
	BEGIN
		DELETE	
		FROM	Pedidos	
		WHERE	NumPed		=	@CodPED

		DELETE	
		FROM	DetalhesPed	
		WHERE	NumPed		=	@CodPED
	END
	ELSE	PRINT('Erro ao tentar apagar produto')

	EXEC	exclui_pedido	5
	GO


/* 8 - Crie a stored procedute 'funcionarios_cargo' que dado um cargo
retorne todos os funcionários que tenham esse cargo */
CREATE	PROCEDURE funcionarios_cargo
(
@CARGO	VARCHAR(255)
)
WITH 
ENCRYPTION 
AS

	IF	@CARGO		IS NOT NULL
	BEGIN
		SELECT	* 
		FROM	Funcionarios
		WHERE	CARGO	LIKE	'%'+ @CARGO	 +'%'
	END
	ELSE	PRINT(' Erro ao tentar buscar funcionários')

	EXEC	funcionarios_cargo	'Representante de Vendas'


/* 9 - Crie a stored procedure 'aumenta_salario' que dado um código de
funcionário e um percentual, aumente o valor do salário do funcionário 
na quantidade do percentual fornecido. 
Se nenhum código for informado todos os salários serão alterados. */
CREATE PROCEDURE aumenta_salario
(
@Codfunc	INT		=	0,
@PORCEN 	FLOAT		=	0
)
WITH 
ENCRYPTION 
AS
		UPDATE	Funcionarios	
		SET	Salario		=	Salario	*	(1 + @PORCEN )
		WHERE	CodFun		=	@Codfunc


	EXEC	aumenta_salario	5, 0.10  
	GO
	
/* 10 - Crie a stored procedure 'clientes_cidade' que dada uma cidade
retorne todos os clientes desta cidade */
CREATE	PROCEDURE clientes_cidade
(
@CIDADE	VARCHAR(255)
)
WITH 
ENCRYPTION 
AS

	IF	@CIDADE	IS NOT NULL
	BEGIN
		SELECT	* 
		FROM	Clientes
		WHERE	Cidade	LIKE	'%'+ @CIDADE +'%'
	END
	ELSE	PRINT('Erro ao buscar cidades')

	EXEC	clientes_cidade 'Berlin'
