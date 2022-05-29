-- USE sql_store;

-- SELECT *
-- FROM products
-- WHERE unit_price >(
-- 		SELECT unit_price
-- 		FROM products 
-- 		WHERE name REGEXP 'Lettuce'
--         )

-- USE sql_store;
-- SELECT *
-- FROM products
-- WHERE product_id NOT IN(
-- 		SELECT DISTINCT product_id
--         FROM order_items
--     )

-- USE sql_invoicing;
-- SELECT *
-- FROM invoices
-- WHERE invoice_total > (
-- 			SELECT MAX(payment_total)
--             FROM invoices
--             WHERE client_id=3
--             )


-- SELECT *
-- FROM invoices
-- WHERE invoice_total > ALL(
-- 				SELECT invoice_total
--                 FROM invoices
--                 WHERE client_id=3 
--                 )


-- SELECT *
-- FROM invoices
-- WHERE COUNT()>=2 

-- SELECT client_id,
-- 	name,
-- 	COUNT(invoice_total) AS invoice_num
-- FROM invoices 
-- JOIN clients USING(client_id)
-- GROUP BY client_id
-- HAVING invoice_num >=2;
--        
            
            
-- SELECT *
-- FROM clients
-- WHERE client_id = ANY(
-- 				SELECT client_id
-- 				FROM invoices 
-- 				GROUP BY client_id
-- 				HAVING COUNT(invoice_total) >=2)


-- USE sql_hr;
-- SELECT 
-- 	office_id,
--     first_name,
--     last_name,
--     MAX(salary)
-- FROM employees e
-- JOIN offices USING(office_id)
-- WHERE salary> (
-- 			SELECT AVG(salary)
--             FROM employees
-- 			)
-- GROUP BY office_id,
-- 	first_name,
--     last_name
-- HAVING MAX(salary)


-- SELECT 
-- 	office_id,
--     first_name,
--     last_name,
--     job_title,
--     salary,
--     AVG(salary) AS avg_sal
-- FROM employees
-- GROUP BY office_id,
-- 		first_name,
-- 		last_name,
-- 		job_title,
--         salary
-- HAVING office_id=1;
--     

-- SELECT *
-- FROM employees e
-- WHERE salary>(
-- 		SELECT salary
--         FROM employees
--         WHERE office_id=1
--         )



-- SELECT *
-- FROM clients
-- WHERE client_id IN(
-- 			SELECT  DISTINCT client_id
--             FROM invoices
-- 			)
--  



-- SELECT *
-- FROM clients c
-- WHERE EXISTS (
-- 			SELECT client_id	
--             FROM invoices 
--             WHERE client_id=c.client_id
-- 			)


-- USE sql_invoicing;
-- SELECT 
-- 	invoice_id,
--     invoice_total,
--     (SELECT AVG(invoice_total) 
-- 		FROM invoices) AS invoice_average,
-- 	invoice_total-(SELECT invoice_average) AS difference
-- FROM invoices


SELECT *
FROM (
	SELECT 
		client_id,
		name,
		(SELECT SUM(invoice_total)
				FROM invoices
				WHERE client_id=c.client_id) AS total_sales,
		(SELECT AVG(invoice_total) FROM invoices) AS average,
		(SELECT total_sales - average) AS difference
	FROM clients c
) AS sales_summary


