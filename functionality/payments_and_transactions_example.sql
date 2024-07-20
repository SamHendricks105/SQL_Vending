-- The payment_vault keeps track of a customers prefered payment methods.
-- It need a custmer_Id to create a payment optionin the vault

-- Create acuatomer who wants to save a payment in the vault 
insert into customer (customer_id, name, email, password_hash)
values(988, "Billy Blazes", "rescueHero@gmail.com", "fightFires");


-- Add Billy's visa card to the vault 
insert into payment_vault (customer_id, card_type, card_number, security_code, name, expiration_date)
values(988, 'Visa', 458578, 455, 'Billy Blazes',  '05/2026');

select * from payment_vault;

SET SQL_SAFE_UPDATES =0;
delete from payment_vault where customer_id =988;
delete from customer where customer_id = 988;
SET SQL_SAFE_UPDATES =1;


