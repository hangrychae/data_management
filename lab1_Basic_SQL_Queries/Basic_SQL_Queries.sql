-- 1
SELECT CONCAT(customer.first_name, " ", customer.last_name) AS CustomerName, film.title AS MovieTitle, DATE(rental.rental_date) AS RentalDate, DATE(rental.return_date) AS ReturnDate
FROM film INNER JOIN inventory 
    ON film.film_id = inventory.film_id INNER JOIN store 
    ON inventory.store_id = store.store_id INNER JOIN rental
    ON inventory.inventory_id = rental.inventory_id INNER JOIN customer 
    ON store.store_id = customer.store_id WHERE film.title = "DARKO DORADO"
ORDER BY RentalDate DESC;



-- 2 
SELECT store.store_id AS StoreID, city.city AS StoreCity, COUNT(inventory.store_id) AS DVDsInInventory
FROM inventory INNER JOIN store
    ON inventory.store_id = store.store_id INNER JOIN address
    ON store.address_id = address.address_id INNER JOIN city
    ON address.city_id = city.city_id
GROUP BY store.store_id;


-- 3

SELECT CONCAT(customer.first_name, " ", customer.last_name) AS CustomerName, customer.email AS email, film.title AS MovieTitle, DATE(rental.rental_date) AS RentalDate
FROM film INNER JOIN inventory 
    ON film.film_id = inventory.film_id INNER JOIN rental
    ON inventory.inventory_id = rental.inventory_id INNER JOIN customer
    ON rental.customer_id = customer.customer_id
WHERE rental.return_date IS NULL;
    
    
    
-- 4
SELECT country.country AS Country, city.city AS City, COUNT(address.city_id) AS NumberOfAddresses
FROM address INNER JOIN city
    ON address.city_id = city.city_id INNER JOIN country
    ON city.country_id = country.country_id
GROUP BY city.city_id
ORDER BY COUNT(address.city_id) DESC, country.country, city.city
LIMIT 20;
