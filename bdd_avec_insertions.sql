CREATE DATABASE bdd_criee2;
USE bdd_criee2;

-- Création des tables

CREATE TABLE espece (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    nomScientifique VARCHAR(50),
    nomCourt VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE presentation (
    id CHAR(3) NOT NULL,
    libelle VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE taille (
    id INT NOT NULL AUTO_INCREMENT,
    specification VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE bateau (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    immatriculation VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE qualite (
    id CHAR(1) NOT NULL,
    libelle VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE typeBac (
    id INT NOT NULL AUTO_INCREMENT,
    tare FLOAT,
    PRIMARY KEY (id)
);

CREATE TABLE peche (
    idBateau INT NOT NULL,
    datePeche DATE,
    CONSTRAINT pk_peche PRIMARY KEY (idBateau, datePeche),
    FOREIGN KEY (idBateau) REFERENCES bateau(id)
);

CREATE TABLE facture (
    id INT NOT NULL AUTO_INCREMENT,
    montantHT FLOAT NOT NULL, 
    dateFacture DATE,
    statut VARCHAR (250),
    PRIMARY KEY (id)
);

CREATE TABLE acheteur (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    raisonSociale VARCHAR(50),
    adresse VARCHAR(50),
    ville VARCHAR(50),
    numHabilitation INT,
    bloque BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE association (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY (id)
);

-- Dans la table lot:
--
-- Si idAcheteur est positif -> Le lot est vendu
-- Si idAssociation est positif -> Le lot est invendu et donné à une association
-- Si idAcheteur et idAssociation = NULL -> Le lot est invendu et va à l'équarrissage

CREATE TABLE lot (
    id INT NOT NULL AUTO_INCREMENT,
    idBateau INT NOT NULL,
    datePeche DATE,
    idLot INT,
    idEspece INT NOT NULL,
    idTaille INT NOT NULL,
    idPresentation CHAR(3) NOT NULL,
    idQualite CHAR(1) NOT NULL,
    idFacture INT,
    idAcheteur INT,
    idAssociation INT,
    poidsBrutLot FLOAT,
    prixEnchere FLOAT,
    dateEnchere DATE,
	HeureDebutEnchere DATETIME,
    prixPlancher FLOAT,
    prixDepart FLOAT,
	codeEtat CHAR(1),
    statutLot CHAR NOT NULL,
    INDEX (idBateau, datePeche, idLot),
    PRIMARY KEY (id),
    CONSTRAINT fk_lot_espece FOREIGN KEY (idEspece) REFERENCES espece(id),
    CONSTRAINT fk_lot_peche FOREIGN KEY (idBateau, datePeche) REFERENCES peche(idBateau, datePeche),
    CONSTRAINT fk_lot_taille FOREIGN KEY (idTaille) REFERENCES taille(id),
    CONSTRAINT fk_lot_presentation FOREIGN KEY (idPresentation) REFERENCES presentation(id),
    CONSTRAINT fk_lot_qualite FOREIGN KEY (idQualite) REFERENCES qualite(id),
    CONSTRAINT fk_lot_facture FOREIGN KEY (idFacture) REFERENCES facture(id),
    CONSTRAINT fk_lot_acheteur FOREIGN KEY (idAcheteur) REFERENCES acheteur(id),
    CONSTRAINT fk_lot_association FOREIGN KEY (idAssociation) REFERENCES association(id)
);

CREATE TABLE bac (
    id INT NOT NULL AUTO_INCREMENT,
    idBateau INT NOT NULL,
    datePeche DATE,
    idLot INT,
    idBac CHAR(1),
    idTypeBac INT NOT NULL,
    INDEX (idBateau, datePeche, idBac),
    PRIMARY KEY (id),
    CONSTRAINT fk_bac_typebac FOREIGN KEY (idTypeBac) REFERENCES typeBac(id),
    CONSTRAINT fk_bac_lot FOREIGN KEY (idBateau, datePeche, idLot) REFERENCES lot(idBateau, datePeche, idLot)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    nomRole VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE utilisateurs (
    id INT NOT NULL AUTO_INCREMENT,
    nomUtilisateur VARCHAR(50),
    motdepasse VARCHAR(50),
    nom VARCHAR(50),
    prenom VARCHAR(50),
    idRole INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_utilisateurs_roles FOREIGN KEY (idRole) REFERENCES roles(id)
);

-- Insertions

insert into espece values(33760,'Baudroie','Lophius Piscatorus','BAUDR');
insert into espece values(33090,'Bar de Chalut','Dicentrarchus Labrax','BARCH');
insert into espece values(33091,'Bar de Ligne','Dicentrarchus Labrax','BARLI');
insert into espece values(32130,'Lieu Jaune de Ligne','Pollachius pollachius','LJAUL');
insert into espece values(42040,'Araignée de mer casier','Maja squinado','ARAIS');
insert into espece values(42041,'Araignée de mer chalut','Maja squinado','ARAIL');
insert into espece values(43010,'Homard','Hammarus gammorus','HOMAR');
insert into espece values(43030,'Langouste rouge','Palinurus elephas','LANGR');
insert into espece values(32140,'Lieu Noir','Lophius Virens','LNOI');
insert into espece values(31020,'Turbot','Psetta maxima','TURBO');
insert into espece values(33480,'Dorade rose','Pagellus bogaraveo','DORAD');
insert into espece values(38150,'Raie douce','Raja Montagui','RAIE');
insert into espece values(33020,'Congre commun','Conger conger','CONGR');
insert into espece values(32020,'Merlu','Merluccius bilinearis','MERLU');
insert into espece values(31030,'Barbue','Scophthalmus rhombus','BARBU');
insert into espece values(31150,'Plie ou carrelet','Pleuronectes Platessa','PLIE');
insert into espece values(32050,'Cabillaud','Gadus Morhua Morhue','CABIL');
insert into espece values(32230,'Lingue franche','Molva Molva','LINGU');
insert into espece values(33080,'Saint Pierre','Zeus Faber','STPIE');
insert into espece values(33110,'Mérou ou cernier','Polyprion Americanus','CERNI');
insert into espece values(33120,'Mérou noir','Epinephelus Guaza','MEROU');
insert into espece values(33410,'Rouget Barbet','Mullus SPP','ROUGT');
insert into espece values(33450,'Dorade royale chalut','Sparus Aurata','DORAC');
insert into espece values(33451,'Dorade royale ligne','Sparus Aurata','DORAL');
insert into espece values(33490,'Pageot Acarne','Pagellus Acarne','PAGEO');
insert into espece values(33500,'Pageot Commun','Pagellus Arythrinus','PAGEC');
insert into espece values(33580,'Vieille','LabrusBergylta','VIEIL');
insert into espece values(33730,'Grondin gris','Eutrigla Gurnadus','GRONG');
insert into espece values(33740,'Grondin rouge','Aspitrigla Cuculus','GRONR');
insert into espece values(33761,'Baudroie Maigre','Lophius Piscicatorius','BAUDM');
insert into espece values(33790,'Grondin Camard','Trigloporus Lastoviza','GRONC');
insert into espece values(33800,'Grondin Perlon','Trigla Lucerna','GRONP');
insert into espece values(34150,'Mulet','Mugil SPP','MULET');
insert into espece values(35040,'Sardine atlantique','Sardina Pilchardus','SARDI');
insert into espece values(37050,'Maquereau','Scomber Scombrus','MAQUE');
insert into espece values(38160,'Raie Pastenague commune','Dasyatis Pastinaca','RAIEP');
insert into espece values(42020,'Crabe tourteau de casier','Cancer Pagurus','CRABS');
insert into espece values(42021,'Crabe tourteau de chalut','Cancer Pagurus','CRABL');
insert into espece values(44010,'Langoustine','Nephrops norvegicus','LANGT');
insert into espece values(57010,'Seiche','Sepia SPP','SEICH');
insert into espece values(57020,'Calmar','Loligo SPP','CALAM');
insert into espece values(57050,'Poulpe','Octopus SPP','POULP');

insert into presentation values('ET','Etété');
insert into presentation values('ENT','Entier');
insert into presentation values('VID','Vidé');

insert into taille values(10,'taille de 10');
insert into taille values(15,'taille de 15');
insert into taille values(20,'taille de 20');
insert into taille values(25,'taille de 25');
insert into taille values(30,'taille de 30');
insert into taille values(35,'taille de 35');
insert into taille values(40,'taille de 40');
insert into taille values(45,'taille de 45');
insert into taille values(50,'taille de 50');
insert into taille values(55,'taille de 55');
insert into taille values(60,'taille de 60');
insert into taille values(65,'taille de 65');
insert into taille values(70,'taille de 70');
insert into taille values(75,'taille de 75');
insert into taille values(80,'taille de 80');
insert into taille values(85,'taille de 85');
insert into taille values(90,'taille de 90');
insert into taille values(95,'taille de 95');

insert into bateau values(1,'Altair','Ad 895511');
insert into bateau values(2,'Macareux','Ad 584873');
insert into bateau values(3,'Avel Ar Mor','Ad 584930');
insert into bateau values(4,'Plujadur','Ad 627846');
insert into bateau values(5,'Gwaien','Ad 730414');
insert into bateau values(6,'L Estran','Ad 815532');
insert into bateau values(7,'Le Petit Corse','Ad 584826');
insert into bateau values(8,'Le Vorlen','Ad 614221');
insert into bateau values(9,'Les Copains d Abord','Ad 584846');
insert into bateau values(10,'Tu Pe Du','Ad 584871');
insert into bateau values(11,'Korrigan','Ad 895472');
insert into bateau values(12,'Ar Guevel','Ad 895479');
insert into bateau values(13,'Broceliande','Ad 895519');
insert into bateau values(14,'L Aventurier','Ad 584865');
insert into bateau values(15,'L Oceanide','Ad 741312');
insert into bateau values(16,'L Arche d alliance','Ad 584830');
insert into bateau values(17,'Sirocco','Ad 715792');
insert into bateau values(18,'Ondine','Ad 584772');
insert into bateau values(19,'Chimere','Ad 895516');

insert into qualite values('A','glacé');
insert into qualite values('B','déclassé');
insert into qualite values('E','extra');

insert into typeBac values(1,2.50);
insert into typeBac values(2,4);

INSERT INTO peche VALUES (1,'2022-07-18');
INSERT INTO peche VALUES (4,'2022-07-18');
INSERT INTO peche VALUES (9,'2022-07-18');
INSERT INTO peche VALUES (11,'2022-07-18');
INSERT INTO peche VALUES (11,'2022-07-20');
INSERT INTO peche VALUES (11,'2022-07-21');
INSERT INTO peche VALUES (11,'2022-07-23');
INSERT INTO peche VALUES (1,'2022-07-24');
INSERT INTO peche VALUES (11,'2022-07-24');
INSERT INTO peche VALUES (1,'2022-07-25');
INSERT INTO peche VALUES (3,'2022-07-25');
INSERT INTO peche VALUES (7,'2022-07-25');
INSERT INTO peche VALUES (11,'2022-07-25');
INSERT INTO peche VALUES (1,'2022-07-30');
INSERT INTO peche VALUES (3,'2022-07-30');
INSERT INTO peche VALUES (7,'2022-07-30');
INSERT INTO peche VALUES (11,'2022-07-30');
INSERT INTO peche VALUES (5,'2022-08-12');
INSERT INTO peche VALUES (9,'2022-08-12');
INSERT INTO peche VALUES (3,'2022-08-25');
INSERT INTO peche VALUES (11,'2022-08-25');

INSERT INTO acheteur VALUES (1, 'nom acheteur1', 'prenom acheteur1', '', '1 rue', 'Paris', 1, FALSE);

INSERT INTO association VALUES (1, 'association1', 'association1@gmail.com');

INSERT INTO lot VALUES (1, 11, '2022-07-18', 1, 33760, 40, 'VID', 'E', 1, 1, NULL, 0.1, 0.1, '2022-07-20', '2022-07-18 10:15:00', 0.1, 0.1, 'E', FALSE); -- lot vendu à un acheteur
INSERT INTO lot VALUES (2, 11, '2022-07-18', 1, 33760, 40, 'VID', 'E', NULL, NULL, 1, 0.1, 0.1, '2022-07-20', '2022-07-18 10:15:00', 0.1, 0.1, 'E', FALSE); -- lot pour association

INSERT INTO bac VALUES (1, 11, '2022-07-18', 1, 'A', 1);

INSERT INTO roles VALUES (1, "Comptable");
INSERT INTO roles VALUES (2, "Directeur des ventes");

INSERT INTO utilisateurs VALUES (1, "utilisateur1", "mdp", "nom utilisateur1", "prenom utilisateur1", 1);
INSERT INTO utilisateurs VALUES (2, "utilisateur2", "mdp", "nom utilisateur2", "prenom utilisateur2", 2);
