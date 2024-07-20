USE Vending;
-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO customer (name, email, password_hash) 
VALUES (
    'TEST CUSTOMER 53272', 
    'customerTEST5864@gmail.com', 
    "password123"
);

SELECT name 
into @name
from customer 
where name = "customerTEST5864@gmail.com";

DELETE FROM customer 
WHERE email = "customerTEST5864@gmail.com";

SET @testResult = IF (@name not in (SELECT name from customer), 'Test Passed', 'Test Failed');

SELECT @testResult AS Result;