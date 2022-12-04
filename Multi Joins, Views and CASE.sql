SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

CREATE VIEW movie_info AS
SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

DROP view movie_info

CREATE VIEW movie_info AS
SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

SELECT *
FROM movie_info
WHERE rating = 'R'
AND rental_rate > 2

SELECT first_name, last_name, title, description, rental_rate,
	CASE
		WHEN rental_rate >= 3 THEN 'Premium'
		WHEN rental_rate < 2 THEN 'Average'
		ELSE 'Discount'
		END AS Price_ranges
	FROM movie_info
ORDER BY rental_rate DESC