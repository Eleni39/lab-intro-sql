USE Sakila;
-- Q1
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
-- Joining categry and film category tables.
SELECT * 
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id;

SELECT f.category_id, COUNT(c.category_id)
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.category_id
ORDER BY c.category_id ASC;

-- Q2
SELECT * 
FROM sakila.rental r
JOIN sakila.staff s
ON r.staff_id = s.staff_id;

SELECT r.staff_id, COUNT(s.staff_id)
FROM sakila.rental r
JOIN sakila.staff s
ON r.staff_id = s.staff_id
WHERE r.rental_date LIKE '2005-%08%'
GROUP BY r.staff_id
ORDER BY r.staff_id ASC; -- Staff_id 1 = 3521, Staff_id2 = 3451

-- Q3 Which actor has appeared in the most films

SELECT A.first_name, A.last_name, COUNT(F.film_id) AS number_of_films
FROM sakila.actor A
INNER JOIN sakila.film_actor F
USING(actor_id)
GROUP BY A.actor_id
ORDER BY COUNT(F.film_id) DESC
LIMIT 1;

-- Q4 Most active customer (the customer that has rented the most number of films)

SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT C.first_name, C.last_name, COUNT(c.customer_id) AS most_rentals
FROM sakila.customer c
JOIN sakila.rental r
ON r.rental_id = c.customer_id
GROUP BY r.rental_id
ORDER BY c.customer_id ASC;
-- my answer - Mary Smith. 

-- Q5 Display the first and last names, as well as the address, of each staff member.
USE sakila;
SELECT * FROM staff;
SELECT * FROM address;

SELECT concat(s.first_name, s.last_name) AS 'employee'
FROM sakila.staff s
JOIN sakila.address a
ON s.staff_id = a.address_id
GROUP BY s.staff_id 
ORDER BY a.address_id;

-- I can get the first and last name to display, but for some reason the address is not working. 

-- Q6 List each film and the number of actors who are listed for that film.

SELECT f.film_id, COUNT(a.actor_id)
FROM sakila.film f
JOIN sakila.film_actor a
ON f.film_id = a.actor_id
GROUP BY f.film_id
ORDER BY a.actor_id ASC;

-- Q7 Using the tables payment and customer and the JOIN command,list the total paid by each customer.
-- List the customers alphabetically by last name. 

SELECT p.customer_id, sum(c.last_name) AS total_paid
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.last_name
GROUP BY c.last_name
ORDER BY p.customer_id;
-- Number 8 is a repeat










