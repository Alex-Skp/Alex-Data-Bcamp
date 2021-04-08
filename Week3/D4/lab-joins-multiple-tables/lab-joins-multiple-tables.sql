USE sakila;
#Inspect the database structure and find the best-fitting table to analyse for the next task.
#   We would need country, city, address and store tables 
#Using multiple JOIN() clauses display the store ID, city, and country of each store.
SELECT s.store_id, c.city, co.country
FROM address a
INNER JOIN store s ON a.address_id = s.address_id
INNER JOIN city c ON c.city_id = a.city_id
INNER JOIN country co ON co.country_id = c.country_id;

#Display the total payment amount for each store.
SELECT s.store_id,SUM(p.amount)
FROM staff st
INNER JOIN store s ON st.store_id = s.store_id
INNER JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

#What is the average film length per each category? Which category of films are the longest?
SELECT c.name, AVG(f.length) as avg_len
FROM film_category fc
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY avg_len DESC;
#sports movies tend to be longer! 

#Display the 2 most frequently rented movies in descending order.
SELECT f.title, count(r.rental_id) AS times_rented
FROM inventory i
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC
LIMIT 2;

#Display the top 5 categories with highest revenue (payment amount) in descending order.
SELECT c.name, SUM(p.amount) AS total_revenue
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN inventory i ON f.film_id = i.inventory_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;


#Is the Academy Dinosaur movie available for rent from Store 1?
SELECT i.store_id AS store, 
SUM(f.title = UPPER('Academy Dinosaur'))  as stock_academy_dinosaur     
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
GROUP BY store
#Yes, We have four units in each shop! 







