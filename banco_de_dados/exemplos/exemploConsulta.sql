-- Caso queira consultar os dados de uma pessoa pelo usuário, deve ser feito:
USE Farmacia;

SELECT usuario.*, pessoa.*
FROM usuario
INNER JOIN pessoa ON usuario.ID_Pessoa = 1

-- Exemplo 2
USE Farmacia;
  
SELECT
    usuario.ID_Usuario,
    pessoa.ID_Pessoa,
    NOME AS nomePessoa,
    CPF,
    produto.ID_Produto,
    NOME_PRODUTO AS nomeProduto,
    QUANTIDADE,
    funcionario.ID_Funcionario
FROM
    item_venda
    INNER JOIN usuario
    INNER JOIN produto
    INNER JOIN funcionario 
    INNER JOIN pessoa ON item_venda.ID_Usuario = 1
   ;

-- Exemplo 3
  SELECT
	funcionario.ID_Funcionario,
    pessoa.NOME
    FROM
	funcionario
    INNER JOIN pessoa ON funcionario.ID_Funcionario = 1;
