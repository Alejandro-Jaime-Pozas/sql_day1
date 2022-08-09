--Week 5 - Monday Questions

-- TATYANA: I COULD NOT FIND A WAY TO MAKE DBEAVER WORK, I TALKED WITH PATRICK AND HE TOLD ME TO USE VS CODE INSTEAD, SO THE NUMBERS COULD BE A LITTLE DIFFERENT BUT IT SHOULD BE WORKING JUST AS WELL I BELIEVE. 
--
--1. How many actors are there with the last name ‘Wahlberg’?

 SELECT last_name
 FROM actor
 where last_name = 'Wahlberg';
--2 actors last name wahlberg

--
--2. How many payments were made between $3.99 and $5.99?

 SELECT count(*)
 FROM payment
 WHERE amount >= 3.99 AND amount <= 5.99; 
-- 5,607

--
--3. What films have exactly 7 copies? (search in inventory)

 SELECT film_id, count(film_id)
 FROM inventory
 group by film_id
 having count(film_id) = 7;
--116 have 7 copies

--
--4. How many customers have the first name ‘Willie’?

 select count(*)
 from customer
 where first_name = 'Willie';
-- 2 customers

--
--5. What store employee (get the id) sold the most rentals (use the rental table)?

 select staff_id, count(*)
 from rental
 group by staff_id;
-- id: 1

--
--6. How many unique district names are there? in address table

 select district, count(*)
 from address
 group by district
 order by count(*) DESC;
-- 378 unique districts

--
--7. What film has the most actors in it? (use film_actor table and get film_id)

 select film_id, count(*)
 from film_actor
 group by film_id
 order by count(film_id) desc;
-- film id 508 has 15 actors

--
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select *
from customer
where store_id = 1 and last_name LIKE '%es';
--13 customers
--
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(*)
FROM payment 
WHERE customer_id between 380 AND 430
GROUP BY amount
HAVING count(*) > 250;
--3 payment amounts
--
--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT rating, count(*)
FROM film 
GROUP BY rating;
--5 categories, pg-13 has most

--PUT AN ANSWER AFTER EACH QUESTION/CODE SECTION IF POSSIBLE