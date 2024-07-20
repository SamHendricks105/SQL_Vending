USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO snack (cost, name, brand, country, sold_count) 
VALUES (
    1.50, 
    'Test Snack', 
    'Test Brand', 
    'Test Country', 
    0
);

SELECT name 
INTO @name
FROM snack 
WHERE name = 'Test Snack';

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM snack 
WHERE name = 'Test Snack';
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@name NOT IN (SELECT name FROM snack), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
