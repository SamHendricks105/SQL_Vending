USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO payment_vault (customer_id, card_type, card_number, security_code, name, expiration_date) 
VALUES (
    1, -- Assuming customer_id 1 exists for testing purposes
    'Visa', 
    1234567890123456, 
    123, 
    'Test Customer', 
    '12/2025'
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT payment_id, card_type
INTO @id, @card_type
FROM payment_vault
WHERE payment_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @card_type = 'Visa', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM payment_vault 
WHERE payment_id = @lastId;
SET SQL_SAFE_UPDATES =1;