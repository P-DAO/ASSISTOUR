INSERT INTO TYPECONTRAT VALUES(1, 'Plénitude');
INSERT INTO TYPECONTRAT VALUES(2, 'Tous Risques ECO');

INSERT INTO marque VALUES(642050199, 'Citroën');
INSERT INTO marque VALUES(780129987, 'Renault');
INSERT INTO marque VALUES(025, 'Garage De La Sansonnais');
INSERT INTO marque VALUES(123, 'BATY TAXI');
INSERT INTO marque VALUES(234, 'SNCF');

INSERT INTO GARAGE VALUES (1, 025, 'Garage De La Sansonnais', 'rue du Général De Gaulle, 22100 LANVALLAY', '0296854098', 210, false);
INSERT INTO GARAGE VALUES (2, 642050199, 'Citroën de Guéret', '22 rue de Marechal Leclerc, 23000 Guéret', '0555524852', 190, false);

INSERT INTO TECHNICIENASSISTANCE VALUES (1, 'BENTOU', 'Olivia');

INSERT INTO COMPAGNIETRANSPORT VALUES (123, 'BATY TAXI', 'Taxi');
INSERT INTO COMPAGNIETRANSPORT VALUES (234, 'SNCF', 'TER');
INSERT INTO COMPAGNIETRANSPORT VALUES (235, 'SNCF', 'Intercité');

INSERT INTO HOTEL VALUES (1, 'hôtel du théâtre', '2 rue Sainte Claire DINAN', '0296390691', 65);
INSERT INTO HOTEL VALUES (2, 'hôtel Océan', '9 place du 11 novembre 1918, DINAN', '0296854361', 79);

INSERT INTO adherent VALUES(1, 'IVANOVITCH', 'Sacha', '14 du boulevard du Temple', '75003', 'Paris', '0692882953');
INSERT INTO vehicule VALUES('3412 CV 75', 1,  1, 642050199, 'Citroën', 'C3' , '2003-04-15');
INSERT INTO vehicule VALUES('BJ 83 AE', 1, 1, 780129987, 'Renault', 'Kadjar', '2019-10-10 ');

INSERT INTO adherent VALUES(2, 'BELKACEM', 'Marwan', '2 rue Maspero', '75016', 'Paris' , '0673939905');
INSERT INTO vehicule VALUES('GN 92 DE', 2, 2, 780129987,'Renault', 'Koloes', '2020-01-03');

INSERT INTO SINISTRE VALUES (1, 1, 1, '3412 CV 75', '2020-05-20', '04:27', 'endormissement au volant, sortie de route sur départementale D2, fin de course dans un fossé à 2km de Dinan (22100)', 'Déformation modérée des éléments de direction', 'Dinan (22100)', 1);
INSERT INTO SINISTRE VALUES (2, 1, 2, 'GN 92 DE', '2020-03-06', '07:30', 'percuté par un poids lourd sur la route ntionale N145 à lentrée de la ville de Saint-Vaury (23320)', 'Véhicule totalement irrécupérable', 'Saint-Vaury (23320)', 2);

INSERT INTO RAPATRIEMENT VALUES (1, 2, 1, 22, 'Saint-Vaury', 'Guéret' );
INSERT INTO RAPATRIEMENT VALUES (2, 2, 2, 23.8, 'Guéret', 'Limoges');
INSERT INTO RAPATRIEMENT VALUES (3, 2, 3, 68, 'Limoges', 'Paris-Austerlitz');

INSERT INTO HEBERGER VALUES (1, 1, '2020-05-20', 2);
INSERT INTO HEBERGER VALUES (2, 1, '2020-05-22', 1);
INSERT INTO HEBERGER VALUES (1, 1, '2020-05-23', 2);

INSERT INTO RAPATRIER VALUES (1, 123);
INSERT INTO RAPATRIER VALUES (2, 234);
INSERT INTO RAPATRIER VALUES (3, 235);
