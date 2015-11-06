



CREATE TABLE TYPEPROBLEME
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	libelleType VARCHAR(100) NOT NULL,
	CONSTRAINT pk_type PRIMARY KEY (id)

)
;
CREATE TABLE PROBLEME
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	nomProbleme VARCHAR(100) NOT NULL,
	idType MEDIUMINT NOT NULL,
	CONSTRAINT pk_probleme PRIMARY KEY (id),
	CONSTRAINT fk_type FOREIGN KEY (idType) REFERENCES TYPEPROBLEME(id) ON DELETE CASCADE
)
;
CREATE TABLE ENDROIT
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	libelle VARCHAR(100) NOT NULL,
	CONSTRAINT pk_endroit PRIMARY KEY (id)
)
;
CREATE TABLE PAVILLON
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pavillon VARCHAR(3) NOT NULL DEFAULT 'NON',
	lib VARCHAR(300) NOT NULL,
	idEndroit MEDIUMINT NOT NULL,
	CONSTRAINT pk_pavillon PRIMARY KEY (id),
	CONSTRAINT fk_endroit FOREIGN KEY (idEndroit) REFERENCES ENDROIT(id) ON DELETE CASCADE
)
;
CREATE TABLE PERSONNE
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	login VARCHAR(10) NOT NULL,
	telephone VARCHAR(5) NOT NULL,
	CONSTRAINT pk_personne PRIMARY KEY (id)
)
;
CREATE TABLE FICHEPROBLEME
(
		id MEDIUMINT NOT NULL AUTO_INCREMENT,
		idPersonne MEDIUMINT NOT NULL,
		idPavillon MEDIUMINT NOT NULL,
		idProbleme MEDIUMINT NOT NULL,
		adresseip VARCHAR(15) NOT NULL,
		nompc VARCHAR(10) NOT NULL,
		thispc TINYINT(1) NOT NULL,
		CONSTRAINT pk_fiche PRIMARY KEY (id),
		CONSTRAINT fk_personne FOREIGN KEY (idPersonne) REFERENCES PERSONNE(id) ON DELETE CASCADE,
		CONSTRAINT fk_pavillon FOREIGN KEY (idPavillon) REFERENCES PAVILLON(id) ON DELETE CASCADE,
		CONSTRAINT fk_probleme FOREIGN KEY (idProbleme) REFERENCES PROBLEME(id) ON DELETE CASCADE
)
;

INSERT INTO ENDROIT (libelle) VALUES ('Centre Hospitalier de Troyes');
INSERT INTO ENDROIT (libelle) VALUES ('Résidence Comte Henri - CMLS');
INSERT INTO ENDROIT (libelle) VALUES ('Domaine de Nazareth');



INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I0','Addictologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('P1','Anatomie et cytologie pathologique',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('V0','Bloc Opératoire-Anesthésie/réveil',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('V1','Bloc Opératoire-Anesthésie/réveil',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A2','Cardiologie : hospitalisation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('D2','Cardiologie : hospitalisation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('B2','Cardiologie : soins intensifs - examens',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('B1','Centre de prévention et dépistage',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I0','CLAT',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E0','Centre de Vaccinations internationales',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E1','Chapelle Aumônerie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('V0','Chirurgie Ambulatoire : Hôpital de Jour',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R2','Chirurgie Générale et Digestive',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R2','Chirurgie Gynécologique',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N2','Chirurgie orthopédique et traumatologique',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R3','Chirurgie vasculaire et thoracique',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('D1','Dermatologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E2','Diabétologie : Unité de Soins Ambulatoires',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N1','Direction',1);



INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K4','Ecole',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('D0','Etablissement Francais du Sang',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E1','Etat Civil - Mouvement - Frais de séjour',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('P0','Génétique : consultation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A3','Gériatrie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J4','Gynécologie - Maternité : Hospitalisation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J0','Gynécologie : consultations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('C0','Hémodyalise',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('H2','Hépato-Gastro-entérologie : hospitalisation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('G2','Hépato-Gastro-entérologie : examens',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('L0','IRM - Scanner',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('P2','Kinésithérapie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K4','Jardin Enfant',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('F0','Labo. Hémato-immunologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E0','Labo. Biochimie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('E0','Labo. MicroBiologie',1);



INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J0','Maternité : consultations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K3','Maternité : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K4','Maternité : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K0','Maternité : salle de naissance',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K0','Maternité : Unité Accueil Obstétrique',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I1','MI 1 : maladies infectieuses',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I2','rhumatologie - diabétologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A0','Médecine 1 - Rhumatologie - : consultations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('H1','Médecine multidisciplinaire : hôpital de jour',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I-1','Médecine Nucléaire : hôpital de jour ',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K1','Néonatologie : médecine et réanimation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A2','Néphrologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A0','Neurologie : exam',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('A1','Neurologie : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R0','Oncologie - Radiothérapie - Chimiothérapie : hôpital de jour',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R0','Oncologie - Radiothérapie - Chimiothérapie : consultation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R1','Oncologie - Radiothérapie - Chimiothérapie : hospitalisations',1);

INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N3','Odontologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R3','Ophtamologie : hospitalisation',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('G1','Ophtamologie et Orthoptie : consult et exam',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N3','Oto-Rhino-Laryngologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J0','Pédiatrie : hôpital de jour',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J0','Pédiatrie : consults',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J2','Pédiatrie : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K2','Pédiatrie : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('V-1','Pharmacie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('D3','Pneumologie : hospitalisations',1);

INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('J3','Pneumologie : consult et exam',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N0','Radiologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('R0','Radiothérapie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('U0','Réanimation Polyvalente',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('P2','Rééducation fonctionelle',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('O1','SAMU-SMUR-Centre 15',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('L0','Scanner -IRM',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I-1','Scintigraphie - Médecine Nucléaire',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I0','Tabacologie ',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('K0','Unité accueil obstétrique',1);

INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('N3','Unité fonctionelle urologie',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('G1','Unité fonctionelle vasculaire',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('U-1','Urgence : accueil',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('U-1','Urgences : hospitalisations',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('B0','Ugences : psychiatrie (EPSMA)',1);
INSERT INTO PAVILLON (pavillon,lib,idEndroit) VALUES ('I0','UTEP : Unité Transversale Education du Patient',1);




INSERT INTO PAVILLON (lib,idEndroit) VALUES ('Gériatrie : hospitalisation',2);
INSERT INTO PAVILLON (lib,idEndroit) VALUES ('Soins palliatifs',2);

