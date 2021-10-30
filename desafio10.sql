DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (codigo_pessoa_param INT)
RETURNS INT READS SQL DATA 
BEGIN
DECLARE resultado INT;
  SELECT COUNT(`musica_id`)
   FROM SpotifyClone.historico_reproducoes
   WHERE `usuario_id` = codigo_pessoa_param
   GROUP BY `usuario_id`
  INTO resultado;
  RETURN resultado;
END $$
DELIMITER ;
