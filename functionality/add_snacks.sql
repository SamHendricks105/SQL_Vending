-- snack demonstration all snacks need a cost, name, brand, country and sold_count



INSERT INTO snack (cost, name, brand, country, sold_count)
SELECT 1.50, 'Seaweed snack', 'Wang', 'Korea', 0
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM snack WHERE name = 'Seaweed snack' AND brand = 'Wang' AND country = 'Korea'
);

INSERT INTO snack (cost, name, brand, country, sold_count)
SELECT 1.00, 'Butter Finger', 'Ferrero', 'USA', 0
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM snack WHERE name = 'Butter Finger' AND brand = 'Ferrero' AND country = 'USA'
);

INSERT INTO snack (cost, name, brand, country, sold_count)
SELECT 2.00, 'Bon Bons', 'Eiffel', 'France', 0
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM snack WHERE name = 'Bon Bons' AND brand = 'Eiffel' AND country = 'France'
);

INSERT INTO snack (cost, name, brand, country, sold_count)
SELECT 5.00, 'Beef Jerky', 'Jack Links', 'USA', 0
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM snack WHERE name = 'Beef Jerky' AND brand = 'Jack Links' AND country = 'USA'
);
