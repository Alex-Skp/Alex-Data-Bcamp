use sakila;

#Review the tables in the database.
#Explore tables by selecting all columns from each table or using the in built review features for your client.

select * from actor;
select * from address; 
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film; 
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;

#Select one column from a table. Get film titles.
select f.title from film as f ;

#Select one column from a table and alias it. Get unique list of film languages under the alias language. 
select l.name as language from language l;
#Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select f.title, l.name as language 
from film f
join language l
on f.language_id = l.language_id;
#Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
select first_name as all_staff from staff;
# there are only 2 staff? 
select * from store
# also only 2 stores


