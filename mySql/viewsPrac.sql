-- SELECT *
-- FROM sales_by_clients
-- WHERE total_sales>500
-- ORDER BY total_sales desc;

-- SELECT *
-- FROM sales_by_clients
-- JOIN clients USING(client_id)

-- SELECT 	
-- 	client_id,
--     name,
--     SUM(invoice_total-payment_total) AS balance
-- FROM clients
-- JOIN invoices
-- 	USING(client_id)
-- GROUP BY client_id,name

USE sql_invoicing;

CREATE VIEW clients_balance AS
SELECT 	
	client_id,
    name,
    SUM(invoice_total-payment_total) AS balance
FROM clients
JOIN invoices
	USING(client_id)
GROUP BY client_id,name


