ALWAYS SAVE FILES AS...BECAUSE JUST SAVING DOES NOT SAVE IT ANYWHERE

-- "Hello world" of SQL -- SELECT all records from a table
SELECT * -- * STAR means ALL COLUMNS;
FROM actor; 
-- semicolon calls the commands

-- to query sepcific columns = Select column_name, ... from table 
SELECT last_name, first_name -- 
FROM actor;

-- FILTER rows - use the WHERE clause
SELECT *
FROM actor 
WHERE first_name = 'Nick'; 
-- WHERE IS ONLY concerned about the ROWS but you call it by column

-- Regex pattern with LIKE clause - % is a wildcard. can be any number of characters (like * in py regex)
SELECT *
FROM actor
WHERE first_name LIKE 'J%';
-- the J% means look for first_names start with J

--the underscore _ IS a wilcard FOR 1 AND ONLY 1 CHARACTER 
SELECT *
FROM actor 
WHERE first_name LIKE 'K__';

SELECT *
FROM actor 
WHERE first_name LIKE '__m';

SELECT *
FROM actor 
WHERE first_name LIKE '_i%';

--USING AND AND OR IN our where
SELECT *
FROM actor 
WHERE first_name LIKE 'K__' or last_name LIKE 'W%';

--comparing operators IN SQL:
--greater than >
--less than <
--greater OR equal >=
--less than OR equal <=
--equal =
--NOT equal <>

--LIKE IS CASE SENSETIVE...ILIKE IS CASE INSENSETIVE

--query FOR DATA that has a pmt amount greater than $2.00
SELECT customer_id, amount -- can separate different COLUMNS WITH ,
FROM payment
WHERE amount > 2; -- SQL automatically changes string TO integer IF VALID...2 can be '2'


SELECT customer_id, amount -- can separate different COLUMNS WITH ,
FROM payment
WHERE amount <> 7.99; -- SQL automatically changes string TO integer IF VALID...2 can be '2'

--GET ALL the pmts bx 3 AND 8 dollars inclusive
SELECT *
FROM payment 
WHERE amount >= 3 AND amount <= 8;

--BETWEEN/AND clause
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8;

--ORDER our ROWS OF DATA BY USING the ORDER BY clause (DEFAULT TO ascending)
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY amount;

--ORDER our ROWS OF DATA BY USING the ORDER BY clause (DEFAULT TO ascending)
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY amount DESC;
-- DESC sorts by DESCENDING order 

ORDER OF operations will be SELECT (columns)> FROM (table)> WHERE (condition ) > ORDER BY (sort)


SELECT *
FROM actor 
ORDER BY last_name;

--SQL aggregations >>> SUM(), AVG(), COUNT(), MIN(), MAX()
SELECT sum(amount)
FROM payment;

--GET the sum OF ALL payments OVER $5
SELECT sum(amount)
FROM payment
WHERE amount > 5;


--GET the avg OF ALL pauments OF MORE than $5
SELECT avg(amount) -- here avg(amount) IS IN SELECT bc it IS selecting that whole column's avg
FROM payment 
WHERE amount > 5;

--GET the count OF ALL payments OF MORE than $5
SELECT count(*) -- here count(*) refers TO ALL COLUMNS, it doesnt matter since it IS counting rows
FROM payment 
WHERE amount > 5;

--alias our COLUMN names - AS keyword allows you TO CHANGE THE COLUMN NAME for this specific query
SELECT min(amount) AS lowest_paid_amount
FROM payment;


SELECT max(amount) AS highest_paid_amount
FROM payment;

SELECT first_name
FROM actor;

--calculate a COLUMN based OFF OF two other columns
SELECT payment_id - rental_id AS difference
FROM payment;


--query the number OF payments per amount
SELECT count(amount)
FROM payment 
WHERE amount = 1.99;

--GROUP BY clause - groups same values into groups
SELECT amount, count(amount)
FROM payment 
GROUP BY amount;

SELECT *
FROM film;


--query the payment TABLE TO display the customers who have spent the most ...  aka ORDER BY sum(amount)
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id 
ORDER BY sum(amount) DESC ;

--HAVING clause >>> HAVING IS TO GROUP BY/aggregations AS WHERE IS TO SELECT 

--query the payment TABLE TO display the customers who have spent the most HAVING made MORE than 40 total payments
SELECT customer_id, sum(amount) AS total_spent
FROM payment 
GROUP BY customer_id 
HAVING count(*) >= 40
ORDER BY total_spent DESC ;

--LIMIT AND OFFSET clause

--LIMIT - LIMIT the number OF ROWS that ARE returned
SELECT *
FROM film
LIMIT 5;

--OFFSET START your ROWS AFTER a certain amount USING offset
SELECT *
FROM film 
ORDER BY title
OFFSET 5; -- this will SKIP OVER the FIRST 5 ROWS AND START AT ROW num 6


SELECT *
FROM film 
ORDER BY title 
OFFSET 10 -- SKIP OVER FIRST 10 ROWS
LIMIT 5; -- grab the NEXT 5 ROWS


--PUT IT ALL TOGETHER
--Display the customers 11-20 who have spent the most money IN UNDER 20 pmts AND has a cutomer_id > 350
SELECT customer_id, sum(amount), count(*)
FROM payment 
WHERE customer_id > 350
GROUP BY customer_id 
HAVING count(*) < 20 
ORDER BY sum(amount) DESC 
OFFSET 10 
LIMIT 10;


--ORDER OF clauses:
--SELECT
--FROM 
--JOIN
--ON 
--WHERE 
--GROUP BY 
--HAVING 
--ORDER BY 
--OFFSET 
--LIMIT 
