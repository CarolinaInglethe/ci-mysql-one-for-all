 CREATE VIEW top_3_artistas AS
   SELECT 
     A.`nome_artista` AS `artista`, 
     COUNT(SA.`usuario_id`) AS `seguidores`
   FROM SpotifyClone.seguindo_artistas AS SA
   JOIN SpotifyClone.artistas AS A  ON A.`artista_id` = SA.`artista_id`
   GROUP BY `artista`
   ORDER BY `seguidores` DESC, `artista`
   LIMIT 3;
   