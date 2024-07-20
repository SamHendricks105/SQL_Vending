USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO cart (customer_id) 
VALUES (
    1 -- Assuming customer_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastCartId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT cart_id, customer_id
INTO @cartId, @customerId
FROM cart
WHERE cart_id = @lastCartId;

-- Step 3: Verify the result
SET @testResult = IF(@customerId = 1, 'Cart inserted', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM cart 
WHERE cart_id = @lastCartId;
