USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO cart (customer_id) 
VALUES (
    1 -- Assuming customer_id 1 exists for testing purposes
);

SELECT cart_id 
INTO @cart_id
FROM cart 
WHERE customer_id = 1;

-- Step 2: Delete the row
DELETE FROM cart 
WHERE customer_id = 1;

-- Step 3: Verify the deletion
SET @testResult = IF(@cart_id NOT IN (SELECT cart_id FROM cart), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
