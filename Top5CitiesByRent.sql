-- e) What are the top 5 cities that rent the most movies? 
--	How about in terms of total sales volume?

--In terms of Rental Count
SELECT ci.city, COUNT(re.rental_id) AS Rent_Count, SUM(pa.amount) AS Total_Revenue
FROM rental re
JOIN payment pa
ON pa.rental_id = re.rental_id
JOIN customer cus
ON cus.customer_id = re.customer_id
JOIN address ad
ON ad.address_id = cus.address_id
JOIN city ci
ON ci.city_id = ad.city_id
GROUP BY ci.city
ORDER BY 2 DESC
LIMIT 5;

--In terms of total sales volume
SELECT ci.city, COUNT(re.rental_id) AS Rent_Count, SUM(pa.amount) AS Total_Revenue
FROM rental re
JOIN payment pa
ON pa.rental_id = re.rental_id
JOIN customer cus
ON cus.customer_id = re.customer_id
JOIN address ad
ON ad.address_id = cus.address_id
JOIN city ci
ON ci.city_id = ad.city_id
GROUP BY ci.city
ORDER BY 3 DESC
LIMIT 5;