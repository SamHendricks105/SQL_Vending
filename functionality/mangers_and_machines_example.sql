
-- A manager can have many machines assigend to them. A machine can also have may mangers.   
-- This makes this a many to many relationship. A juntion table is needed. 

-- creating a manger just requires a name and ID
insert into manager (manager_id, name)
values(75, "Bob");


-- Assigning a manger to a machine requries a machine  
-- a machine requires an address 

insert into address (address_id, street, city, state, postal_code, country, latitude, longitude)
values(18, "1800 call now street", "some city", "Some state", 45862, "USA", 54, 87);

insert into machine (machine_id, name, address_id)
values(85, 'Wallee',18 );


-- a manger can now be assigned to the machine 
insert into manager_machine (manager_id, machine_id)
values (75, 85);

select * from manager_machine;


-- clear the tables 
SET SQL_SAFE_UPDATES =0;
delete from manager_machine;
delete from manager where manager_id = 75;
delete from machine where machine_id = 85;
delete from address where address_id = 18; 

SET SQL_SAFE_UPDATES =1;



