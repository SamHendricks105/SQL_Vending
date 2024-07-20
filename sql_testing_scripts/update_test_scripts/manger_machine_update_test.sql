USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO manager_machine (manager_id, machine_id) 
VALUES (
    1, -- Assuming manager_id 1 exists for testing purposes
    1  -- Assuming machine_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastManagerMachineId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT manager_machine_id, manager_id
INTO @managerMachineId, @managerId
FROM manager_machine
WHERE manager_machine_id = @lastManagerMachineId;

-- Step 3: Verify the result
SET @testResult = IF(@managerId = 1, 'Manager_Machine inserted', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM manager_machine 
WHERE manager_machine_id = @lastManagerMachineId;
