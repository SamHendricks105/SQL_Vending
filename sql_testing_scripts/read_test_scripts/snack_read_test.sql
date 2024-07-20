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

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT snack_id, name, brand, country
INTO @id, @name, @brand, @country
FROM snack
WHERE snack_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@name IN (SELECT name FROM snack), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM snack 
WHERE name = "Test Snack";
SET SQL_SAFE_UPDATES =1;
