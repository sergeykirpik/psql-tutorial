EXPLAIN SELECT * FROM film;

EXPLAIN SELECT * FROM film WHERE film_id = 100;

EXPLAIN (COSTS FALSE)
SELECT * FROM film WHERE film_id = 100;

EXPLAIN SELECT COUNT (*) FROM film;

EXPLAIN ANALYZE
SELECT
	f.film_id,
	title,
	name AS category_name
FROM
	film f
INNER JOIN film_category fc
	ON fc.film_id = f.film_id
INNER JOIN category c
	ON c.category_id = fc.category_id
ORDER BY
	title;