USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO machine_slot (machine_id, snack_id, slot_count) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    10
);

SELECT slot_count 
INTO @slot_count
FROM machine_slot 
WHERE machine_id = 1 AND snack_id = 1;

-- Step 2: Delete the row
DELETE FROM machine_slot 
WHERE machine_id = 1 AND snack_id = 1;

-- Step 3: Verify the deletion
SET @testResult = IF(@slot_count NOT IN (SELECT slot_count FROM machine_slot), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
