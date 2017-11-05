SELECT DISTINCT AdresseEditeur
FROM Editeur;


SELECT numEditeur
FROM Livre
WHERE numLivre = 3;



SELECT NomAuteur,
       NomEditeur
FROM Auteur,
     Livre
WHERE Livre.NumAuteur = Auteur.NumAuteur
    AND NumEditeur BETWEEN 1 AND 3
ORDER BY NomAuteur,
         PrenomAuteur;


SELECT Client.NumClient,
       NomClient
FROM Client,
     Commende
WHERE Commende.NumClient = Client.NumClient
    AND Commende.NumLivre = 3;


SELECT NumClient
FROM Commende
WHERE Quantite > 1;


SELECT numEditeur
FROM Editeur
WHERE upper(AdresseEditeur) LIKE '%PARIS%' ;


SELECT Titre
FROM Livre,
     Commende
WHERE Livre.NumLivre = Commende.Numlivre ;


SELECT DISTINCT(NomClient)
FROM Client
WHERE NomClient LIKE 'D%';


SELECT titre,
       DateEdition
FROM Livre
ORDER BY
SELECT NomClient
FROM Commende,
     Livre,
     Client
WHERE Client.NumClient = Commende.NumClient
    AND Livre.NumLivre = Commende.NumLivre
    AND Livre.NumLivre = 4;


SELECT NomAuteur
FROM Auteur,
     Livre,
     Editeur
WHERE Editeur.NumEditeur = Livre.NumEditeur
    AND Editeur.AdresseEditeur LIKE '%Lyon%';


SELECT DateEdition,
       Titre
FROM Livre,
     Commende,
     Client
WHERE Client.NumClient = Commende.NumClient
    AND NomClient LIKE '%t';


SELECT DISTINCT(Commende.NumClient),
       NomClient
FROM Commende,
     Client,
     Livre
WHERE Client.NumClient = Commende.NumClient
    AND Livre.NumLivre = Commende.NumLivre
    AND Titre LIKE 'Voyage au bout de la nuit';


SELECT Count(Quantite)
FROM Commende
WHERE NumLivre LIKE 'Le Mur';


SELECT Count(*)
FROM Livre,
     Auteur
WHERE Livre.NumAuteur = Auteur.NumAuteur
    AND NomAuteur = 'Baricco';


SELECT NumLivre
FROM Livre
WHERE DateEdition<
        (SELECT DateEdition
         FROM Livre
         WHERE NumLivre = 2) ;


SELECT *
FROM Client MINUS
SELECT Client.*
FROM Commende,
     Client
WHERE Client.NumClient = Commende.NumClient;


SELECT PrenomClient
FROM Client,
     Commende,
     Livre,
     Editeur
WHERE Client.NumClient = Commende.NumClient
    AND Commende.NumLivre = Livre.NumLivre
    AND Livre.NumEditeur = Editeur.NumEditeur
    AND Lower(NomEditeur) = 'Dumond';


SELECT NumAuteur
FROM Auteur,
     Livre,
     Commende,
     Client
WHERE NomClient LIKE 'D%'
    AND Client.NumClient = Commende.NumClient
    AND CommendeNumLivre = Livre.NumLivre
    AND Livre.NumAuteur = Auteur.NumAuteur;


SELECT Count(DISTINCT NumClient)
FROM Client,
     Commende
WHERE Client.NumClient = Commende.NumClient
    AND NumLivre = 3;

    


