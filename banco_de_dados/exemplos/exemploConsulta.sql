-- Caso queira consultar os dados de uma pessoa pelo usuário, deve ser feito:
USE Farmacia;

SELECT usuario.*, pessoa.*
FROM usuario
INNER JOIN pessoa ON usuario.ID_Pessoa = 1

