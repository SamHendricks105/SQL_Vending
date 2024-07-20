USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO manager_machine (manager_id, machine_id) 
VALUES (
    1, -- Assuming manager_id 1 exists for testing purposes
    1  -- Assuming machine_id 1 exists for testing purposes
);

SELECT manager_machine_id 
INTO @manager_machine_id
FROM manager_machine 
WHERE manager_id = 1 AND machine_id = 1;

-- Step 2: Delete the row
DELETE FROM manager_machine 
WHERE manager_id = 1 AND machine_id = 1;

-- Step 3: Verify the deletion
SET @testResult = IF(@manager_machine_id NOT IN (SELECT manager_machine_id FROM manager_machine), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

