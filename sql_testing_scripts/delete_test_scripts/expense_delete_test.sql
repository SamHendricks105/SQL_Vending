USE Vending;

-- Step 1: Insert the row (without specifying the auto-incremented id)
INSERT INTO expense (expense_name, expense_reason, amount) 
VALUES (
    'Test Expense', 
    'Repair', 
    100.00
);

SELECT expense_id 
INTO @expense_id
FROM expense
WHERE expense_name = 'Test Expense';

-- Step 2: Delete the row
SET SQL_SAFE_UPDATES =0;
DELETE FROM expense 
WHERE expense_name = 'Test Expense';
SET SQL_SAFE_UPDATES =0;

-- Step 3: Verify the deletion
SET @testResult = IF(@expense_id NOT IN (SELECT expense_id FROM expense), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;
