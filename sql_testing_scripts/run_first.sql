
USE Vending;

insert into customer (customer_id, name, email, password_hash)
values (1, "Mr. Test 845", "theOneAndOnlyTestEmail@test785459.com", "testPassword");

insert into snack (snack_id, cost, name, brand, country, sold_count)
values(1, 1000.00, 'test_candy', 'test_brand', 'USA', 1500);

insert into address (address_id, street, city, state, postal_code, country, latitude, longitude) 
values(1, "15845845 test street", "west jordan", 'ut', '85955', 'USA', 46, 46);

insert into machine (machine_id, name, address_id)
values(1, 'test machine 466845', 1);

insert into cart (cart_id, customer_id)
values (1,1);

insert into manager (manager_id, name)
values (1,"The big man");