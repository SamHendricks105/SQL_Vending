USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO cart_item (cart_id, machine_id, snack_id, quantity) 
VALUES (
    1, -- Assuming cart_id 1 exists for testing purposes
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    2
);

SELECT cart_item_id 
INTO @cart_item_id
FROM cart_item 
WHERE cart_id = 1 AND machine_id = 1 AND snack_id = 1;

-- Step 2: Delete the row
DELETE FROM cart_item 
WHERE cart_id = 1 AND machine_id = 1 AND snack_id = 1;

-- Step 3: Verify the deletion
SET @testResult = IF(@cart_item_id NOT IN (SELECT cart_item_id FROM cart_item), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
