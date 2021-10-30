 CREATE VIEW top_2_hits_do_momento AS
   SELECT 
     M.`nome_musica` AS `cancao`, 
     COUNT(HR.`usuario_id`) AS `reproducoes`
   FROM SpotifyClone.historico_reproducoes AS HR
   JOIN SpotifyClone.musicas AS M  ON M.`musica_id` = HR.`musica_id`
   GROUP BY `cancao`
   ORDER BY `reproducoes` DESC, `cancao`
   LIMIT 2;
   