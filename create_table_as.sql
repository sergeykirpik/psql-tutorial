CREATE TEMP TABLE IF NOT EXISTS action_films AS
SELECT
	film_id,
	title,
	release_year,
	length,
	rating
FROM
	film
INNER JOIN film_category USING (film_id)
WHERE
	category_id = 1;
	
SELECT * FROM action_films
ORDER BY title;
---
CREATE TABLE IF NOT EXISTS film_rating (rating, film_count) AS
SELECT
	rating,
	COUNT (film_id)
FROM
	film
GROUP BY
	rating;