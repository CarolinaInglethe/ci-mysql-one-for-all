DELIMITER $$
CREATE PROCEDURE albuns_do_artista ( IN nome_artista_param VARCHAR(100))
BEGIN
  SELECT A.`nome_artista` AS `artista`, AL.`nome_album` AS `album`
    FROM SpotifyClone.artistas AS A
    JOIN SpotifyClone.albums  AS AL   ON AL.`artista_id` = A.`artista_id`
     WHERE A.`nome_artista` = nome_artista_param
  ORDER BY `album`;
END $$
DELIMITER ;
