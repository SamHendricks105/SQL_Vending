USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO transaction (customer_id, address_id, date, cart_id, machine_id) 
VALUES (
    1, -- Assuming customer_id 1 exists for testing purposes
    1, -- Assuming address_id 1 exists for testing purposes
    NOW(),
    1, -- Assuming cart_id 1 exists for testing purposes
    1  -- Assuming machine_id 1 exists for testing purposes
);

SELECT transaction_id 
INTO @transaction_id
FROM transaction 
WHERE customer_id = 1 AND address_id = 1 AND cart_id = 1 AND machine_id = 1;

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM transaction 
WHERE customer_id = 1 AND address_id = 1 AND cart_id = 1 AND machine_id = 1;
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@transaction_id NOT IN (SELECT transaction_id FROM transaction), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
