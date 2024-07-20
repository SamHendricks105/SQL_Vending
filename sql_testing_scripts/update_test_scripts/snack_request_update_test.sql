USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO snack_request (machine_id, snack_name, brand, date) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    'Test Snack', 
    'Test Brand', 
    NOW()
);

-- Retrieve the last inserted id
SET @lastRequestId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT request_id, snack_name
INTO @requestId, @snackName
FROM snack_request
WHERE request_id = @lastRequestId;

-- Step 3: Verify the result
SET @testResult = IF(@snackName = 'Test Snack', 'Snack request inserted', 'Test Failed');

-- Update the test row
UPDATE snack_request
SET 
    snack_name = 'Updated Test Snack'
WHERE
    request_id = @lastRequestId;

SET @testResult = 
IF('Updated Test Snack' IN (SELECT snack_name FROM snack_request WHERE request_id = @lastRequestId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM snack_request 
WHERE request_id = @lastRequestId;
