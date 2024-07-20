USE Vending;


-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO address (street, city, state, postal_code, country, latitude, longitude, created_at) 
VALUES (
    '123 Test St', 
    'Test City', 
    'Test State', 
    '12345', 
    'Test Country', 
    10.123456, 
    20.123456, 
    NOW()
);

SELECT street 
INTO @address
FROM address 
WHERE street = '123 Test St';

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM address 
WHERE street = '123 Test St';
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@address NOT IN (SELECT street FROM address), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
