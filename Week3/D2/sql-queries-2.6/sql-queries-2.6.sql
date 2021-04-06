USE sakila;
#1.Get the unique release years.
SELECT DISTINCT(f.release_year) 
FROM film f;
#only one, apparently 

#2. Get all films with ARMAGEDDON in the title.
SELECT * 
FROM film f
WHERE f.title LIKE '%ARMAGEDDON%';
#Special call to ladybugs armageddon

#3. Get all films which title ends with APOLLO.
SELECT * 
FROM film f
WHERE f.title LIKE '%APOLLO';

#4. Get 10 the longest films.
SELECT * 
FROM film f
ORDER BY f.Length DESC
LIMIT 10;

#5. How many films include Behind the Scenes content?
SELECT * 
FROM film f
WHERE f.special_features LIKE '%Behind the Scenes%';

#6. Drop column picture from staff.
ALTER TABLE staff 
DROP COLUMN picture;

#7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff(staff_id,first_name,last_name,address_id,email,store_id,active,username,password)
VALUES(3,'Tammy', 'Sanders',3,NULL,2,1,'Tammy',NULL);
#she happens also to be Mike's roommate, that's how it goes in video rental shops 

#8. Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
SELECT * 
FROM film f
WHERE f.title LIKE 'Academy Dinosaur';
#Film ID is 1
SELECT * 
FROM inventory i
WHERE i.film_id = 1;
#Mike works at store 1, where there are 4 copies of that film, with inventory id_1 to 4, Charlotte took item number 3 
SELECT * 
FROM customer c
WHERE c.first_name LIKE 'Charlotte';
#she has customer ID 130
#And we insert the log in the rental database
INSERT INTO rental(rental_date,inventory_id,customer_id,staff_id)
values(NOW(),3,130,1);

#9. (Optional, you can skip this) Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date (use CURDATE()) for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
SELECT *
FROM customer c
WHERE c.active = 0;
#Create a table backup table as suggested
CREATE TABLE deleted_users (
	customer_id SMALLINT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    date_deleted DATETIME
    );
#Insert the non active users in the table backup table
INSERT INTO deleted_users 
SELECT customer_id, email, curdate()
FROM customer c
WHERE c.active = 0;
#we check what we did
SELECT *
FROM deleted_users;
#Works well 

#Delete the non active users from the table customer
DELETE FROM customer c
 WHERE c.active = 0;
#There are limitations in using DELETE for this database, so this wont run 

