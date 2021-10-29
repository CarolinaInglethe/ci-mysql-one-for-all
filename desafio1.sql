DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(100) NOT NULL,
  sobrenome_artista VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(200) NOT NULL
) engine = InnoDB;

CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(200) NOT NULL
) engine = InnoDB;

CREATE TABLE planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(100) NOT NULL,
  valor_plano DECIMAL(5,2) NOT NULL 
) engine = InnoDB;

CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(100) NOT NULL,
  sobrenome_usuario VARCHAR(100) NOT NULL,
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
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  musica_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (album_id, artista_id, musica_id),
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
  FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musicas (musica_id)
) engine = InnoDB;
