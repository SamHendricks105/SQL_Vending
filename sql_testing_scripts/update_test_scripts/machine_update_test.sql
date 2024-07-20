USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO machine (name, address_id) 
VALUES (
    'Test Machine', 
    1 -- Assuming address_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastMachineId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT machine_id, name
INTO @machineId, @machineName
FROM machine
WHERE machine_id = @lastMachineId;

-- Step 3: Verify the result
SET @testResult = IF(@machineName IN (SELECT name FROM machine), 'Machine inserted', 'Test Failed');

-- Update the test row
UPDATE machine
SET 
    name = 'Updated Test Machine'
WHERE
    machine_id = @lastMachineId;

SET @testResult = 
IF('Updated Test Machine' IN (SELECT name FROM machine WHERE machine_id = @lastMachineId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM machine 
WHERE machine_id = @lastMachineId;
