/****************** Exercise 2 ******************/

-- Create 2 Views of your choice. 
CREATE VIEW my_customer_list AS
SELECT cus.customer_id, cus.first_name, cus.last_name, addr.address, city.city FROM customer as cus
LEFT JOIN address AS addr ON cus.address_id = addr.address_id
LEFT JOIN city ON city.city_id = addr.city_id;
 
CREATE VIEW my_film_list AS
SELECT film.film_id, film.title, cl.*
FROM film_actor AS rel
INNER JOIN film ON film.film_id = rel.film_id
INNER JOIN my_customer_list AS cl ON cl.customer_id = rel.actor_id;
-- Notice: In the last view I am using the first view.
 
-- Create a Trigger of your choice.
-- This triger will log all insertion to the actor table
CREATE TABLE history (
	id SERIAL PRIMARY KEY,
	table_name TEXT,
	row_id BIGINT,
	action TEXT,
	time timestamp without time zone
);

CREATE OR REPLACE FUNCTION add_to_history() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO history ("table_name", row_id, "action", "time")
	VALUES ('actor', NEW.actor_id, 'insert raw', CURRENT_TIMESTAMP);
    RETURN NULL;
END
$$ LANGUAGE 'plpgsql';
 
CREATE TRIGGER my_history
AFTER INSERT ON actor
FOR EACH ROW
EXECUTE PROCEDURE add_to_history();
