USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager_machine (manager_id, machine_id) 
VALUES (
    1, -- Assuming manager_id 1 exists for testing purposes
    1  -- Assuming machine_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT manager_machine_id, manager_id
INTO @id, @manager_id
FROM manager_machine
WHERE manager_machine_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @manager_id = 1, 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM manager_machine 
WHERE manager_machine_id = @lastId;
SET SQL_SAFE_UPDATES =1;