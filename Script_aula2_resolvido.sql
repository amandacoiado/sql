/*
 SQL - Aula 01
 17/04/2024
 */

-- anotação

/* --------------------------------------------------------
 * 1ª parte - Visualizar tabelas
 * --------------------------------------------------------*/

/* 1) Visualizar todo o conteúdo da tabela Cidades */
SELECT * FROM Cidades c; 



/* 2) Visualizar todo o conteúdo da tabela Estados */
SELECT * FROM estados;



/* 3) Visualizar os 100 primeiros registros da tabela Clientes */
SELECT * 
FROM [Clientes] c 
LIMIT 100;



/* 4) Visualizar os campos cliente_id, nome, endereco e cidade_id da tabela Clientes */
SELECT [cliente_id] , [nome] , [endereco] , [cidade_id]  
FROM [Clientes] c;



/* 5) Ordenar a tabela Clientes pelo Nome de forma crescente */
SELECT [cliente_id] , [nome] , [endereco] , [cidade_id]  
FROM [Clientes] c
ORDER BY C.[nome] ;



/* 6) Ordenar a tabela Clientes pelo Nome de forma decrescente */
SELECT [cliente_id] , [nome] , [endereco] , [cidade_id]  
FROM [Clientes] c
ORDER BY C.[nome] DESC ;


SELECT 
	[cliente_id] , 
	[nome], 
	[endereco] , 
	[cidade_id]  
FROM [Clientes] c
ORDER BY TRANSLATE(nome, 'áàâãéèêíìîóôõúùûçÁÀÂÃÉÈÊÍÌÎÓÔÕÚÙÛÇ', 'aaaaeeeiiioooouuucAAAAEEEIIIOOOUUUC') DESC ;





/*
 SQL - Aula 02
 24/04/2025
 */


/* --------------------------------------------------------
 * 2ª parte - Agregações - Perguntando para os dados 
 * --------------------------------------------------------*/


/* 1) Quantas agências existem no Banco Ramos? */
SELECT COUNT(*) FROM [Agencias] a ;
-- Resultado: 60

/* 2) Quantas contas existem no Banco Ramos? */
SELECT COUNT(*) FROM [Contas] ;
-- Resultado: 184



/* 3) Quantas contas ativas existem no Banco Ramos? */
SELECT COUNT(*) AS QTDE_CONTAS_ATIVAS
FROM [Contas] c 
WHERE [conta_ativa] = TRUE;

-- Resposta: 169



/* 4) Exite algum número de conta repetido? */
SELECT COUNT(DISTINCT [numero_conta])
FROM [Contas] c ;
-- Resposta: sim, existe 1 número




/* 5) Quantas agências possuem contas ativas?*/
SELECT count(distinct[numero_agencia] ) AS qtde_agencias_com_contas_ativas
FROM [Contas] c
WHERE conta_ativa = true;

-- Resposta: 31


/* 6) Quantos clientes possuem cadastro no Banco Ramos? */
SELECT count(*) AS qtde_clientes 
FROM clientes;

-- Resposta: 144



/* 7) Quantos clientes possuem contas ativas? */
SELECT COUNT(DISTINCT[cliente_id] ) AS QTDE_CLIENTES
FROM [Contas] c 
WHERE c.[conta_ativa] = TRUE;

-- Resposta: 132

/* 8) Quantos clientes possuem contas inativas? */
SELECT COUNT(DISTINCT[cliente_id] ) AS QTDE_CLIENTES_CON_CONTAS_INATIVAS
FROM [Contas] c 
WHERE c.[conta_ativa] = false;

-- Resposta: 15

/* 9) Quantos registros de transações há? */
SELECT COUNT(*) AS QTDE_TRANSACOEST
FROM [Transacoes] t ;

-- Resposta: 19.884



/* 10) Quantas registros de transações há no ano de 2024? */
SELECT * FROM TRANSACOES;

-- usando a data completa
SELECT COUNT(*) AS QTDE_TRANSACOEST
FROM [Transacoes] t 
WHERE T.[data_hora] >= '2024-01-01' AND T.[data_hora] < '2025-01-01';


-- usando BETWEEN
SELECT COUNT(*) AS QTDE_TRANSACOEST
FROM [Transacoes] t 
WHERE T.[data_hora] BETWEEN '2024-01-01' AND '2024-12-31 23:59:59';


-- usando a função YEAR()
SELECT COUNT(*) AS QTDE_TRANSACOEST
FROM [Transacoes] t 
WHERE YEAR(T.[data_hora]) = 2024;

-- Contagem: 19788



-- Resposta: 19788



/* 11) Quantas transações ocorreram em janeiro de 2024? */
-- usando year() e month()
SELECT COUNT(*) AS QTDE_TRANSACOES
FROM [Transacoes] t 
WHERE YEAR(T.[data_hora]) = 2024 AND MONTH(T.[data_hora]) = 1;

-- usando a concatenação de ano e mês
SELECT [transacao_id] , [valor] , [data_hora],
		TO_CHAR([data_hora], 'yyyy-MM') AS ANO_MES
FROM [Transacoes] t
WHERE  TO_CHAR([data_hora], 'yyyy-MM') = '2024-01';


SELECT COUNT(*) AS QTDE_TRANSACOES_JAN_2024
FROM [Transacoes] t
WHERE TO_CHAR([data_hora], 'yyyy-MM') = '2024-01';


-- Resposta: 1937



/* 12) Qual é o valor mínimo, em reais, de transação registrado? */
SELECT MIN([valor] ) AS VALOR_MINIMO 
FROM [Transacoes] t;

-- Resposta: R$ 0,02


/* 13) Qual é o valor máximo, em reais, de transação registrado? */
SELECT MAX([valor] ) AS VALOR_MINIMO 
FROM [Transacoes] t;

-- Resposta: R$ 19.200.000,00



/* 14) Qual o código das transações do tipo Pix? */
SELECT [tipo_transacao_id]
FROM [TiposTransacao] tt 
WHERE lower(TT.[nome_tipo_transacao]) = 'pix';

-- ou

SELECT [tipo_transacao_id]
FROM [TiposTransacao] tt 
WHERE upper(TT.[nome_tipo_transacao]) = 'PIX';

-- ou
SELECT [tipo_transacao_id]
FROM [TiposTransacao] tt 
WHERE upper(TT.[nome_tipo_transacao]) like '%PIX%';

-- Resposta: 11



/* 15) Qual o valor médio, em reais, das transações do tipo Pix? */


-- Resposta: R$ 



/* 16) Qual o valor médio, em reais, das transações do tipo depósito? */
-- Identificar o(s) código(s) dos depósitos



-- calcular a média




-- Resposta: R$



/* 17) Qual o total de tarifas que o Banco Ramos já cobrou? */
-- Identificar o código das tarifas


-- calcular o total




-- Resposta: R$


