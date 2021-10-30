 CREATE VIEW historico_reproducao_usuarios AS
      SELECT 
     `nome_usuario` AS `usuario`, 
     `nome_musica` AS `nome`
   FROM SpotifyClone.historico_reproducoes
     JOIN SpotifyClone.usuarios USING (`usuario_id`) 
     JOIN SpotifyClone.musicas USING (`musica_id`) 
   ORDER BY `usuario`, `nome`;
   