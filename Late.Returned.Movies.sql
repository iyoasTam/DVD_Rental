--d) How many rented movies were returned late?
-- Is this somehow correlated with the genre of a movie?

SELECT COUNT(re.rental_id)
FROM rental re
	JOIN inventory inv
	ON inv.inventory_id = re.inventory_id
	JOIN film fi
	ON fi.film_id = inv.film_id
	JOIN customer cus
	ON cus.customer_id = re.customer_id
WHERE DATE_PART('day', return_date::timestamp - rental_date::timestamp) > rental_duration
--datediff('day', return_date::date, rental_date::date)


--ordered by no. of days past the return_date
SELECT cus.customer_id, cus.first_name, cus.last_name, fi.title,fi.rental_duration
, (DATE_PART('day', return_date::timestamp - rental_date::timestamp) - rental_duration) as Stay
FROM rental re
	JOIN inventory inv
	ON inv.inventory_id = re.inventory_id
	JOIN film fi
	ON fi.film_id = inv.film_id
	JOIN customer cus
	ON cus.customer_id = re.customer_id
WHERE DATE_PART('day', return_date::timestamp - rental_date::timestamp) > rental_duration
--datediff('day', return_date::date, rental_date::date)
ORDER BY 6 DESC;

--Grouped by Genres
SELECT ca.name, COUNT(rental_id) as "No_Of_Late_Returns"
FROM rental re
	JOIN inventory inv
	ON inv.inventory_id = re.inventory_id
	JOIN film fi
	ON fi.film_id = inv.film_id
	JOIN customer cus
	ON cus.customer_id = re.customer_id
	JOIN film_category fc
	ON fc.film_id = fi.film_id
	JOIN category ca
	ON ca.category_id = fc.category_id
WHERE DATE_PART('day', return_date::timestamp - rental_date::timestamp) > rental_duration
--datediff('day', return_date::date, rental_date::date)
GROUP BY ca.name
ORDER BY 2 DESC;
