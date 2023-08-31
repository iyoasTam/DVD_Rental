--c) Which genres have the highest and the lowest average rental rate?
(SELECT ca.name as Genre, AVG(fi.rental_rate) as Average_Rental_Rate, 'Highest' as "Status"
FROM category ca
JOIN film_category fc
ON fc.category_id = ca.category_id
JOIN film fi
ON fi.film_id = fc.film_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1)

UNION

(SELECT ca.name as Genre, AVG(fi.rental_rate) as Average_Rental_Rate, 'Lowest' as "Status"
FROM category ca
JOIN film_category fc
ON fc.category_id = ca.category_id
JOIN film fi
ON fi.film_id = fc.film_id
GROUP BY 1
ORDER BY 2
LIMIT 1);