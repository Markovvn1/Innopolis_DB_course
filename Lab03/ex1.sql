/****************** Exercise 1 ******************/

-- Order countries by id asc, then show the 12th to 17th rows.
SELECT * FROM country
ORDER BY country_id ASC
OFFSET 11 LIMIT 6;
 
-- List all addresses in a city whose name starts with ‘A’.
SELECT city.city, addr.address FROM city
INNER JOIN address as addr
ON city.city_id = addr.city_id
WHERE (LOWER(city) LIKE 'a%');
 
-- List all customers' first name, last name and the city they live in.
SELECT cus.first_name, cus.last_name, city.city FROM customer as cus
LEFT JOIN address AS addr ON cus.address_id = addr.address_id
LEFT JOIN city ON city.city_id = addr.city_id;
 
-- Find all customers with at least one payment whose amount is greater than 11 dollars.
SELECT cus.customer_id, cus.first_name, cus.last_name, payment.amount FROM payment
INNER JOIN customer AS cus
ON cus.customer_id = payment.customer_id
WHERE payment.amount > 11;
 
-- Find all duplicated first names in the customer table.
SELECT first_name, count(*) FROM customer
GROUP BY first_name
HAVING count(*) > 1;
