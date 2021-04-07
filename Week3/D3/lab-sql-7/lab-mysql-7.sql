use sakila;
#In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT *
FROM actor a
GROUP BY a.last_name
HAVING count(a.first_name) = 1;
#Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT a.last_name as repeated_fname
FROM actor a
GROUP BY a.last_name
HAVING count(a.last_name) > 1;
#Using the rental table, find out how many rentals were processed by each employee.
SELECT count(*) as num_rentals, r. staff_id
FROM rental r
GROUP BY r.staff_id;
#Using the film table, find out how many films were released each year.
SELECT count(*) as no_films, f.release_year
FROM film f
GROUP BY f.release_year;
#Using the film table, find out for each rating how many films were there.
SELECT count(*) as no_films, f.rating
FROM film f
GROUP BY f.rating;
#What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT round(AVG(length),2) as avg_length, f.rating
FROM film f
GROUP BY f.rating;
#Which kind of movies (rating) have a mean duration of more than two hours?
SELECT round(AVG(length),2) as avg_length, f.rating
FROM film f
GROUP BY f.rating
HAVING avg_length > 120;