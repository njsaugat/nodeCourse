-- USE sql_hr;
-- SELECT *
-- FROM employees
-- WHERE salary>(
-- 	SELECT AVG(salary)
--     FROM employees
--     )

-- SELECT *
-- FROM employees
-- WHERE salary> AVG(salary)

-- USE sql_invoicing;
-- SELECT *
-- FROM clients 
-- WHERE client_id NOT IN(
-- 		SELECT DISTINCT client_id
--         FROM invoices
-- 		);
        
-- SELECT *
-- FROM clients c
-- LEFT JOIN invoices i
-- 	USING(client_id)
-- WHERE invoice_id IS NULL;

-- USE sql_store;
-- SELECT 	 
-- 	DISTINCT customer_id,
--     first_name,
--     last_name
-- FROM customers
-- JOIN orders USING (customer_id)
-- JOIN order_items using (order_id)
-- WHERE product_id IN (
-- 				SELECT product_id
-- 				FROM products
-- 				WHERE name REGEXP ('Lettuce')
-- 				)



-- USE sql_invoicing;
-- SELECT *
-- FROM invoices i
-- WHERE invoice_total>(
-- 			SELECT AVG(invoice_total)
--             FROM invoices
--             WHERE client_id=i.client_id
-- 			)


-- USE sql_store;
-- SELECT *
-- FROM products
-- WHERE product_id NOT IN(
-- 	SELECT DISTINCT product_id
--     FROM order_items
-- 	)


-- USE sql_store;
-- SELECT *
-- FROM products AS p
-- WHERE  NOT EXISTS(
-- 	SELECT *
--     FROM order_items
--     WHERE product_id=p.product_id
-- 	)

-- SELECT 
-- 		client_id
--         invoices,
--         -- (SELECT SUM(invoice_total) FROM invoices),
--         (SELECT AVG(invoice_total) FROM invoices) AS average,
-- 		payment_total-(SELECT average) as DIFFERENCE
-- FROM invoices

SELECT 
	client_id,
    name,
    (SELECT SUM(invoice_total)
			FROM invoices
            WHERE client_id=c.client_id) AS total_sales,
	(SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sales - average) AS difference
FROM clients c









































        
        
