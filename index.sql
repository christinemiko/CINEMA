/* BASE DE DONNEES cinemaCHRISTINE*/
CREATE DATABASE cinemachristine;
USE cinemachristine;

/* TABLE UTILISATEURS*/
CREATE TABLE utilisateurs (
    id_utilisateurs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nom VARCHAR (30) NOT NULL,
    Prenom VARCHAR (30)NOT NULL,
    Adresse VARCHAR (255),
    Email VARCHAR (30) NOT NULL,
    Motdepasse VARCHAR (50) NOT NULL,
    Telephone INT (15),
    Cinema_favoris VARCHAR (255),
    Ajout_seance VARCHAR (255)
    ) ENGINE=InnoDB;

/* INSERTION INFORMATIONS DANS TABLE UTILISATEURS*/
INSERT INTO utilisateurs (Nom, Prenom, Adresse, Email, Motdepasse, telephone, cinema_favoris,Ajout_seance) VALUES ('Persey', 'Stéphanie','649 rue saint supplice Paris 75006', 'cpersey0@icq.com',"$2y$10$s1.gPhSf5nmoQCN.yZ5Jx.bsBwbtW1HlWMQZFTon4XVaD17lZdr7m",'06 18 66 58 41','cinemaODEON','Inception');
INSERT INTO utilisateurs (Nom, Prenom, Adresse, Email, Motdepasse, telephone, cinema_favoris,Ajout_seance) VALUES ('Durand', 'Nicolas',' 47 rue du bonheur Paris 75004', 'Ndurand@icq.com',"$2y$10$4D356OGyqa5mF03CDAAkEO40.U9iZSvro0NBCgAb0DH9mSq3Lw24y",'06 22 57 41 00','cinemaBASTILLE','Inception');
INSERT INTO utilisateurs (Nom, Prenom, Adresse, Email, Motdepasse, telephone, cinema_favoris,Ajout_seance) VALUES ('Martin', 'Corinne','10 rue royale Paris 75001', 'cmartin0@icq.com',"$2y$10$aBojIE0STi1Lj6JM5Zvmx.0vjHNad2n9SBX1k1eCUf3lHk3Oap6na",'06 21 45 87 99','cinemaCHAMPSELYSEES','In the mood for Love');
INSERT INTO utilisateurs (Nom, Prenom, Adresse, Email, Motdepasse, telephone, cinema_favoris,Ajout_seance) VALUES ('Nguyen', 'Jade','52 rue de choisy Paris 75013', 'nguyenjade@icq.com',"$2y$10$HZxtah3IA9QKgVghWIJf..MMOXUPZooFs.Iprj.6XSG/A1teYzzyy",'06 03 47 51 69','cinemaLESHALLES','Benjamin Button');
INSERT INTO utilisateurs (Nom, Prenom, Adresse, Email, Motdepasse, telephone, cinema_favoris,Ajout_seance) VALUES ('Pascale', 'Corentin','74 rue des abesses Paris 75018', 'corentinpascale@icq.com',"$2y$10$s/kXzkATxQi9ZdBP6PK3zueBgBlwWeyLBtOQHNBiTuGM1.1mZ8TYG",'06 10 68 27 41','cinemaOdeon','Le seigneur des Anneaux');

/* SELECTIONNE DES UTILISATEURS PAR CINEMA POUR AJOUTER UNE SEANCE */
SELECT DISTINCT Nom, Prenom FROM utilisateurs ORDER BY cinemafavoris, Ajoutseance;

/* TABLE SALLES*/
CREATE TABLE salles (
    id_salles INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nom_sallecinema VARCHAR (30)NOT NULL,
    Reference_salle INT (5),
    PlaceTotal_disponible INT (255)
    ) ENGINE=InnoDB;

/* INSERTION INFORMATIONS DANS TABLE SALLES*/
INSERT INTO salles (Nom_sallecinema, Reference_salle, PlaceTotal_disponible) VALUES ('Cinémachristine ODEON', 'salle1', '155');
INSERT INTO salles (Nom_sallecinema, Reference_salle, PlaceTotal_disponible) VALUES ('Cinémachristine BASTILLE', 'salle2', '100');
INSERT INTO salles (Nom_sallecinema, Reference_salle, PlaceTotal_disponible) VALUES ('Cinémachristine LESHALLES', 'salle3', '220');
INSERT INTO salles (Nom_sallecinema, Reference_salle, PlaceTotal_disponible) VALUES ('Cinémachristine CHAMPSELYSEES', 'salle4', '300');

/* TABLE CINEMAS*/
CREATE TABLE cinemas (
    id_cinemas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nom_cinema VARCHAR (30) NOT NULL,
    Adresse VARCHAR (255),
    Email VARCHAR (30),
    Telephone INT (15),
    id_salles INT,
    CONSTRAINT FK_cinemas_salles FOREIGN KEY (id_salles) REFERENCES salles (id_salles)
    ) ENGINE=InnoDB;

ALTER TABLE cinemas
ADD FOREIGN KEY (id_salles) REFERENCES salles (id_salles);

/* INSERTION INFORMATIONS DANS TABLE CINEMAS*/
INSERT INTO cinemas (Nom_cinema, Adresse, Email, Telephone) VALUES ('Cinémachristine ODEON', '20 rue des étoiles Paris 75004', 'cinemachristine@odeon.com','01 43 07 52 48');
INSERT INTO cinemas (Nom_cinema, Adresse, Email, Telephone) VALUES ('Cinémachristine BASTILLE', '168 rue du faubourg saint Antoine Paris 75003', 'cinemachristine@bastille.com','01 42 07 57 22');
INSERT INTO cinemas (Nom_cinema, Adresse, Email, Telephone) VALUES ('Cinémachristine LESHALLES', '4 rue du paradis Paris 75002', 'cinemachristine@leshalles.com','01 42 25 11 02');
INSERT INTO cinemas (Nom-cinema, Adresse, Email, Telephone) VALUES ('Cinémachristine CHAMPSELYSEES', '78 rue montaigne Paris 75001', 'cinemachristine@champselysees.com','01 43 80 78 06');

/* TABLE SEANCE*/
CREATE TABLE seance (
    id_seance INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Film VARCHAR (255) NOT NULL,
    Date DATE,
    Horaire TIME,
    Adresse VARCHAR (255),
    Seance_placedisponible INT (255),
    id_utilisateurs INT,
    CONSTRAINT FK_seance_utilisateurs FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs),
    id_cinemas INT,
    CONSTRAINT FK_seance_cinemas FOREIGN KEY (id_cinemas) REFERENCES cinemas (id_cinemas),
    id_salles INT,
    CONSTRAINT FK_seance_salles FOREIGN KEY (id_salles) REFERENCES salles (id_salles)
    ) ENGINE=InnoDB;

ALTER TABLE seance
ADD FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs);
ALTER TABLE seance
ADD FOREIGN KEY (id_cinemas) REFERENCES cinemas (id_cinemas);
ALTER TABLE seance
ADD FOREIGN KEY (id_salles) REFERENCES salles (id_salles);

/* INSERTION INFORMATIONS DANS TABLE SEANCE*/
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('In the Mood for Love', '2022-10-05', '12:00','cinema ODéon 20 rue des étoiles Paris 75004','150');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Inception', '2022-10-05', '14:00','cinema LesHalles 4 rue du paradis Paris 75001','214');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Le seigneur des anneaux', '2022-10-05',: '19:00','cinema ChampsElysees 78 rue montaigne Paris 75001','55');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Benjamin Button', '2022-10-05', '20:00','cinema ODéon 20 rue des allées Paris 75003', '117');

INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('In the Mood for Love', '2022-10-06', '18:00','cinema Bastille 168 rue du faubourg saint Antoine Paris 75003','120');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Inception', '2022-10-06', '20:00','cinema LesHalles 4 rue du paradis Paris 75001', '180');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Le seigneur des anneaux', '2022-10-06', '14:00','cinema ChampsElysees 78 rue montaigne Paris 75001', '230');
INSERT INTO seance (Film, Date, Horaire, Adresse, Seance_placedisponible) VALUES ('Benjamin Button', '2022-10-06', '19:00','cinema ODéon 20 rue des allées Paris 75003', '48');

/* TABLE ADMIN*/
CREATE TABLE administrateurs (
    id_administrateurs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nom VARCHAR (30) NOT NULL,
    Prenom VARCHAR (30) NOT NULL,
    Email VARCHAR (30) NOT NULL,
    Motdepasse VARCHAR (50) NOT NULL,
    Ajout_seance_cinema VARCHAR (255),
    Supprimer_seance_cinema VARCHAR (255),
    id_seance INT,
    CONSTRAINT FK_administrateurs_seance FOREIGN KEY (id_seance) REFERENCES seance (id_seance)
    ) ENGINE=InnoDB;

ALTER TABLE administrateurs
ADD FOREIGN KEY (id_seance) REFERENCES seance (id_seance);

/* INSERTION INFORMATIONS DANS TABLE ADMIN*/
INSERT INTO administrateurs (Nom, Prenom, Email, Motdepasse, Ajout_seance_cinema, Supprimer_seance_cinema) VALUES ('Dupont', 'Mathieu', 'DupontMathieu@icq.com',"$2y$10$gA1kIFvPB2rL26hfXgWUt.3YgF2jJTOIdIDABF0kaifvTE5aGkNvu",'Ajouter film Inception au cinema ODEON le 2022/12/11 à 14:00', 'Supprimer film Benjamin Button au Cinema Odeon le 2022/12/11 à 12:00');
INSERT INTO administrateurs (Nom, Prenom, Email, Motdepasse, Ajout_seance_cinema, Supprimer_seance_cinema) VALUES ('Fuella', 'Marina', 'Marina.Fuella@icq.com',"$2y$10$gA1kIFvPB2rL26hfXgWUt.3YgF2jJTOIdIDABF0kaifvTE5aGkNvu",'Ajouter film IN THE MOOD FOR LOVE au cinema LESHALLES le 2022/10/25 à 09:00', 'Supprimer Les seigneur des Anneaux au Cinema LES HALLES le 2022/10/25 à 12:00');
INSERT INTO administrateurs (Nom, Prenom, Email, Motdepasse, Ajout_seance_cinema, Supprimer_seance_cinema) VALUES ('Smith', 'John', 'SmithJohn@icq.com',"$2y$10$aBojIE0STi1Lj6JM5Zvmx.0vjHNad2n9SBX1k1eCUf3lHk3Oap6na",'Ajouter Film In the mood for love au cinema CHAMPS ELYSEES le 2022/09/02 à 11:00', 'Supprimer Inception au cinema CHAMPS ELYSEES le 2022/09/02 à 09:00');


/* DONNE TOUS LES DROITS AUX ADMINISTRATEURS avec ladresse IP de leur PC respectifs*/
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.%'  IDENTIFIED BY 'some_characters'  WITH GRANT OPTION; 
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.167.1.%'  IDENTIFIED BY 'some_characters'  WITH GRANT OPTION; 
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.165.1.%'  IDENTIFIED BY 'some_characters'  WITH GRANT OPTION; 
FLUSH PRIVILEGES;

/* TABLE TARIFS*/
CREATE TABLE tarifs (
    id_tarifs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Tarif_Adult FLOAT,
    Tarif_Etudiant FLOAT,
    Tarif_Enfant FLOAT,
    id_utilisateurs INT,
    CONSTRAINT FK_tarifs_utilisateurs FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs),
    id_seance INT,
    CONSTRAINT FK_tarifs_seance FOREIGN KEY (id_seance) REFERENCES seance (id_seance)
    ) ENGINE=InnoDB;

ALTER TABLE tarifs
ADD FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs);
ALTER TABLE tarifs
ADD FOREIGN KEY (id_seance) REFERENCES seance (id_seance);

    /* INSERTION INFORMATIONS DANS TABLE TARIFS*/
INSERT INTO tarifs (Tarif_Adult, Tarif_Etudiant, Tarif_Enfant) VALUES ('9,20€', '7,60€', '5,90€');

/* TABLE COMMANDE*/
CREATE TABLE commande (
    id_commande INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Date_commande DATE,
    Qte_commandee INT,
    Total_commande FLOAT,
    id_utilisateurs INT,
    CONSTRAINT FK_commande_utilisateurs FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs),
    id_seance INT,
    CONSTRAINT FK_commande_seance FOREIGN KEY (id_seance) REFERENCES seance (id_seance),
    id_tarifs INT,
    CONSTRAINT FK_commande_tarifs FOREIGN KEY (id_tarifs) REFERENCES tarifs (id_tarifs)
    ) ENGINE=InnoDB;

ALTER TABLE commande
ADD FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs);
ALTER TABLE commande
ADD FOREIGN KEY (id_seance) REFERENCES seance (id_seance);
ALTER TABLE commande
ADD FOREIGN KEY (id_tarifs) REFERENCES tarifs (id_tarifs);

/* INSERTION INFORMATIONS DANS TABLE COMMANDE*/
INSERT INTO commande (date_commande, Total_commande) VALUES ('2022-09-02', '2', '14,60€');
INSERT INTO commande (date_commande, Total_commande) VALUES ('2022-10-22', '2', '20,60€');
INSERT INTO commande (date_commande, Total_commande) VALUES ('2022-10-15', '4', '52,44€');

/* TABLE PAIEMENTS*/
CREATE TABLE paiements (
    id_paiements INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Montant FLOAT,
    Date_paiement DATE,
    Moyen_paiement VARCHAR (255),
    id_tarifs INT,
    CONSTRAINT FK_paiements_tarifs FOREIGN KEY (id_tarifs) REFERENCES tarifs (id_tarifs),
    id_commande INT,
    CONSTRAINT FK_paiements_commande FOREIGN KEY (id_commande) REFERENCES commande (id_commande)
    ) ENGINE=InnoDB;

ALTER TABLE paiements
ADD FOREIGN KEY (id_tarifs) REFERENCES tarifs (id_tarifs);
ALTER TABLE paiements
ADD FOREIGN KEY (id_commande) REFERENCES commande (id_commande);


    /* INSERTION INFORMATIONS DANS TABLE PAIEMENTS*/
INSERT INTO paiements (Montant, Date_paiement, Moyen_paiement) VALUES ('25,80€', '2022-11-15', 'Paiement en ligne');
INSERT INTO paiements (Montant, Date_paiement, Moyen_paiement) VALUES ('57,20€', '2022-10-06', 'Paiement sur place');
INSERT INTO paiements (Montant, Date_paiement, Moyen_paiement) VALUES ('7,60€', '2022-09-07', 'Paiement en ligne');


/* PROCESSUS SAUVEGARDE DE LA BASE DE DONNEES cinemaCHRISTINE

J'utilise le logiciel mysqldump intégré à MYSQL sur mon PC, pour enregistrer/sauvegarder en export et récupérer en import ma base de données.

/CONNECTION A MY SQL/
J'ouvre mon terminal CMD, puis je me connecte à my SQL avec la commande
" mysql -uroot -p "
j'entre mon password puis le terminal affiche :" Mysql>"
ce qui me prouve que je suis bien dans MSQL.

/EXPORT BASE DE DONNEES/
j'exporte et sauvegarde ma base de données cinemachristine avec la commande suivante:
"mysql -uroot -p cinemachristine>dump.sql"

dump. est un fichier qui est bien enegistré sur mon PC disque C. exemple C:\Programmes\BDD\dump

/IMPORT BASE DE DONNEES/
Pour récupérer ma base de données cinemachristine , j'utilise la commande suivante:
" mysql -uroot -p cinemachristine<dump.sql"

Je sors de mon terminal SQL avec " EXIT; "














*/
