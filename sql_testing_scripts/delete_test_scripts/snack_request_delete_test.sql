USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO snack_request (machine_id, snack_name, brand, date) 
VALUES (
    1, -- Assuming machine_id 1 exists for testing purposes
    'Test Snack', 
    'Test Brand', 
    NOW()
);

SELECT request_id 
INTO @request_id
FROM snack_request 
WHERE snack_name = 'Test Snack';

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM snack_request 
WHERE snack_name = 'Test Snack';
SET SQL_SAFE_UPDATES =1;
-- Step 3: Verify the deletion
SET @testResult = IF(@request_id NOT IN (SELECT request_id FROM snack_request), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
