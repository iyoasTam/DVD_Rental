--a)  Which movie genres are the most and least popular? 
-- And how much revenue have they each generated for the business?

(SELECT ca.name, COUNT(re.rental_id) as No_Of_Rents, SUM(pa.amount) as Total_Rev, 'Most Popular' AS "Popularity"
FROM payment as pa
JOIN rental re
ON re.rental_id = pa.rental_id
JOIN inventory inv
ON inv.inventory_id = re.inventory_id
JOIN film fi
ON fi.film_id = inv.film_id
JOIN film_category fc
ON fc.film_id = fi.film_id
JOIN category ca
ON ca.category_id = fc.category_id
GROUP BY ca.name
ORDER BY 3 DESC
LIMIT 1)

UNION

(SELECT ca.name, COUNT(re.rental_id) as No_Of_Rents, SUM(pa.amount) as Total_Rev, 'Least Popular' AS "Popularity"
FROM payment as pa
JOIN rental re
ON re.rental_id = pa.rental_id
JOIN inventory inv
ON inv.inventory_id = re.inventory_id
JOIN film fi
ON fi.film_id = inv.film_id
JOIN film_category fc
ON fc.film_id = fi.film_id
JOIN category ca
ON ca.category_id = fc.category_id
GROUP BY ca.name
ORDER BY 3
LIMIT 1);
