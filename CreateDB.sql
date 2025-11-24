CREATE DATABASE IF NOT exists TorinoPizza;
USE TorinoPizza;

CREATE TABLE IF NOT EXISTS bynavn (
  byID int auto_increment, 
  bynavn VARCHAR(50),
  postnr int,
  PRIMARY KEY (byID)
) auto_increment = 1000;

CREATE TABLE IF NOT EXISTS kunde (
  kundeID int auto_increment,
  kundenavn VARCHAR(50),
  adresse VARCHAR(50),
  email VARCHAR(50),
  telefon int,
  byID int,
  PRIMARY KEY (kundeID),
  FOREIGN KEY (byID) REFERENCES bynavn (byID)
) auto_increment = 10000;

CREATE TABLE IF NOT EXISTS ordre (
  ordreID int auto_increment,
  levering BOOL,
  kundeID int,
  dato datetime,
PRIMARY KEY (ordreID),
FOREIGN KEY (kundeID) REFERENCES kunde (kundeID)
) auto_increment = 100000;

CREATE TABLE IF NOT EXISTS pizza (
  pizzaID int,
  pizzanavn VARCHAR(50),
  beskrivelse VARCHAR(50),
  pris DECIMAL(8,2),
PRIMARY KEY (pizzaID)
);

CREATE TABLE IF NOT EXISTS ordrelinje (
  ordreID int,
  pizzaID int,
  antal int,
  tilpasningID int,
PRIMARY KEY (tilpasningID),
FOREIGN KEY (ordreID) REFERENCES ordre (ordreID),
FOREIGN KEY (pizzaID) REFERENCES pizza (pizzaID)
);


CREATE TABLE IF NOT EXISTS ingredienser (
  ingrediensID int,
  beskrivelse VARCHAR(50),
  pris DECIMAL(8,2),
  beholdning int,
  PRIMARY KEY (ingrediensID)
);

CREATE TABLE IF NOT EXISTS IngrediensKobling (
  pizzaID int,
  ingrediensID int,
  foreign key (pizzaID) REFERENCES pizza (pizzaID),
  foreign key (ingrediensID) REFERENCES ingredienser (ingrediensID)
);

CREATE TABLE IF NOT EXISTS tilpasningKobling (
  tilpasningID int,
  ingrediensID int,
  FOREIGN KEY (tilpasningID) REFERENCES ordrelinje (tilpasningID),
  FOREIGN KEY (ingrediensID) REFERENCES ingredienser (ingrediensID)
);


