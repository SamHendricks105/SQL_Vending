USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO manager (name) 
VALUES (
    'Test Manager'
);

-- Retrieve the last inserted id
SET @lastManagerId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT manager_id, name
INTO @managerId, @managerName
FROM manager
WHERE manager_id = @lastManagerId;

-- Step 3: Verify the result
SET @testResult = IF(@managerName = 'Test Manager', 'Manager inserted', 'Test Failed');

-- Update the test row
UPDATE manager
SET 
    name = 'Updated Test Manager'
WHERE
    manager_id = @lastManagerId;

SET @testResult = 
IF('Updated Test Manager' IN (SELECT name FROM manager WHERE manager_id = @lastManagerId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM manager 
WHERE manager_id = @lastManagerId;
