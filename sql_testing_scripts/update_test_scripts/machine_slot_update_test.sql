USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO machine_slot (machine_id, snack_id, slot_count) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    10
);

-- Retrieve the last inserted id
SET @lastSlotId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT slot_id, slot_count
INTO @slotId, @slotCount
FROM machine_slot
WHERE slot_id = @lastSlotId;

-- Step 3: Verify the result
SET @testResult = IF(@slotCount = 10, 'Slot inserted', 'Test Failed');

-- Update the test row
UPDATE machine_slot
SET 
    slot_count = 20
WHERE
    slot_id = @lastSlotId;

SET @testResult = 
IF(20 IN (SELECT slot_count FROM machine_slot WHERE slot_id = @lastSlotId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM machine_slot 
WHERE slot_id = @lastSlotId;
