--b) What are the top 10 most popular movies? 
--And how many times have they each been rented out thus far?

SELECT fi.title, COUNT(re.rental_id) AS Total_Rent
FROM rental re
JOIN inventory inv
ON re.inventory_id = inv.inventory_id
JOIN film fi
ON inv.film_id = fi.film_id
GROUP BY 1
ORDER BY 2 DESC;