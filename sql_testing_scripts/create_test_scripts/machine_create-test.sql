USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO machine (name, address_id) 
VALUES (
    'Test Machine', 
    1 -- Assuming address_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT machine_id, name
INTO @id, @name
FROM machine
WHERE machine_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @name = 'Test Machine', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM machine 
WHERE machine_id = @lastId;
SET SQL_SAFE_UPDATES =1;