DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(200) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(200) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id)
) engine = InnoDB;

CREATE TABLE planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(100) NOT NULL,
  valor_plano DECIMAL(5,2) NOT NULL 
) engine = InnoDB;

CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE historico_reproducoes(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
  FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musicas (musica_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.artistas (`nome_artista`)
VALUES 
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');


INSERT INTO SpotifyClone.albums (`nome_album`, `artista_id`)
VALUES 
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
  INSERT INTO SpotifyClone.musicas (`nome_musica`, `album_id`)
  VALUES
    ('Soul For US', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time FireWorks', 2),
    ('Magic Circus', 3),
    ('Honey,So Do I', 3),
    ('Sweetie, Let\'s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For ME',4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey, Let\s Be Silly', 4),
    ('Thang Of Thunder',5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

INSERT INTO SpotifyClone.planos (`nome_plano`, `valor_plano`)
VALUES 
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
  
INSERT INTO SpotifyClone.usuarios (`nome_usuario`,`idade`, `plano_id`)
VALUES 
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
  
INSERT INTO SpotifyClone.seguindo_artistas (`usuario_id`,`artista_id`)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
INSERT INTO SpotifyClone.historico_reproducoes (`usuario_id`, `musica_id`)
VALUES 
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
