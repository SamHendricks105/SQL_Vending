USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO cart_item (cart_id, machine_id, snack_id, quantity) 
VALUES (
    1, -- Assuming cart_id 1 exists for testing purposes
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    2
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT cart_item_id, quantity
INTO @id, @quantity
FROM cart_item
WHERE cart_item_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @quantity = 2, 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM cart_item 
WHERE cart_item_id = @lastId;
SET SQL_SAFE_UPDATES =1;