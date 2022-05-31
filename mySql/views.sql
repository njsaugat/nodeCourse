USE sql_invoicing;

-- SELECT 
-- 	c.client_id,
--     c.name,
--     SUM(invoice_total) AS total_sales
-- FROM clients c
-- JOIN invoices i USING (client_id)
-- GROUP BY client_id,name

-- DROP VIEW sales_by_clients;


-- CREATE OR REPLACE VIEW sales_by_clients AS
-- SELECT 
-- 	c.client_id,
--     c.name,
--     SUM(invoice_total) AS total_sales
-- FROM clients c
-- JOIN invoices i USING (client_id)
-- GROUP BY client_id,name

-- CREATE OR REPLACE VIEW invoice_balance AS
-- SELECT 
-- 	invoice_id,
--     number,
--     client_id,
--     invoice_total,
--     payment_total,
--     invoice_total-payment_total AS balance,
--     invoice_date,
--     due_date,
--     payment_date
-- FROM invoices
-- WHERE (invoice_total-payment_total)>0
-- WITH CHECK OPTION

-- DELETE FROM invoice_balance
-- WHERE invoice_id=19;

-- UPDATE invoice_balance
-- SET due_date=DATE_ADD(due_date, INTERVAL 3 DAY)
-- WHERE invoice_id=18

UPDATE invoice_balance
SET payment_total=invoice_total
WHERE invoice_id=17
