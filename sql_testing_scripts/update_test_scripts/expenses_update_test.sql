USE Vending;

-- Step 1: Insert a test row (without specifying the auto-incremented id)
INSERT INTO expenses (expense_name, expense_reason, amount) 
VALUES (
    'Test Expense', 
    'Repair', 
    100.00
);

-- Retrieve the last inserted id
SET @lastExpenseId = LAST_INSERT_ID();

-- Step 2: Query the row
SELECT expense_id, expense_name
INTO @expenseId, @expenseName
FROM expenses
WHERE expense_id = @lastExpenseId;

-- Step 3: Verify the result
SET @testResult = IF(@expenseName = 'Test Expense', 'Expense inserted', 'Test Failed');

-- Update the test row
UPDATE expenses
SET 
    expense_name = 'Updated Test Expense'
WHERE
    expense_id = @lastExpenseId;

SET @testResult = 
IF('Updated Test Expense' IN (SELECT expense_name FROM expenses WHERE expense_id = @lastExpenseId), 'Test Passed', 'Test Failed');

-- Output the result
SELECT @testResult AS Result;

-- Clean up: delete the test row
DELETE FROM expenses 
WHERE expense_id = @lastExpenseId;
