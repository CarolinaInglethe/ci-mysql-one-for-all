 CREATE VIEW historico_reproducao_usuarios AS
      SELECT 
     U.`nome_usuario` AS `usuario`, 
     M.`nome_musica` AS `nome`
   FROM SpotifyClone.historico_reproducoes AS HR
     JOIN SpotifyClone.usuarios AS U  ON U.`usuario_id` = HR.`usuario_id`
     JOIN SpotifyClone.musicas AS M   ON M.`musica_id` = HR.`musica_id`
   ORDER BY `usuario`, `nome`;
   