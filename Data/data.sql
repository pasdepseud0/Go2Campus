-- Schema mydb (PostgreSQL)
CREATE SCHEMA IF NOT EXISTS mydb;
SET search_path TO mydb;

-- Table role
CREATE TABLE IF NOT EXISTS role (
    id_role INT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL
    );

-- Table statut
CREATE TABLE IF NOT EXISTS statut (
    id_statut INT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL
    );

-- Table utilisateur
CREATE TABLE IF NOT EXISTS utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    discord VARCHAR(100),
    role_id_role INT NOT NULL,
    statut_id_statut INT NOT NULL,
    CONSTRAINT fk_utilisateur_role
    FOREIGN KEY (role_id_role)
    REFERENCES role (id_role),
    CONSTRAINT fk_utilisateur_statut
    FOREIGN KEY (statut_id_statut)
    REFERENCES statut (id_statut)
    );

-- Table déstination
CREATE TABLE IF NOT EXISTS distination (
    id_distination INT PRIMARY KEY,
    nom VARCHAR(10) NOT NULL
    );

-- Table trajet
CREATE TABLE IF NOT EXISTS trajet (
    id_trajet SERIAL PRIMARY KEY,
    lieux VARCHAR(120) NOT NULL,
    date TIMESTAMP NOT NULL,
    commentaire VARCHAR(255),
    places SMALLINT NOT NULL,
    statut_id_statut INT NOT NULL,
    distination_id_distination INT NOT NULL,
    CONSTRAINT fk_trajet_statut
    FOREIGN KEY (statut_id_statut)
    REFERENCES statut (id_statut),
    CONSTRAINT fk_trajet_distination
    FOREIGN KEY (distination_id_distination)
    REFERENCES distination (id_distination)
    );

-- Table utilisateur_trajet
CREATE TABLE IF NOT EXISTS utilisateur_trajet (
    utilisateur_id_utilisateur INT NOT NULL,
    trajet_id_trajet INT NOT NULL,
    PRIMARY KEY (utilisateur_id_utilisateur, trajet_id_trajet),
    CONSTRAINT fk_utilisateur_trajet_utilisateur
    FOREIGN KEY (utilisateur_id_utilisateur)
    REFERENCES utilisateur (id_utilisateur),
    CONSTRAINT fk_utilisateur_trajet_trajet
    FOREIGN KEY (trajet_id_trajet)
    REFERENCES trajet (id_trajet)
    );

-- Table bloque
CREATE TABLE IF NOT EXISTS bloque (
    utilisateur_id_utilisateur INT NOT NULL,
    utilisateur_id_utilisateur1 INT NOT NULL,
    PRIMARY KEY (utilisateur_id_utilisateur, utilisateur_id_utilisateur1),
    CONSTRAINT fk_bloque_utilisateur1
    FOREIGN KEY (utilisateur_id_utilisateur)
    REFERENCES utilisateur (id_utilisateur),
    CONSTRAINT fk_bloque_utilisateur2
    FOREIGN KEY (utilisateur_id_utilisateur1)
    REFERENCES utilisateur (id_utilisateur)
    );
