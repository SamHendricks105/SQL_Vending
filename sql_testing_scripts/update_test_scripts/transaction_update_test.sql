USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO transaction (customer_id, address_id, date, cart_id, machine_id) 
VALUES (
    1, -- Assuming customer_id 1 exists for testing purposes
    1, -- Assuming address_id 1 exists for testing purposes
    NOW(),
    1, -- Assuming cart_id 1 exists for testing purposes
    1  -- Assuming machine_id 1 exists for testing purposes
);

-- Retrieve the last inserted id
SET @lastTransactionId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT transaction_id, customer_id
INTO @transactionId, @transactionCustomerId
FROM transaction
WHERE transaction_id = @lastTransactionId;

-- Step 3: Verify the result
SET @testResult = IF(@transactionCustomerId = 1, 'Transaction inserted', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM transaction 
WHERE transaction_id = @lastTransactionId;
