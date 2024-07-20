-- Create a cart
-- To create a cart you nned to already have a customer 
-- So create on first 
insert into customer (name, email, password_hash) 
values ("Billy Joel", "pianoMan@gmail.com", "Didn'tStartTheFire");

-- A cart can now be created
insert into cart values (
15, 
(select customer_id from customer where email = "pianoMan@gmail.com" ));

-- now items can be added to the cart. Just make sure that the items in the cart use 
-- 15 as the cart_id because that is the cart the was just created.
-- I am using the defuelt test rows from machine and snack. You can do as may inserts
-- as you want just as long as you use snack and machine ids that exist. You can't buy a 
-- snack that isn't in the machine or use a machine that does not exist.
insert into cart_item (cart_id, machine_id, snack_id, quantity)
values(15,1,1,8);

