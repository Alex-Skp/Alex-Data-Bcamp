#Inspect the database structure and find the best-fitting table to analyse for the next task.

#Display all pairs of actors that worked together in a movie.
SELECT  A.first_name, A.last_name,
'worked with',
B.first_name, B.last_name,
'in',
f.title
FROM(
    SELECT A.actor_id AS actor_1, B.actor_id AS actor_2, A.film_id
	FROM film_actor A
	INNER JOIN film_actor B ON A.film_id = B.film_id
	WHERE A.actor_id <> B.actor_id
	ORDER BY A.film_id
    ) r
INNER JOIN film f ON f.film_id = r.film_id
INNER JOIN actor A ON A.actor_id = r.actor_1
INNER JOIN actor B ON B.actor_id = r.actor_2;

#Using CROSS JOIN() display all possible pairs of actors and films.
SELECT a.first_name, a.last_name, f.title
FROM(
	SELECT fa.actor_id, fa.film_id
	FROM film_actor fa
	CROSS JOIN film_actor  
	order by fa.film_id
    ) r
INNER JOIN actor a ON a.actor_id = r.actor_id
INNER JOIN film f ON f.film_id = r.film_id

