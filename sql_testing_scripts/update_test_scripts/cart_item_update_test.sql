USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO cart_item (cart_id, machine_id, snack_id, quantity) 
VALUES (
    1, -- Assuming cart_id 1 exists for testing purposes
    1, -- Assuming machine_id 1 exists for testing purposes
    1, -- Assuming snack_id 1 exists for testing purposes
    2
);

-- Retrieve the last inserted id
SET @lastCartItemId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT cart_item_id, quantity
INTO @cartItemId, @quantity
FROM cart_item
WHERE cart_item_id = @lastCartItemId;

-- Step 3: Verify the result
SET @testResult = IF(@quantity = 2, 'Cart item inserted', 'Test Failed');

-- Update the test row
UPDATE cart_item
SET 
    quantity = 3
WHERE
    cart_item_id = @lastCartItemId;

SET @testResult = 
IF(3 IN (SELECT quantity FROM cart_item WHERE cart_item_id = @lastCartItemId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM cart_item 
WHERE cart_item_id = @lastCartItemId;
