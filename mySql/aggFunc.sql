-- USE sql_invoicing;
-- SELECT 
-- 	MAX(invoice_total) AS highest,
--     MIN(invoice_total) AS lowest,
--     AVG(invoice_total) AS average,
--     SUM(invoice_total) AS total,
--     COUNT(invoice_total) AS number_of_invoices,
--     COUNT(payment_date) AS count_of_payments,
--     COUNT(*) AS total_records
-- FROM invoices;

-- SELECT 
-- 	MAX(invoice_total) AS highest,
--     MIN(invoice_total) AS lowest,
--     AVG(invoice_total) AS average,
--     SUM(invoice_total *1.1) AS total,
--     -- COUNT(invoice_total ) AS number_of_invoices,
-- --     COUNT(payment_date) AS count_of_payments,
--     COUNT(DISTINCT client_id) AS total_records
-- FROM invoices
-- WHERE invoice_date>'2019-07-01'

-- USE sql_invoicing;
-- SELECT 
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices
-- GROUP BY client_id;



-- SELECT 
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
-- GROUP BY client_id
-- ORDER BY total_sales DESC





-- SELECT 
--     c.name,
--     client_id,
--     -- c.name,c.phone,
--     SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c
-- 	USING(client_id)
-- WHERE due_date>='2019-07-01'
-- GROUP BY client_id
-- ORDER BY total_sales DESC


-- SELECT 
--     state,
--     city,
--     SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c USING(client_id)
-- WHERE due_date>='2019-07-01'
-- GROUP BY state,city
-- ORDER BY total_sales DESC


-- SELECT 
-- 	client_id,
--     SUM(invoice_total) AS total_sales,
--     COUNT(*) AS number_of_invoices
-- FROM invoices
-- GROUP BY client_id
-- HAVING total_sales>500
-- ORDER BY total_sales DESC



-- SELECT 
-- 	client_id,
--     SUM(invoice_total) AS total_sales,
--     COUNT(*) AS number_of_invoices
-- FROM invoices
-- GROUP BY client_id
-- HAVING total_sales>500 AND number_of_invoices>5
-- ORDER BY total_sales DESC

-- USE sql_invoicing;
-- SELECT
-- 	client_id,
--     SUM(invoice_total) AS total_sales
-- FROM invoices
-- GROUP BY client_id WITH ROLLUP


-- SELECT 
-- 	state,
--     city,
--     SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c USING(client_id)
-- GROUP BY state,city WITH ROLLUP  






































