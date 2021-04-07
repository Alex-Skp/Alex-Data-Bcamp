USE sakila;
#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT f.title, f.length,
DENSE_RANK() OVER(
	ORDER BY f.length DESC) AS rank_length
FROM film f ;

           
#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
SELECT f.title, f.length,f.rating,
DENSE_RANK() OVER(
	PARTITION BY f.rating
	ORDER BY f.length DESC) AS rank_length
FROM film f;
#How many films are there for each of the categories in the category table. Use appropriate join to write this query
SELECT cat.name, count(*) as no_films
FROM film_category fc
INNER JOIN category cat ON fc.category_id = cat.category_id
GROUP BY fc.category_id;

#Which actor has appeared in the most films?
SELECT a.first_name as name ,a.last_name as surname, count(fa.actor_id)
OVER(PARTITION BY fa.actor_id) AS no_films
FROM film_actor fa
INNER JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY no_films DESC
LIMIT 1;


#Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, count(r.customer_id)
OVER(PARTITION BY r.customer_id) AS n_rentals
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
ORDER BY n_rentals DESC
LIMIT 1;

#Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.

SELECT f.title as movie_title, count(r.rental_id)
OVER(PARTITION BY f.title) as times_rented
FROM rental r
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
ORDER BY times_rented DESC
LIMIT 1;

