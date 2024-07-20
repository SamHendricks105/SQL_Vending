-- Not all vending machines have the same number of snack slots
-- A table called machine slots is used to added slots to a machine

-- create a machine

insert into address (address_id, street, city, state, postal_code, country, latitude, longitude)
values(503, "113 car street", "some city", "Some state", 48362, "USA", 58, 93);

insert into machine (machine_id, name, address_id) 
values (87, 'Optimus Prime', 503);


-- create slot in the machine 87  that holds 5 seaweed snacks (id =22)
insert into machine_slot (slot_count, machine_id, snack_id)
values(5, 87, 22);

-- create slot in the machine 87  that holds 8 Butter Finger snacks (id =23)
insert into machine_slot (slot_count, machine_id, snack_id)
values(8, 87, 23);


select * from machine_slot 
where machine_id = 87;

-- clear the tables 
SET SQL_SAFE_UPDATES =0;
delete from machine_slot where machine_id = 87;
delete from machine where address_id = 503;
delete from address where address_id = 503; 
SET SQL_SAFE_UPDATES =1;

