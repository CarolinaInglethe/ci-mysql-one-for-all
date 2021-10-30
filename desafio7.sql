 CREATE VIEW  perfil_artistas AS
    SELECT 
     A.`nome_artista` AS `artista`, 
     AL.`nome_album` AS `album`,
    COUNT(SA.`usuario_id`) AS `seguidores`
   FROM SpotifyClone.albums AS AL
   JOIN SpotifyClone.artistas AS A   ON A.`artista_id` = AL.`artista_id`
   JOIN SpotifyClone.seguindo_artistas AS SA   ON SA.`artista_id` = A.`artista_id`
   GROUP BY `artista`, `album`
   ORDER BY `seguidores` DESC, `artista`, `album`;
   