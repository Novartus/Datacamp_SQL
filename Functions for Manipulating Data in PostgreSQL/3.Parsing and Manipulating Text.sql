-- Concatenating strings
-- (1)
SELECT first_name || ' ' || last_name  || ' <' || email || '>' AS full_email FROM customer

-- (2)
SELECT CONCAT(first_name, ' ', last_name,  ' <', email, '>') AS full_email FROM customer

-- Changing the case of string data
SELECT 
  UPPER(c.name) 
  || ': ' || INITCAP(f.title) AS film_category, 
  LOWER(f.description) AS description
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;

-- Replacing string data
SELECT 
  REPLACE(title, ' ', '_') AS title
FROM film; 

-- Determining the length of strings
SELECT 
  title,
  description,
  CHAR_LENGTH(description) AS desc_len
FROM film;

-- Truncating strings
SELECT 
  LEFT(description, 50) AS short_desc
FROM 
  film AS f; 

-- Extracting substrings from text data
SELECT 
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR LENGTH(address))
FROM 
  address;

-- Combining functions for string manipulation
SELECT
 SUBSTRING(email FOR POSITION('@' IN email)-1) AS username,
 SUBSTRING(email FROM POSITION('@' IN email)+1 FOR CHAR_LENGTH(email)) AS domain
FROM customer;

-- Padding
-- (1)
SELECT 
	RPAD(first_name, LENGTH(first_name)+1) || last_name AS full_name
FROM customer;

-- (2)
SELECT 
	first_name || LPAD(last_name, LENGTH(last_name)+1) AS full_name
FROM customer; 

-- (3)
SELECT 
	RPAD(first_name, LENGTH(first_name)+1) 
    || RPAD(last_name, LENGTH(last_name)+2, ' <') 
    || RPAD(email, LENGTH(email)+1, '>') AS full_email
FROM customer; 

-- The TRIM function
SELECT 
  CONCAT(UPPER(c.name), ': ', f.title) AS film_category, 
  TRIM(LEFT(description, 50)) AS film_desc
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;

-- Putting it all together
SELECT 
  UPPER(c.name) || ': ' || f.title AS film_category, 
  LEFT(description, 50 - 
    POSITION(
      ' ' IN REVERSE(LEFT(description, 50))
    )
  ) 
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;