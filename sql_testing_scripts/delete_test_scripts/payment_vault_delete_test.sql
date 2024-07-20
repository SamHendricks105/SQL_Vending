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

SELECT payment_id 
INTO @payment_id
FROM payment_vault 
WHERE card_number = 1234567890123456;

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM payment_vault 
WHERE card_number = 1234567890123456;
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@payment_id NOT IN (SELECT payment_id FROM payment_vault), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
