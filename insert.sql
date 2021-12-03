-- Les personnes
insert into PERSONNE values (1,'GOSSIN','Charles Alexis',null);
insert into PERSONNE values (2,'FICQUET','Marie Rosalie',null);

-- Les villes
insert into VILLE values (1,'Gravelines');
insert into VILLE values (2,'Malo-les-Bains');

-- Les départements
insert into DEPARTEMENT values (1,'Nord');

-- Les pays
insert into PAYS values (1,'France');

-- Les être né à
insert into ETRENEA values (1,1,null,null,TO_DATE('1839-06-18','YYYY-MM-DD'));
insert into ETRENEA values (2,null,null,null,TO_DATE('1846','YYYY'));

-- Les être décédé à
insert into ETREDECEDEA values (1,2,null,null,TO_DATE('1933-04-22','YYYY-MM-DD'));

-- Les stations
insert into STATION values (1);

-- Les relations
insert into RELATION values (1,"Marié");

-- Les être en relations
insert into ETREENRELATION values (1,1,2,null);

-- Les grades

-- Les fonctions
insert into FONCTION values (1,"Pilote");

-- Les postes
insert into POSTE values (1,1,null,1,null,null,null);

-- Les nationalités
insert into NATIONALITE values (1,"Français");

-- Les images


-- Les avoir pour image


-- Les être décoré
insert into ETREDECORE values (null,1,"Médaille d'or Sa Majesté la Reine d'Angleterre",null);

-- Les textes
insert into TEXTE values (1,"Pierre Louis Joseph Gossin",
                            "Allant à la pêche aux moules il fut  abordé par un pêcheur Belge
                            Selon l’enquête  Pierre n’avait pas de feux de navigation –  Son corps sera retrouvé le 28 février. il manquait une jambe coupée par un godet de la drague et le cadavre était couvert de blessures, que le docteur Ruyssen déclara avoir été faites post Mortem. Ce n’est pas l’avis du frère du noyé, M. Gossin, chevalier de la Légion d’honneur et ancien patron de corvettes de pilotes et du canot de sauvetage. * Il a déposé au parquet une plainte dans laquelle il déclare que son frère, après l’abordage, avait essayé de monter sur le bateau belge..  Les marins de ce dernier l’auraient repoussé à coups de couteau. Une enquête est ouverte.
                            Sources  Grand Echo du Nord de la France – articles de Février et du 7 mars 1902",
                            null);

insert into TEXTE values (2,null,
                            "Dunkerque :

A neuf heures du matin, le sémaphore de Dunkerque ayant signalé le naufrage, à trois lieues au large, d’un navire dont on n’apercevait plus de terre qu’une partie de la mâture, plusieurs hommes dévoués, pilotes, employés des ponts et chaussées, capitaine et équipage du remorqueur, se présentèrent aussitôt pour tenter, s’il était possible, le sauvetage.

Immédiatement, un équipage de neuf hommes fut constitué pour le canot de la Société Humaine. Ficquet était désigné comme patron. Le remorqueur INDUSTRIE poussa ses feux et, dès qu’il eut assez d’eau, il sortit, traînant derrière lui le canot de secours dont il avait pris momentanément l’équipage à bord. Sous l’influence d’un vent violent de nord-nord-est la mer était très mauvaise.

A peine en dehors des jetées, le navire enfourna à plusieurs reprises, au point que l’on put craindre d’être obligé de rebrousser chemin.",
                            "Annales de la société centrale de sauvetage des naufragés");

-- Les bateaux
insert into BATEAU values (1,"Spring");
insert into BATEAU values (2,"Industrie");

-- Les bateaux de sauvetages
insert into BATEAUUSE values (2,"Remorqueur",null,null,null);

-- Les techniques
insert into TECHNIQUE values (1,"va-et-viens");

-- Les materiels
insert into MATERIEL values (1,"Fusil porte-Amarre");

-- Les sauvetages
insert into SAUVETAGE values (1,2,1,null,1,TO_DATE('1867-11-02','YYYY-MM-DD'),5,null);

-- Les avoir pour histoire de station


-- Les avoir pour histoire de personne
insert into AVOIRPOURHISTOIREPERSONNE values (1,1,TO_DATE('1902-03-07','YYYY-MM-DD'));


-- Les avoir pour histoire de sauvetage
insert into AVOIRPOURHISTOIRESAUVETAGE values (1,2,TO_DATE('1868-04-28','YYYY-MM-DD'));


-- Les avoir pour histoire de bateau


-- Les avoir pour histoire de technique


