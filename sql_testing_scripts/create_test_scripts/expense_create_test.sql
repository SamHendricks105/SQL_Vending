USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO expense (expense_name, expense_reason, amount) 
VALUES (
    'Test Expense', 
    'Repair', 
    100.00
);

-- Retrieve the last inserted id
SET @lastId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT expense_id, expense_name
INTO @id, @expense_name
FROM expense
WHERE expense_id = @lastId;

-- Step 3: Verify the result
SET @testResult = IF(@id = @lastId AND @expense_name = 'Test Expense', 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
SET SQL_SAFE_UPDATES =0;
DELETE FROM expense 
WHERE expense_id = @lastId;
SET SQL_SAFE_UPDATES =1;