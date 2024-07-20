
USE Vending;

-- uncomment the below code if test do not work. 
-- There must be a test row with id 1 in these three tables for the test to work.

-- *************************************************************************** --
-- USE Vending;
-- insert into snack (snack_id, cost, name, brand, country, sold_count)
-- values(1, 1000.00, 'test_candy', 'test_brand', 'USA', 1500);

-- insert into address (address_id, address, city, state, postal_code, country, latitude, longitude) 
-- values(1, "15845845 test street", "west jordan", 'ut', '85955', 'USA', 46, 46);

-- insert into machine (machine_id, name, address_id)
-- values(1, 'test machine 466845', 1);

-- ************************************************************************ --



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
SELECT slot_id, machine_id, snack_id, slot_count
INTO @id, @machine_id, @snack_id, @slot_count
FROM machine_slot
WHERE slot_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@slot_count IN (SELECT slot_count FROM machine_slot), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM machine_slot 
WHERE slot_id = @lastId;
SET SQL_SAFE_UPDATES =1;

