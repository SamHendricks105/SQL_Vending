USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager_time (manager_id, time_in, time_out) 
VALUES (
    1, -- Assuming manager_id 1 exists for testing purposes
    NOW(),
    NOW() + INTERVAL 8 HOUR
);

SELECT manager_time_id 
INTO @manager_time_id
FROM manager_time 
WHERE manager_id = 1;

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM manager_time 
WHERE manager_id = 1;
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@manager_time_id NOT IN (SELECT manager_time_id FROM manager_time), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
