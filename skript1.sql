-- SET sql_safe_updates = 0;

USE db;

-- f)
INSERT INTO warengruppe (gruppenName, beschreibung) VALUES ('Figuren', NULL);
INSERT INTO warengruppe (gruppenName, beschreibung) VALUES ('Gebäude', NULL);

SELECT * FROM warengruppe;

-- g)
UPDATE warengruppe SET beschreibung = 'Modelle von Menschen oder Tieren' WHERE gruppenName = 'Figuren';
SELECT * FROM warengruppe;

-- h)
DELETE FROM warengruppe WHERE gruppenName = 'Gebäude';
SELECT * FROM warengruppe;

-- i) (artikelName könnte als Primary Key verwendet werden)
INSERT INTO artikel (artikelName, Warengruppe_gruppenName, beschreibung, skalierung, lieferant, lagerBestand, preisEk, preisListe) VALUES (
    'Soldat Figur WWII',  -- artikeName
    'Figuren',  -- Warengruppe_gruppenName
    'Detaillierte Figur eines amerikanischen Soldaten im Zweiten Weltkrieg.',  -- beschreibung
    '1:10',  -- skalierung
    'Herpa',  -- lieferant
    50,  -- lagerBestand
    4.50,  -- preisEk
    9.99  -- preisListe
);
SELECT * FROM artikel;

-- j)
-- Lösche alle Artikel in der Warengruppe "Figuren"
DELETE FROM artikel WHERE Warengruppe_gruppenName = (SELECT gruppenName FROM warengruppe WHERE gruppenName = 'Figuren');
DELETE FROM warengruppe WHERE gruppenName = 'Figuren';
