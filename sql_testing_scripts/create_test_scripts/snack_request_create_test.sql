USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO snack_request (machine_id, snack_name, brand, date) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    'Test Snack', 
    'Test Brand', 
    NOW()
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT request_id, snack_name
INTO @id, @snack_name
FROM snack_request
WHERE request_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @snack_name = 'Test Snack', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM snack_request 
WHERE request_id = @lastId;
SET SQL_SAFE_UPDATES =1;