-- The snack request table hold desired snack that are requested by the customer

-- The custmer will make the request from some machine after buying a snack

-- create machine 
insert into address (address_id, street, city, state, postal_code, country, latitude, longitude)
values(595, "115 car street", "some city", "Some state", 48362, "USA", 58, 93);

insert into machine (machine_id, name, address_id) 
values (83, 'RoboCop', 595);


-- create a new snack request 
insert into snack_request (machine_id, snack_name, brand, date) 
values(83, "Reeses", "Probably Hersheys", NOW() );

select * from snack_request;



SET SQL_SAFE_UPDATES =0;
delete from snack_request where machine_id = 83;
delete from machine where address_id = 595;
delete from address where address_id = 595; 
SET SQL_SAFE_UPDATES =1;