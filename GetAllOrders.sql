-- get all pizza orders. Would be nice to sort by only orders from today
USE TorinoPizza;

SELECT
    ordre.ordreID,
    kunde.kundenavn,
    GROUP_CONCAT(
        CONCAT(
            ordrelinje.antal, 'x ', pizza.pizzanavn,
            IF(extra_ingredienser.extra_list IS NOT NULL AND extra_ingredienser.extra_list != '',
               CONCAT(' (', extra_ingredienser.extra_list, ')'),
               ''
            )
        )
        ORDER BY pizza.pizzaID
        SEPARATOR ', '
    ) AS pizzaer_ekstra,
    SUM((pizza.pris + IFNULL(extra_ingredienser.extra_price, 0)) * ordrelinje.antal) AS totalpris,
    kunde.telefon,
    ordre.dato

FROM ordre
JOIN kunde ON ordre.kundeID = kunde.kundeID
JOIN ordrelinje ON ordre.ordreID = ordrelinje.ordreID
JOIN pizza ON ordrelinje.pizzaID = pizza.pizzaID

-- extra ingredient names
-- total extra price per tilpasning
LEFT JOIN (
    SELECT
        tilpasningID,
        GROUP_CONCAT(CONCAT('+', ingredienser.beskrivelse) ORDER BY ingredienser.beskrivelse SEPARATOR ', ') AS extra_list,
        SUM(ingredienser.pris) AS extra_price
    FROM tilpasningKobling
    JOIN ingredienser ON tilpasningKobling.ingrediensID = ingredienser.ingrediensID
    GROUP BY tilpasningID
) AS extra_ingredienser ON ordrelinje.tilpasningID = extra_ingredienser.tilpasningID

GROUP BY ordre.ordreID, kunde.kundenavn, kunde.telefon, ordre.dato;