/*
 SQL - Aula 01
 mar�o/2025
 */



/* --------------------------------------------------------
 * 1� parte - Visualizar tabelas
 * --------------------------------------------------------*/

/* 1) Visualizar todo o conte�do da tabela Cidades */




/* 2) Visualizar todo o conte�do da tabela Estados */




/* 3) Visualizar os 100 primeiros registros da tabela Clientes */




/* 4) Visualizar os campos cliente_id, nome, endereco e cidade_id da tabela Clientes */




/* 5) Ordenar a tabela Clientes pelo Nome de forma crescente */





/* 6) Ordenar a tabela Clientes pelo Nome de forma decrescente */












/* --------------------------------------------------------
 * 2� parte - Agrega��es - Perguntando para os dados 
 * --------------------------------------------------------*/


/* 1) Quantas ag�ncias existem no Banco Ramos? */




-- Resposta: 



/* 2) Quantas contas existem no Banco Ramos? */




-- Resposta: 



/* 3) Quantas contas ativas existem no Banco Ramos? */




-- Resposta: 



/* 4) Exite algum n�mero de conta repetido? */

-- Resposta: 



/* 5) Quantas ag�ncias possuem contas ativas?*/




-- Resposta: 



/* 6) Quantos clientes possuem cadastro no Banco Ramos? */




-- Resposta: 



/* 7) Quantos clientes possuem contas ativas? */





-- Resposta: 

/* 8) Quantos clientes possuem contas inativas? */





-- Resposta: 

/* 9) Quantos registros de transa��es h�? */





-- Resposta:



/* 10) Quantas registros de transa��es h� no ano de 2024? */

-- usando a data completa





-- usando BETWEEN





-- usando a fun��o YEAR()




-- Contagem



-- Resposta: 



/* 11) Quantas transa��es ocorreram em janeiro de 2024? */
-- usando year() e month()


-- usando a concatena��o de ano e m�s






-- Resposta: 



/* 12) Qual � o valor m�nimo, em reais, de transa��o registrado? */




-- Resposta: R$ 



/* 13) Qual � o valor m�ximo, em reais, de transa��o registrado? */




-- Resposta: R$ 



/* 14) Qual o c�digo das transa��es do tipo Pix? */




-- Resposta: 11



/* 15) Qual o valor m�dio, em reais, das transa��es do tipo Pix? */


-- Resposta: R$ 



/* 16) Qual o valor m�dio, em reais, das transa��es do tipo dep�sito? */
-- Identificar o(s) c�digo(s) dos dep�sitos



-- calcular a m�dia




-- Resposta: R$



/* 17) Qual o total de tarifas que o Banco Ramos j� cobrou? */
-- Identificar o c�digo das tarifas


-- calcular o total




-- Resposta: R$ 6.436,00




/* --------------------------------------------------------
 * 3� parte - Agrupamentos (GROUP BY) - an�lises agregadas 
 * --------------------------------------------------------*/


/* 1) Qual a ag�ncia com maior n�mero de contas ativas? */






-- Resposta: 



/* 2) Identifique quais s�o as contas com n�mero repetido */
-- identificar o n�mero repetido





-- identificar as ag�ncias das contas




-- Resposta: 



/* 3) Qual o dia do ano maior quantidade de transa��es em 2024? */





-- Resposta:

/* 4) Qual o m�s com maior quantidade de transa��es em 2024? */
-- usando year() e month()



-- usar o MONTH() para identificar o m�s de cada linha




-- usar o GROUP BY para contar cada grupamento




-- Resposta: 

/* 5) Qual o dia do m�s com maior quantidade de movimenta��es em 2024? */





-- Resposta: 





/* --------------------------------------------------------
 * 5� parte - Jun��o de Tabelas (JOIN) 
 * --------------------------------------------------------*/
