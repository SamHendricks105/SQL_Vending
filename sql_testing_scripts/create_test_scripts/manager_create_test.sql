USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager (name) 
VALUES (
    'Test Manager'
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT manager_id, name
INTO @id, @name
FROM manager
WHERE manager_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @name = 'Test Manager', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM manager 
WHERE manager_id = @lastId;
SET SQL_SAFE_UPDATES =1;