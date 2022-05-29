-- USE sql_store;

-- SELECT * 
-- FROM customers 
-- WHERE customer_id>5
-- ORDER BY first_name; 

-- SELECT 
-- 	last_name AS 'last name',
-- 	first_name, 
-- 	points, 
-- 	points*10+100 AS discount_factor
-- FROM customers;

-- SELECT state
-- FROM customers
-- WHERE customer_id=1;

-- UPDATE customers
-- SET state='VA'
-- WHERE customer_id=1;

-- SELECT DISTINCT state
-- FROM customers;

-- SELECT * 
-- FROM customers
-- WHERE birth_date>'1990-01-01';



-- USE sql_store;
-- SELECT *
-- FROM customers
-- -- WHERE last_name LIKE '%b%';
-- -- WHERE address LIKE '%trail%'
-- -- 	OR address LIKE '%avenue%'
-- -- WHERE last_name LIKE '%field%';
-- -- WHERE last_name REGEXP 'field$';
-- -- WHERE last_name REGEXP 'field$|^mac|rose';
-- WHERE last_name REGEXP '[gim]e'  


-- SELECT *
-- FROM customers
-- WHERE NOT (birth_date>'1990-01-01' OR points>1000 AND state='VA');

-- SELECT *
-- FROM customers
-- -- WHERE NOT(state IN ('VA','FL','GA'))
-- WHERE state NOT IN ('VA','FL','GA')


-- SELECT *
-- FROM customers
-- WHERE points BETWEEN 1000 AND 3000;


-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b____y';

-- SELECT *
-- FROM customers
-- WHERE phone IS NOT NULL;

SELECT *
FROM customers
LIMIT 3; 


