USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO snack (cost, name, brand, country, sold_count) 
VALUES (
    1.50, 
    'Test Snack', 
    'Test Brand', 
    'Test Country', 
    0
);

-- Retrieve the last inserted id
SET @lastSnackId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT snack_id, name, brand
INTO @snackId, @snackName, @snackBrand
FROM snack
WHERE snack_id = @lastSnackId;

-- Step 3: Verify the result
SET @testResult = IF(@snackName IN (SELECT name FROM snack), 'Snack inserted', 'Test Failed');

-- Update the test row
UPDATE snack
SET 
    brand = 'Updated Test Brand'
WHERE
    snack_id = @lastSnackId;

SET @testResult = 
IF('Updated Test Brand' IN (SELECT brand FROM snack WHERE snack_id = @lastSnackId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM snack 
WHERE snack_id = @lastSnackId;
