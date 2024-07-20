USE Vending;
-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO customer (name, email, password_hash) 
VALUES (
    'TEST CUSTOMER 53272', 
    'customerTEST5864@gmail.com', 
    "password123"
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT customer_id, name, email
INTO @id, @name, @mail
FROM customer
WHERE customer_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @name = 'TEST CUSTOMER 53272' AND @mail = 'customerTEST5864@gmail.com', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM customer 
WHERE email = "customerTEST5864@gmail.com";
SET SQL_SAFE_UPDATES =1;