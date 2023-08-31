/*g) What are the 10 best rated movies? 
	 Is customer rating somehow correlated with revenue?
	Which actors have acted in most number of the most popular or highest rated movies?
*/

--What are the 10 best rated movies?
SELECT fi.*
FROM rental re
	JOIN customer cus
		ON cus.customer_id = re.customer_id
	JOIN inventory inv
		ON inv.inventory_id = re.inventory_id
	JOIN film fi
		ON fi.film_id = inv.film_id
ORDER BY replacement_cost DESC
LIMIT 10;


--Is customer rating somehow correlated with revenue?
SELECT replacement_cost, SUM(pa.amount)/COUNT(re.rental_id) AS AVG_revenue_per_ReplacementCost
FROM film fi
JOIN inventory inv
ON inv.film_id = fi.film_id
JOIN rental re
ON re.inventory_id = inv.inventory_id
JOIN payment pa
ON pa.rental_id = re.rental_id
WHERE fi.title IN (
SELECT title
FROM film
ORDER BY replacement_cost DESC, rental_rate DESC)
GROUP BY 1
ORDER BY 2 DESC;


--Which actors have acted in most number of the most popular or highest rated movies?
SELECT ac.first_name, ac.last_name, COUNT(sub1.film_id) AS No_Of_Films
FROM 
(SELECT film_id,title,replacement_cost
FROM film
ORDER BY replacement_cost DESC
LIMIT 53 ) sub1
JOIN film_actor fa
ON fa.film_id = sub1.film_id
JOIN actor ac
ON ac.actor_id = fa.actor_id
GROUP BY 1, 2
ORDER BY 3 DESC;




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