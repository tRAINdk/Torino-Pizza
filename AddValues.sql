USE torinoPizza;

INSERT INTO bynavn (bynavn, postnr) VALUES
('Herning', 7400),
('Løgstør', 9670);


INSERT INTO kunde (kundeID, kundenavn, adresse, email, telefon, byID) VALUES
(NULL, 'Anders', 'Vej 1', 'anders@mail.com', 12345678, 1001),
(NULL, 'Sofie', 'Gade 2', 'sofie@mail.com', 87654321, 1000),
(NULL, 'Mikkel', 'All 3', 'mikkel@mail.com', 11223344, 1000);






INSERT INTO ingredienser (beholdning, beskrivelse, ingrediensID, pris) VALUES
(200, 'Skinke', 156, 10.00),
(200, 'Agurk', 155, 5.00),
(200, 'Tomat', 154, 5.00),
(200, 'Salat', 153, 5.00),
(200, 'Pepperoni', 152, 10.00),
(200, 'Ost', 151, 5.00),
(200, 'Tomatsovs', 150, 0.00);

insert into pizza (pizzaID, pizzanavn, pris) values
  (1, 'Margherita', '50'), 
  (2, 'Pepperoni', '60'), 
  (3, 'Vegetar', '55');

insert into ingrediensKobling (ingrediensID, pizzaID) values 
  (151, 1),  (150, 1),
  (152, 2), (151, 2), (150, 2), 
  (154, 3), (155, 3), (153, 3);


INSERT INTO ordre (levering, kundeID, dato) VALUES
(1, 10000, NOW() 
           - INTERVAL FLOOR(RAND() * 6) HOUR
           - INTERVAL FLOOR(RAND() * 60) MINUTE
           - INTERVAL FLOOR(RAND() * 60) SECOND)),  
(0, 10001, NOW() 
           - INTERVAL FLOOR(RAND() * 6) HOUR
           - INTERVAL FLOOR(RAND() * 60) MINUTE
           - INTERVAL FLOOR(RAND() * 60) SECOND)),   
(1, 10002, NOW() 
           - INTERVAL FLOOR(RAND() * 6) HOUR
           - INTERVAL FLOOR(RAND() * 60) MINUTE
           - INTERVAL FLOOR(RAND() * 60) SECOND));

INSERT INTO ordrelinje (ordreID, pizzaID, antal, tilpasningID) VALUES
(100000, 1, 1, 1);
INSERT INTO tilpasningKobling (tilpasningID, ingrediensID) VALUES
(1, 151);

INSERT INTO ordrelinje (ordreID, pizzaID, antal, tilpasningID) VALUES
(100001, 2, 2, 2),
(100001, 3, 1, 3);
INSERT INTO tilpasningKobling (tilpasningID, ingrediensID) VALUES
(2, 152),   
(2, 153);
  
INSERT INTO ordrelinje (ordreID, pizzaID, antal, tilpasningID) VALUES
(100002, 2, 1, 4);
INSERT INTO tilpasningKobling (tilpasningID, ingrediensID) VALUES
(4, 151);
