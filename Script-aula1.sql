/*
 SQL - Aula 01
 mar�o/2025
 */



/* --------------------------------------------------------
 * 1� parte - Visualizar tabelas
 * --------------------------------------------------------*/

/* 1) Visualizar todo o conte�do da tabela Cidades */

SELECT * FROM CIDADES;

/* 2) Visualizar todo o conte�do da tabela Estados */
SELECT * FROM `Estados`;

/* 3) Visualizar os 100 primeiros registros da tabela Clientes */
SELECT * FROM Clientes LIMIT 100;

/* 4) Visualizar os campos cliente_id, nome, endereco e cidade_id da tabela Clientes */
SELECT
	cliente_id, nome, endereco, cidade_id
FROM Clientes;

/* 5) Ordenar a tabela Clientes pelo Nome de forma crescente */
SELECT
	cliente_id, nome, endereco, cidade_id
FROM Clientes
ORDER BY NOME;

/* 6) Ordenar a tabela Clientes pelo Nome de forma decrescente */
SELECT
	cliente_id, nome, endereco, cidade_id
FROM Clientes
ORDER BY NOME DESC;

-- Retirar os acentos
SELECT
    cliente_id,
    TRANSLATE(nome, '�����������������������������������', 'aaaaeeeeiiioooouuucAAAAEEEIIIOOOUUUC') AS nome_sem_acento,
    endereco,
    cidade_id
FROM Clientes
ORDER BY nome_sem_acento DESC;





/* --------------------------------------------------------
 * 2� parte - Agrega��es - Perguntando para os dados 
 * --------------------------------------------------------*/


/* 1) Quantas ag�ncias existem no Banco Ramos? */
SELECT COUNT(*) FROM `Agencias`;
-- Resposta: 60

/* 2) Quantas contas existem no Banco Ramos? */
SELECT COUNT(*) FROM `Contas`;
-- Resposta: 184

SELECT * FROM `Contas`;

/* 3) Quantas contas ativas existem no Banco Ramos? */
SELECT 
	COUNT(*)
FROM `Contas`
WHERE `conta_ativa` = TRUE;
-- Resposta: 169

/* 4) Exite algum n�mero de conta repetido? */
SELECT count(DISTINCT(`numero_conta`))
FROM `Contas`
WHERE `conta_ativa` = TRUE;
-- Resposta: Sim, pois o total de n�meros distintos deu 168

/* 5) Quantas ag�ncias possuem contas ativas?*/
SELECT 
	count(DISTINCT numero_agencia)
FROM `Contas`
WHERE `conta_ativa` = TRUE;
-- Resposta: 31

/* 6) Quantos clientes possuem cadastro no Banco Ramos? */
SELECT count(*) FROM `Clientes`;
-- Resposta: 144

/* 7) Quantos clientes possuem contas ativas? */
SELECT 
	count(DISTINCT `cliente_id`)
FROM `Contas` 
WHERE `conta_ativa` = TRUE;
-- Resposta: 132

/* 8) Quantos clientes possuem contas inativas? */
SELECT 
	count(DISTINCT `cliente_id`)
FROM `Contas` 
WHERE `conta_ativa` != TRUE;
-- Resposta: 15

/* 9) Quantos registros de transa��es h�? */
SELECT COUNT(*) FROM `Transacoes`;
-- Resposta: 19884

SELECT * FROM `Transacoes`;

/* 10) Quantas registros de transa��es h� no ano de 2024? */

-- usando a data completa
SELECT COUNT(*) 
FROM `Transacoes` 
WHERE `data_hora` >= '2024-01-01' 
	AND `data_hora` <= '2024-12-31 23:59:59';

-- usando BETWEEN
SELECT COUNT(*) 
FROM `Transacoes` 
WHERE `data_hora` BETWEEN '2024-01-01' AND '2024-12-31 23:59:59';

-- usando a fun��o YEAR()
SELECT 
	`transacao_id`, `valor`, `data_hora`, YEAR(`data_hora`) AS ANO
FROM `Transacoes`;

-- Contagem
SELECT COUNT(*) 
FROM `Transacoes` 
WHERE YEAR(`data_hora`) = 2024;
-- Resposta: 19788

/* 11) Quantas transa��es ocorreram em janeiro de 2024? */
SELECT COUNT(*) FROM `Transacoes` WHERE YEAR(`data_hora`) = 2024 AND MONTH(`data_hora`) = 1;

-- usando a concatena��o de ano e m�s
SELECT 
	`transacao_id`, 
	`valor`, 
	`data_hora`, 
	TO_CHAR(data_hora, 'yyyy-MM') AS ANO_MES 
FROM `Transacoes` 
WHERE TO_CHAR(data_hora, 'yyyy-MM') = '2024-01';
-- Resposta: 1937

/* 12) Qual � o valor m�nimo, em reais, de transa��o registrado? */
SELECT MIN(valor) FROM `Transacoes`;
-- Resposta: R$ 0,02

/* 13) Qual � o valor m�ximo, em reais, de transa��o registrado? */
SELECT max(valor) FROM `Transacoes`;
-- Resposta: R$ 19.200.000,00

SELECT * FROM TiposTransacao;

/* 14) Qual o c�digo das transa��es do tipo Pix? */
SELECT * FROM `TiposTransacao` WHERE lower(`nome_tipo_transacao`) = 'pix';
-- Resposta: 11

/* 15) Qual o valor m�dio, em reais, das transa��es do tipo Pix? */
SELECT round(AVG(valor),2) FROM `Transacoes` WHERE `tipo_transacao_id` = 11;
-- Resposta: 1.249,45

/* 16) Qual o valor m�dio, em reais, das transa��es do tipo dep�sito? */
-- Identificar o(s) c�digo(s) dos dep�sitos
SELECT * FROM `TiposTransacao` WHERE lower(`nome_tipo_transacao`) like 'dep�sito%';

-- calcular a m�dia
SELECT round(AVG(valor),2) 
FROM `Transacoes` 
WHERE `tipo_transacao_id` = 1 OR tipo_transacao_id = 2;
-- Resposta: 167.742,19

/* 17) Qual o total de tarifas que o Banco Ramos j� cobrou? */
-- Identificar o c�digo das tarifas
SELECT * FROM `TiposTransacao` WHERE lower(`nome_tipo_transacao`) = 'tarifa';

-- calcular o total
SELECT SUM(valor) FROM `Transacoes` WHERE `tipo_transacao_id` = 8;
-- Resposta: 6.436,00




/* --------------------------------------------------------
 * 3� parte - Agrupamentos (GROUP BY) - an�lises agregadas 
 * --------------------------------------------------------*/


/* 1) Qual a ag�ncia com maior n�mero de contas ativas? */
SELECT `numero_agencia`, COUNT(*) AS QTDE
FROM `Contas`
WHERE `conta_ativa` = TRUE
GROUP BY `numero_agencia`
ORDER BY QTDE DESC;
-- Resposta: ag�ncia 5678-9, com 48 contas ativas

/* 2) Identifique quais s�o as contas com n�mero repetido */
-- identificar o n�mero repetido
SELECT `numero_conta`, count(`numero_conta`) AS QTDE FROM `Contas`
GROUP BY `numero_conta`
ORDER BY QTDE DESC;

-- identificar as ag�ncias das contas
SELECT `numero_agencia`, `numero_conta` 
FROM `Contas` 
WHERE `numero_conta` = '90123-4';
-- Resposta: conta n�mero 90123-4 das ag�ncias 5432-1 e 6363-1


/* 3) Qual o dia do ano maior quantidade de transa��es em 2024? */
SELECT TO_CHAR(`data_hora`, 'yyyy-MM-DD'), count(*) AS QTDE
FROM `Transacoes`
WHERE YEAR(`data_hora`) = 2024
GROUP BY TO_CHAR(`data_hora`, 'yyyy-MM-DD')
ORDER BY QTDE DESC;
-- Resposta: empatado entre os dias 15/12 e 18/12, ambos com 97 transa��es

/* 4) Qual o m�s com maior quantidade de transa��es em 2024? */
SELECT COUNT(*) FROM `Transacoes` WHERE YEAR(`data_hora`) = 2024 AND MONTH(`data_hora`) = 1;

-- usar o MONTH() para identificar o m�s de cada linha
SELECT `transacao_id`, `valor`, `data_hora`, MONTH(`data_hora`) AS MES
FROM `Transacoes`
WHERE YEAR(`data_hora`) = 2024;

-- usar o GROUP BY para contar cada grupamento
SELECT MONTH(`data_hora`) AS MES, count(*) AS QTDE
FROM `Transacoes`
WHERE YEAR(`data_hora`) = 2024
GROUP BY MONTH(`data_hora`)
ORDER BY QTDE DESC;
-- Resposta: dezembro, com 2.255 transa��es

/* 5) Qual o dia do m�s com maior quantidade de movimenta��es em 2024? */
SELECT DAY(`data_hora`) AS DIA, count(*) AS QTDE
FROM `Transacoes`
WHERE YEAR(`data_hora`) = 2024
GROUP BY DAY(`data_hora`)
ORDER BY QTDE DESC;
-- Resposta: dia 18





/* --------------------------------------------------------
 * 5� parte - Jun��o de Tabelas (JOIN) 
 * --------------------------------------------------------*/


/* 1) Liste as cidades com seus respectivos estados */
-- visualizar astabelas separadamente:
SELECT * FROM `Cidades`;
SELECT * FROM `Estados`;

-- verifique a quantidade de cada Tabela:
-- Cidades: 141
-- Estados: 27

-- juntar as duas usando INNER JOIN:
SELECT *
FROM `Cidades` a
	JOIN `Estados` b
		ON a.`estado_id` = b.`estado_id`;
-- registros resultantes: 141

-- juntar as duas usando LEFT JOIN:
SELECT *
FROM `Cidades` a
	LEFT JOIN `Estados` b
		ON a.`estado_id` = b.`estado_id`;
-- registros resultantes: 141

-- juntar as duas usando RIGHT JOIN:
SELECT *
FROM `Cidades` a
	RIGHT JOIN `Estados` b
		ON a.`estado_id` = b.`estado_id`;
-- registros resultantes: 141
	
-- juntar as duas usando FULL OUTER JOIN:
SELECT *
FROM `Cidades` a
	FULL OUTER JOIN `Estados` b
		ON a.`estado_id` = b.`estado_id`;
-- registros resultantes: 141
	


	
/* 2) Quantas ag�ncias h� por Cidade? */
-- visualizar as tabelas individualmente:
SELECT * FROM `Agencias`;
-- Ag�ncias: 60
SELECT * FROM `Cidades`;
-- Cidades:  141

-- juntar as duas usando INNER JOIN:
SELECT *
FROM `Agencias`a
	JOIN `Cidades`b
		ON a.`cidade_id` = b.`cidade_id`;
-- Registros: 60
	
-- juntar as duas usando LEFT JOIN:
SELECT *
FROM `Agencias`a
	LEFT JOIN `Cidades`b
		ON a.`cidade_id` = b.`cidade_id`;
-- Registros: 60
-- Todas as Ag�ncias possuem Cidades cadastradas

-- juntar as duas usando RIGHT JOIN:
SELECT *
FROM `Agencias`a
	RIGHT JOIN `Cidades`b
		ON a.`cidade_id` = b.`cidade_id`;
-- Registros: 184
-- Nem todas as cidades possuem Ag�ncias cadastradas
	
-- juntar as duas usando FULL OUTER JOIN:
SELECT *
FROM `Agencias`a
	FULL OUTER JOIN `Cidades`b
		ON a.`cidade_id` = b.`cidade_id`;
-- Registros: 184
-- Corresponde ao maior n�mero de jun��es poss�veis entre as tabelas

-- Calcular a quantidade de ag�ncias por Cidade
SELECT b.`nome_cidade`, count(*) AS QTDE
FROM `Agencias`a
	FULL OUTER JOIN `Cidades`b
		ON a.`cidade_id` = b.`cidade_id`
GROUP BY b.`nome_cidade`
ORDER BY QTDE DESC;	


/* 3) Qual a quantidade de Clientes cadastrados por Cidade? */
-- visualizar as tabelas separadamente:
SELECT * FROM `Cidades`;
SELECT * FROM `Clientes`;

-- Fazer o c�lculo e jun��o:
SELECT a.cidade_id, b.`nome_cidade`, count(*) AS QTDE
FROM `Clientes` a
	LEFT JOIN `Cidades` b
		ON a.`cidade_id` = b.`cidade_id` 
GROUP BY a.`cidade_id`, b.`nome_cidade`
ORDER BY QTDE DESC;


/* 4) Quantas ag�ncias h� por estado? */
-- visualizar as tabelas individualmente:
SELECT * FROM `Agencias`;
SELECT * FROM `Cidades`;
SELECT * FROM `Estados`;

-- fazer a jun��o das duas primeiras:
SELECT * 
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`;

-- fazer a jun��o das tr�s tabelas
SELECT * 
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
	LEFT JOIN `Estados` c ON b.`estado_id` = c.`estado_id`;

-- fazer o c�lculo e deixar apenas os atributos necess�rios:
SELECT c.`uf`, count(`numero_agencia`) AS QTDE 
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
	LEFT JOIN `Estados` c ON b.`estado_id` = c.`estado_id`
GROUP BY c.uf
ORDER BY QTDE DESC;
	

/* 5) Liste as ag�ncias do estado de S�o Paulo, trazendo o n�mero da ag�ncia 
 * com d�gito (XXXX-X), o nome da ag�ncia e a cidade de localiza��o: */
-- filtrar as ag�ncias do estado de SP
SELECT a.`numero_agencia`, a.`digito_agencia`, a.`nome_agencia`, b.`nome_cidade`
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
	LEFT JOIN `Estados` c ON b.`estado_id` = c.`estado_id`
WHERE c.`uf` = 'SP';

-- juntar ag�ncia e d�gito
SELECT
	CONCAT(TO_CHAR(a.`numero_agencia`), '-', TO_CHAR(a.`digito_agencia`)), 
	a.`nome_agencia`, 
	b.`nome_cidade`
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
	LEFT JOIN `Estados` c ON b.`estado_id` = c.`estado_id`
WHERE c.`uf` = 'SP';

-- outra forma
SELECT
	RIGHT (('0000' || a.`numero_agencia`), 4) || '-' || a.`digito_agencia`, 
	a.`nome_agencia`, 
	b.`nome_cidade`
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
	LEFT JOIN `Estados` c ON b.`estado_id` = c.`estado_id`
WHERE c.`uf` = 'SP';

-- fazer a mesma consulta de forma mais enxuta:
SELECT
	RIGHT (('0000' || a.`numero_agencia`), 4) || '-' || a.`digito_agencia` AS agencia, 
	a.`nome_agencia`, 
	b.`nome_cidade`
FROM `Agencias` a
	LEFT JOIN `Cidades` b ON a.`cidade_id` = b.`cidade_id`
WHERE b.`estado_id` = 25
ORDER BY a.`numero_agencia`;


-- Qual a Cidade de localiza��o da Ag�ncia com maior n�mero de contas ativas?

-- Qual o tipo de transa��o com maior n�mero de registros?

-- Qual o o tipo de local com maior n�mero de registros?

-- Qual o cliente com maior n�mero de transa��es (tanto de destino quanto de origem)?

-- Qual a quantidade de Clientes com contas ativas por Cidade?



-- Qual o total de tarifas efetivamente cobradas (excetuando eventuais estornos)?
SELECT * FROM `TiposTransacao` WHERE lower(`nome_tipo_transacao`) = 'estorno';

-- identificar todas as transa��es que foram extornadas
SELECT A.`transacao_referencia_id` 
FROM `Transacoes` A
JOIN `Transacoes` B ON A.`transacao_referencia_id` = B.`transacao_id`
WHERE A.`tipo_transacao_id` = 9;

-- dentre elas, filtrar apenas as que s�o tarifas
SELECT *
FROM `Transacoes`
WHERE `transacao_id` IN (
		SELECT A.`transacao_referencia_id` 
		FROM `Transacoes` A
			JOIN `Transacoes` B ON A.`transacao_referencia_id` = B.`transacao_id`
		WHERE A.`tipo_transacao_id` = 9
	)
	AND `tipo_transacao_id` = 8;

-- agora somar todos os valores das transa��es do tipo tarifa que N�O est�o nessa lista
SELECT 
	SUM(valor)
FROM `Transacoes`
WHERE `transacao_id` NOT IN (
		SELECT A.`transacao_referencia_id` 
		FROM `Transacoes` A
			JOIN `Transacoes` B ON A.`transacao_referencia_id` = B.`transacao_id`
		WHERE A.`tipo_transacao_id` = 9
	)
	AND `tipo_transacao_id` = 8;
	
-- Resposta: R$ 5.840,36



SELECT * FROM agencias;