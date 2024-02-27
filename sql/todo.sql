DROP TABLE IF EXISTS todo;
--
CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL DEFAULT FALSE
);
--
INSERT INTO todo (title, done)
VALUES ('Acheter du beurre', FALSE),
    ('Acheter un cadeau pour maman', FALSE),
    ('Emmener Rikardo chez le vétérinaire', TRUE),
    ('Passer SSL', FALSE),
    (
        'Apprendre la langue des signe camerounaise',
        FALSE
    ),
    ('Aider papy à faire son testament', TRUE),
    ('Écouter le dernier album de DJ Raoul', TRUE),
    (
        'Gagner au Monopoly Fortnite nouvelle version (version 2) contre Rikardo',
        FALSE
    ),
    ('Lire Berserk', TRUE),
    ('Investire dans les NFT', TRUE);