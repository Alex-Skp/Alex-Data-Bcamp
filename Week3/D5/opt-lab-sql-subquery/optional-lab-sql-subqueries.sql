USE sakila;

#How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT f.title, COUNT(f.title) as no_films
FROM inventory i 
INNER JOIN film f ON i.film_id = f.film_id
WHERE f.title LIKE 'HUNCHBACK IMPOSSIBLE'
GROUP BY f.title
ORDER BY no_films DESC;

#List all films whose length is longer than the average of all the films.
SELECT f.title,f.length
FROM film f
WHERE f.length > (SELECT AVG(f.length) FROM film f)
ORDER BY f.length DESC;

#Use subqueries to display all actors who appear in the film Alone Trip.
SELECT a.first_name, a.last_name 
FROM film_actor fa
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'ALONE TRIP';

#Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT f.title, c.name as category
FROM film_category fc
INNER JOIN category c on fc.category_id = c.category_id
INNER JOIN film f ON fc.film_id = f.film_id
WHERE c.name = 'Family';

#Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
WHERE cu.address_ID IN (SELECT a.address_id
						FROM address a
                        INNER JOIN city ci on a.city_id = ci.city_id
                        INNER JOIN country c ON ci.country_id = c.country_id
                        WHERE c.country = 'Canada');
							
#Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT f.title
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id = (	SELECT fa.actor_id
						FROM film_actor fa
                        GROUP BY fa.actor_id
                        ORDER BY SUM(fa.actor_ID) DESC
                        LIMIT 1);
					
#Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
SELECT f.title
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r on i.inventory_id = r.inventory_id
WHERE r.customer_id =(	SELECT p.customer_id
						FROM payment p 
						GROUP BY p.customer_id
						ORDER BY SUM(p.amount) DESC
						LIMIT 1);	

#Customers who spent more than the average payments. (I suppose it means that have made purchases bigger than the average purchase?
SELECT c.customer_id, c.first_name, c.last_name
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount > (	SELECT AVG(amount) FROM payment)
GROUP BY c.customer_ID;

#In case i misunderstood, here are customers that spent in total, more than the average of totals per customer. 
SELECT c.customer_id, c.first_name, c.last_name
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) >  (	SELECT AVG(s.sums) 
							FROM( 	SELECT SUM(p.amount) as sums
									FROM payment p
									GROUP BY p.customer_id) s
							);
							





