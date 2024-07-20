USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager_time (manager_id, time_in, time_out) 
VALUES (
    1, -- Assuming manager_id 1 exists for testing purposes
    NOW(),
    NOW() + INTERVAL 8 HOUR
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT manager_time_id, manager_id, time_in, time_out
INTO @id, @manager_id, @time_in, @time_out
FROM manager_time
WHERE manager_time_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@manager_id IN (SELECT manager_id FROM manager_time), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM manager_time 
WHERE manager_time_id = @lastId;
