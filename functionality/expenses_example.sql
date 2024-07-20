-- The expense table is just a table use to track business expenses
-- It is the only table that is not connected to any other table 

-- create a new expense 

insert into expense (expense_name, expense_reason, amount)
values("Machine motor replacment", "Repair", 85.50);

select * from expense;


SET SQL_SAFE_UPDATES =0;
delete from expense where amount = 85.50;
SET SQL_SAFE_UPDATES =1;