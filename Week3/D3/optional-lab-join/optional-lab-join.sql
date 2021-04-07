USE sakila;

#Inspect the database structure and find the best-fitting table to analyse for the next task
#Using the tables address and staff and the JOIN command, display the first names, last names, and address of each staff member.
SELECT s.first_name as name, s.last_name as surname, a.address, a.address2
FROM staff s
INNER JOIN address a ON s.address_id = a.address_id;

#Using the tables staff and payment and the JOIN command, display the total payment amount by staff member in August of 2005.
SELECT s.first_name as name, s.last_name as surname, SUM(p.amount)
FROM staff s
INNER JOIN payment p ON p.staff_id = s.staff_id
WHERE left(p.payment_date,7) = '2005-08'
GROUP BY p.staff_id;

#Using the tables film and film_actor and the JOIN command, list each film and the number of actors who are listed for that film.
SELECT f.title, count(fa.film_id) as n_actors
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY fa.film_id
ORDER BY n_actors DESC;

#Using the tables payment and customer and the JOIN command, list the total paid by each customer. Order the customers by last name and alphabetically.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
INNER JOIN payment p ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name;
