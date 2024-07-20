USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO machine_slot (machine_id, snack_id, slot_count) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    10
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT slot_id, slot_count
INTO @id, @slot_count
FROM machine_slot
WHERE slot_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @slot_count = 10, 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM machine_slot 
WHERE slot_id = @lastId;
SET SQL_SAFE_UPDATES =1;