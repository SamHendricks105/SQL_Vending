USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager (name) 
VALUES (
    'Test Manager'
);

SELECT manager_id 
INTO @manager_id
FROM manager 
WHERE name = 'Test Manager';

-- Step 2: Delete the row
DELETE FROM manager 
WHERE name = 'Test Manager';

-- Step 3: Verify the deletion
SET @testResult = IF(@manager_id NOT IN (SELECT manager_id FROM manager), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
