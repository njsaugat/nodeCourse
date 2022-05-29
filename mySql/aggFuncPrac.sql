
-- USE sql_invoicing;
-- SELECT 
-- 	'First half of 2019' AS date_range,
-- 	SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total-payment_total) AS what_we_expect
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
-- UNION
-- SELECT 
-- 	'Second half of 2019' AS date_range,
-- 	SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total)-SUM(payment_total) AS what_we_expect
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
-- UNION
-- SELECT 
-- 	'TOTAL' AS date_range,
--     SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total)-SUM(payment_total) AS what_we_expect
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31'


-- USE sql_invoicing;
-- SELECT 
-- 	date,
--     pm.name,
-- 	SUM(amount) AS total_payments
-- FROM payments p
-- JOIN payment_methods pm
-- 	ON p.payment_method=pm.payment_method_id
-- WHERE date IS NOT NULL
-- GROUP BY date,pm.name
-- ORDER BY date
	
    
-- USE sql_store;
-- SELECT state
-- from customers c
-- join orders o
-- using(customer_id)
-- join order_items
-- using(order_id)
-- group by state
-- having state='va' AND 


-- SELECT 
--     customer_id,
--     first_name,
--     state,
-- 	SUM(quantity*unit_price) AS total_pay
-- FROM orders
-- JOIN order_items 
-- 	USING(order_id)
-- JOIN customers
-- 	USING(customer_id)
-- GROUP BY customer_id,first_name,state
-- HAVING state='va' AND total_pay>100


USE sql_invoicing;
SELECT 
	name,
    SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm
	 ON p.payment_method=pm.payment_method_id
GROUP BY name  WITH ROLLUP


    
    































   