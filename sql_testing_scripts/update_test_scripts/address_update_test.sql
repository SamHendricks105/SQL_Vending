USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO address (address, city, state, postal_code, country, latitude, longitude, created_at) 
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

-- Retrieve the last inserted id
SET @lastAddressId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT address_id, address, city
INTO @addressId, @address, @city
FROM address
WHERE address_id = @lastAddressId;

-- Step 3: Verify the result
SET @testResult = IF(@address IN (SELECT address FROM address), 'Address inserted', 'Test Failed');

-- Update the test row
UPDATE address
SET 
    city = 'Updated Test City'
WHERE
    address_id = @lastAddressId;

SET @testResult = 
IF('Updated Test City' IN (SELECT city FROM address WHERE address_id = @lastAddressId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM address 
WHERE address_id = @lastAddressId;
