-- mangers need to be able to clock in for their shifts
-- Just need manger and the clock in  an clockout times


-- create a manger 
insert into manager (manager_id, name)
values (158, "Scott");

-- create time card for scott 
insert into manager_time (manager_id, time_in, time_out)
values(158,  DATE_SUB(NOW(), INTERVAL 3 HOUR), NOW());
 
 select * from manager_time;


-- clear the tables  
SET SQL_SAFE_UPDATES =0;
delete from manager_time where manager_id = 158;
delete from manager where manager_id = 158;
SET SQL_SAFE_UPDATES =1;