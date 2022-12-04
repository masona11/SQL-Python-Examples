#In this SQL code, I'm querying a database that's holding Movie data from multiple tables to answer questions about the data. 

#1 Multi Join
SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

#2 Createing View on mulijoin
CREATE VIEW movie_info AS
SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

# Deleting View
DROP view movie_info

# Recreating view
CREATE VIEW movie_info AS
SELECT DISTINCT(first_name), last_name, title, description, release_year,rating, rental_rate
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id; 

# Find the movies with Rating "R" and has rental rate > 2 using the View that was created
SELECT *
FROM movie_info
WHERE rating = 'R'
AND rental_rate > 2

# Using Case statment to catgories the rental rates based on price and showing prices from largeest to smallest using the View that was created
SELECT first_name, last_name, title, description, rental_rate,
	CASE
		WHEN rental_rate >= 3 THEN 'Premium'
		WHEN rental_rate < 2 THEN 'Average'
		ELSE 'Discount'
		END AS Price_ranges
	FROM movie_info
ORDER BY rental_rate DESC
