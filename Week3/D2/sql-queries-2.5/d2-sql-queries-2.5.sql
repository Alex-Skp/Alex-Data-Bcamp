use sakila;

#1. Select all the actors with the first name ‘Scarlett’.
select * 
from sakila.actor a
where a.first_name = 'Scarlett';

#2. How many films (movies) are available for rent and how many films have been rented?
select sum(distinct( i.inventory_id) ) as movies_available,
sum(distinct(r.inventory_id)) as movies_rented
from sakila.inventory i, 
sakila.rental r;

#3. What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
select min(f.length) as min_duration,
max(f.length) as max_duration
from sakila.film f;

#4. What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
select floor(avg(f.length)/60) as hours,
floor(avg(f.length)%60) as minutes
from sakila.film f;

#5. How many distinct (different) actors' last names are there?
select count(distinct(a.last_name)) as last_names
from sakila.actor a;

#6. Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
select datediff(min(convert(substring_index(r.rental_date,' ',1),date)),max(convert(substring_index(r.return_date,' ',1),date))) as days_operating
from sakila.rental r;

#7. Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
select *,
date_format(convert(substring_index(r.rental_date,' ',1),date),"%M") as month,
date_format(convert(substring_index(r.rental_date,' ',1),date),"%a") as day
from sakila.rental r
limit 20;

#8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
date_format(convert(substring_index(r.rental_date,' ',1),date),"%M") as month,
date_format(convert(substring_index(r.rental_date,' ',1),date),"%a") as day,
IF(date_format(convert(substring_index(r.rental_date,' ',1),date),"%a") in ('Sat','Sun'),'weekend','workday') as day_type
from sakila.rental r;

#9. How many rentals were made in the last month of renting activity?

SELECT count(*) as rentals
	FROM(
	SELECT convert(substring_index(r.rental_date,' ',1),date) as dates
	FROM sakila.rental r
    #I need to look more into making this date a flexible value, depending pon max(date) but could not figure this in time
	HAVING dates > date'2006-01-14'
	) as last_month;
    
    
    
    






