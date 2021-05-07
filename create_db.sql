CREATE DATABASE ecf_bdd -- requête sql pour créer la base
DEFAULT CHARACTER SET utf8 -- requete pou la selection de l'interclassement
DEFAULT COLLATE utf8_general_ci; -- ici on utilisera la version générale case insensitive afin de couvrir la majorité des caratères

USE ecf_bdd;

CREATE TABLE school_year (
    -- crée la table school year avec les champs id name date_start et date_end
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(190) NOT NULL,
    date_start DATETIME,
    date_end DATETIME
    );

CREATE TABLE usr (
    -- crée la table usr avec les champs id email roles password firstname lastname phone et school_year_id
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email VARCHAR(190) NOT NULL,
    roles TEXT NOT NULL,
    password VARCHAR(190) NOT NULL,
    firstname VARCHAR(190) NOT NULL,
    lastname VARCHAR(190) NOT NULL,
    phone VARCHAR(20),
    school_year_id INT UNSIGNED,
    FOREIGN KEY (school_year_id) REFERENCES school_year(id)
);

CREATE TABLE project (
    -- créé la table project avec les champs id name et description
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(190) NOT NULL,
    description TEXT
);

CREATE TABLE project_usr (
    -- créé la table project_usr faisant office de table de transit entre project et usr afin de pouvoir créer une relation many to many entre ces deux tables
    project_id INT UNSIGNED,
    usr_id INT UNSIGNED,
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (usr_id) REFERENCES usr(id)
);

