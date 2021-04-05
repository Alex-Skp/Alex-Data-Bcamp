#this is a useful resource to return to any time you arent sure about SQL clauses. 
#Today for extra practice I want you to work through the tutorials for Where, 
#Select distinct, And Or Not, Order By to apply what we learnt today in class 

# Where

use sakila;
select address, postal_code from address;

select * from city;

#Select distinct

select distinct first_name from customer;

#And Or Not

select * from customer where first_name = 'KAREN';
# Careful with karen

select * from film where rental_rate = 0.99 or rental_rate = 2.99;
# Cheap movies for my broke lifestyle 

select * from film where not rating = 'NC-17' and  not rating = 'PG-13' and not rating = 'R';
# movies i can watch with my kids 

#Order by 

select * from film where rental_rate = 0.99 order by length
# the shortest movie that has a rental rate of 0.99 is about an amazing drama of a car and a squirrel who pursue a car in soviet georgia, i dig that.




