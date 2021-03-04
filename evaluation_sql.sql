show databases;

#######################################exercice 1
create database immobilier;
use immobilier;

create table logement (
	idLogement int(5) zerofill not null auto_increment primary key,
    type varchar(255) not null,
    ville varchar(255) not null,
    prix int not null,
    superficie int,
    categorie varchar(255)
);

create table agence (
	idAgence int(6) zerofill not null auto_increment primary key,
    nom varchar(255),
    adresse varchar(255)
);

create table logement_agence(
    idLogementAgence int not null auto_increment primary key,
    idAgence int(5),
    idLogement int(6),
    frais int,
    foreign key (idAgence) references agence(idAgence),
    foreign key (idLogement) references logement(idLogement)
);

create table personne (
	idPersonne int not null auto_increment primary key,
	nom varchar(255) not null,
    prenom varchar(255) not null,
    email varchar(255) not null
);
drop table personne;

create table logement_personne (
	idLogementPersonne int not null auto_increment primary key,
    idPersonne int not null,
    idLogement int not null,
    foreign key (idPersonne) references personne(idPersonne),
    foreign key (idLogement) references logement(idLogement)
);
drop table logement_personne;

create table demande (
	idDemande int not null auto_increment primary key,
    idPersonne int not null,
    type varchar(255) not null,
    ville varchar(255) not null,
    budget int not null,
    superficie int not null,
    categorie int not null,
    foreign key (idPersonne) references personne(idPersonne)
);

#######################################exercice 2
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertion`()
BEGIN
insert into agence (idAgence, nom, adresse) values (1, 'logic-immo', 'www.logic-immo.com');
insert into agence (idAgence, nom, adresse) values (2, 'century21', 'rue century');
insert into agence (idAgence, nom, adresse) values (3, 'laforet', 'rue laforet');
insert into agence (idAgence, nom, adresse) values (4, 'fnaim', 'rue fnaim');
insert into agence (idAgence, nom, adresse) values (5, 'orpi', 'rue orpi');
insert into agence (idAgence, nom, adresse) values (6, 'foncia', 'rue foncia');
insert into agence (idAgence, nom, adresse) values (7, 'guy-hoquet', 'rue guy-hoquet');
insert into agence (idAgence, nom, adresse) values (8, 'seloger', 'www.seloger.com');
insert into agence (idAgence, nom, adresse) values (9, 'bouygues immobilier', 'www.bouygues-immobilier.net');

insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (1, 1, 'appartement', 'paris', 530000, 120, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (2, 3, 'appartement', 'bordeaux', 120000, 18, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (3, 4, 'appartement', 'bordeaux', 145000, 21, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (4, 5, 'appartement', 'bordeaux', 152000, 26, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (5, 6, 'appartement', 'lyon', 200000, 55, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (6, 9, 'appartement', 'paris', 171000, 40, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (7, 13, 'appartement', 'paris', 163000, 25, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (8, 16, 'appartement', 'paris', 132000, 15, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (9, 19, 'appartement', 'paris', 350000, 80, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (10, 22, 'appartement', 'lyon', 600, 20, 'location');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (11, 25, 'appartement', 'lyon', 188000, 65, 'vente');
insert into demande (idDemande, idPersonne, type, ville, budget, superficie, categorie) values (12, 27, 'appartement', 'paris', 400, 15, 'location');

insert into logement_agence(idLogementAgence, idAgence, idLogement, frais) values (1, 1, 2, 15000);
insert into logement_agence(idLogementAgence, idAgence, idLogement, frais) values (2, 5, 3, 800);
insert into logement_agence(idLogementAgence, idAgence, idLogement, frais) values(3, 8, 4, 1000);

insert into logement(idLogement, type, ville, prix, superficie, categorie) values (1, 'appartement', 'paris', 185000, 61, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (2, 'appartement', 'paris', 115000, 15, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (3, 'maison', 'paris', 510000, 130, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (4, 'appartement', 'bordeaux', 550, 17, 'location');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (5, 'appartement', 'lyon', 420, 14, 'location');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (6, 'appartement', 'paris', 160000, 40, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (7, 'appartement', 'paris', 670, 35, 'location');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (8, 'appartement', 'lyon', 110000, 16, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (9, 'appartement', 'bordeaux', 161500, 33, 'vente');
insert into logement(idLogement, type, ville, prix, superficie, categorie) values (10, 'appartement', 'paris', 202000, 90, 'vente');

insert into personne(idPersonne, nom, email) values (1, 'afpa', 'afpa@gmail.com');
insert into personne(idPersonne, nom, email) values (3, 'moussa', 'moussa@gmail.com');
insert into personne(idPersonne, nom, email) values (4, 'camille', 'camille@gmail.com');
insert into personne(idPersonne, nom, email) values (5, 'test', 'test@gmail.com');
insert into personne(idPersonne, nom, email) values (27, 'test2', 'test2@gmail.com');
END

call sp_insertion;
#######################################exercice 3

#1 Affichez le nom des agences
select nom from agence;
#2 Affichez le numéro de l’agence « Orpi »
select idAgence from agence where nom = 'Orpi';
#3 Affichez le premier enregistrement de la table logement
select * from logement limit 1;
#4 Affichez le nombre de logements (Alias : Nombre de logements)
select count(*) as Nombre_de_logements from logement;
#5 Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix.
select * from logement where prix <= 150000 order by prix asc;
#6 Affichez le nombre de logements à la location (alias : nombre)
select count(*) as nombre from logement where categorie = 'location';
#7 Affichez les villes différentes recherchées par les personnes demandeuses d'un logement
select distinct ville from demande;
#8 Affichez le nombre de biens à vendre par ville
select count(*) as nombre,ville from logement group by ville;
#9 Quelles sont les id des logements destinés à la location ?
select idLogement from logement where categorie = 'location';
#10 Quels sont les id des logements entre 20 et 30m² ?
select * from logement where superficie between 20 and 30;
#11 .Quel est le prix vendeur (hors frais) du logement le moins cher à vendre ? (Alias : prix minimum)
select min(prix) as prix_minimum from logement where categorie = 'vente';
#12 Dans quelles villes se trouve les maisons à vendre ?
select distinct ville from logement where categorie = 'vente';
#13 . L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id « 3 ». Passer les frais de ce logement de 800 à 730€
update logement_agence set frais = 730 where idLogement = 3;
#14 Quels sont les logements gérés par l’agence « seloger »
select * from logement inner join 

#######################################exercice 4
create user 'afpa' identified by 'test';
create user 'cda314' identified by 'test';

grant select,insert on immobilier.personne to 'afpa';
grant select,insert on immobilier.logement to 'afpa';

grant delete on immobilier.demande to 'cda314';
grant delete on immobilier.logement to 'cda314';


