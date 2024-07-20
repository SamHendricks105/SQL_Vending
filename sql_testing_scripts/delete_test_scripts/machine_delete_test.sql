USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO machine (name, address_id) 
VALUES (
    'Test Machine', 
    1 -- Assuming address_id 1 exists for testing purposes
);

SELECT name 
INTO @name
FROM machine 
WHERE name = 'Test Machine';

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM machine 
WHERE name = 'Test Machine';
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@name NOT IN (SELECT name FROM machine), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
