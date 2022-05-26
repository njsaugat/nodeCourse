USE sql_store;

-- INSERT INTO products(
-- 	name,
--     quantity_in_stock,
--     unit_price)
--     VALUES
-- 		(
-- 		'Toy Car',
--         '12',
--         '23'),
--         (
--         'Knife',
--         '32',
--         '9'
--         ),
--         (
--         'Kettle',
--         '3',
--         '30'
--         )

-- UPDATE products
-- SET unit_price=3.99
-- WHERE product_id=11;

-- USE sql_invoicing;
-- this is going to be part of subquery 
-- SELECT i.invoice_id,
-- 	i.number,
--     c.name,
-- 	i.invoice_total,
--     i.payment_total,
--     i.invoice_date,
--     i.due_date,
--     i.payment_date
-- FROM invoices AS i
-- JOIN clients AS c
-- 	USING(client_id)
-- WHERE payment_date IS NOT NULL

-- USE sql_invoicing;
-- CREATE TABLE invoices_archived AS 
-- SELECT i.invoice_id,
-- 	i.number,
--     c.name,
-- 	i.invoice_total,
--     i.payment_total,
--     i.invoice_date,
--     i.due_date,
--     i.payment_date
-- FROM invoices AS i
-- JOIN clients AS c
-- 	USING(client_id)
-- WHERE payment_date IS NOT NULL

-- USE sql_store;
-- UPDATE customers
-- SET points=points+50 
-- WHERE birth_date<'1990-01-01'

UPDATE orders
SET comments='Gold Customers'
WHERE customer_id IN
(SELECT customer_id
FROM customers 
WHERE points>3000)


