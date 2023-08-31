/* h) Rentals and hence revenues have been falling behind among young families.
In order to reverse this, you wish to target all family movies for a promotion.
Identify all movies categorized as family films.
*/

SELECT fi.title
FROM category ca
JOIN film_category fc
ON fc.category_id = ca.category_id
JOIN film fi
ON fi.film_id = fc.film_id
WHERE ca."name" = 'Family'