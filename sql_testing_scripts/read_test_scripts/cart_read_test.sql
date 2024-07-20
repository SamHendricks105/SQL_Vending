USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO cart (customer_id) 
VALUES (
    1 -- Assuming customer_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT cart_id, customer_id
INTO @id, @customer_id
FROM cart
WHERE cart_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@customer_id IN (SELECT customer_id FROM cart), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM cart 
WHERE cart_id = @lastId;
SET SQL_SAFE_UPDATES =1;
