-- USE sql_store;
-- SELECT * 
-- FROM orders AS o
-- INNER JOIN  customers AS c
-- ON o.customer_id=c.customer_id;


-- SELECT first_name,last_name, order_id,c.customer_id
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customer_id=o.customer_id;

-- SELECT *
-- FROM products AS pr
-- JOIN sql_inventory.products AS spr
-- ON pr.product_id=spr.product_id  

-- USE sql_hr;
-- SELECT e.first_name,e.last_name,e.job_title,e.salary
-- FROM employees AS e
-- JOIN employees AS m 
-- ON e.reports_to=m.employee_id;

-- USE sql_store;
-- SELECT *
-- FROM orders AS o
-- JOIN customers AS c
-- 	ON o.customer_id=c.customer_id
-- JOIN order_statuses AS os
-- 	ON o.status=os.order_status_id


-- SELECT 
-- 	o.order_id,
--     o.order_date,
--     c.first_name,
--     c.last_name,
--     os.name AS status
-- FROM customers AS c
-- JOIN orders AS o
-- 	ON c.customer_id=o.customer_id
-- JOIN order_statuses AS os
-- 	ON o.status=os.order_status_id;

-- USE sql_store;
-- SELECT *
-- FROM order_items oi
-- JOIN order_item_notes oin
-- 	ON oi.order_id= oin.order_id
--     AND oi.product_id=oin.product_id;


-- SELECT 
-- 	p.product_id,
--     p.name,
--     oi.quantity
-- FROM products AS p
-- LEFT JOIN order_items AS oi
-- 	ON p.product_id=oi.product_id


-- SELECT 
-- 	o.order_id,
-- 	o.order_date,
--     o.order_id,
--     c.first_name,
--     s.name AS shipper,
--     os.name AS status
-- FROM orders AS o
-- JOIN customers AS c
-- 	ON o.customer_id=c.customer_id
-- LEFT JOIN shippers AS s
-- 	ON o.shipper_id=s.shipper_id
-- JOIN order_statuses AS os
-- 	ON o.status=os.order_status_id

-- USE sql_invoicing;
-- SELECT 
-- 	i.payment_date AS date,
--     c.name clients,
--     p.amount,
--     pm.name
-- FROM clients AS c
-- JOIN invoices AS i
-- 	USING(client_id)
-- JOIN payments AS p
-- 	USING(client_id)
-- JOIN payment_methods as pm
-- 	ON p.payment_id=pm.payment_method_id
-- -- WHERE i.payment_date IS NOT NULL;

-- SELECT 
-- 	p.date,
--     c.name AS client,
-- 	p.amount,
--     pm.name
-- FROM payments p
-- JOIN clients c
-- 	USING(client_id)
-- JOIN payment_methods pm
-- 	ON p.payment_method=pm.payment_method_id


-- SELECT *
-- FROM shippers 
-- CROSS JOIN products

-- SELECT *
-- FROM shippers, products 
-- -- CROSS JOIN products

-- SELECT 
-- 'BRONZE' as type
-- UNION 
-- SELECT
-- 'SILVER'as type
-- UNION
-- SELECT 
-- 'GOLD' as type;


-- SELECT 
-- 	customer_id,
--     first_name,
--     points,
--     'Bronze' AS type
-- FROM customers
-- WHERE points<2000
-- UNION
-- SELECT 
-- 	customer_id,
--     first_name,
--     points,
--     'SILVER' AS type
-- FROM customers
-- WHERE points BETWEEN 2000 AND 3000
-- UNION
-- SELECT 
-- 	customer_id,
--     first_name,
--     points,
--     'GOLD' AS type
-- FROM customers
-- WHERE points BETWEEN 3000 AND 4000
-- ORDER BY first_name;

-- USE sql_store;
-- SELECT *
-- FROM orders AS o
-- JOIN customers AS c
-- 	ON o.customer_id=c.customer_id

-- SELECT *
-- FROM orders AS o
-- JOIN sql_store.customers AS c
-- 	ON o.customer_id=c.customer_id

-- USE sql_hr;
-- SELECT *
-- FROM employees e
-- JOIN employees m
-- 	ON e.reports_to=m.employee_id;


-- USE sql_store;
-- SELECT *
-- FROM orders o
-- JOIN customers c
-- 	USING(customer_id)
-- JOIN shippers s
-- 	USING (shipper_id);


-- SELECT *
-- FROM customers AS c, orders AS o
-- WHERE c.customer_id=o.customer_id;



-- SELECT *
-- FROM customers AS c
-- LEFT JOIN orders AS o
-- 	USING(customer_id);


-- SELECT *
-- FROM customers AS c
-- LEFT JOIN orders AS o
-- 	USING(customer_id)
-- LEFT JOIN shippers AS s
-- 	USING(shipper_id)


-- SELECT *
-- FROM customers AS c
-- NATURAL JOIN orders AS o



-- SELECT *
-- FROM customers AS c
-- CROSS JOIN orders AS o


-- SELECT *
-- FROM customers, orders

-- SELECT 
-- 	order_id,
--     customer_id,
--     order_date,
-- 	'ACTIVE' AS status
-- FROM orders
-- UNION
-- SELECT 
-- 	order_id,
--     customer_id,
--     order_date,
--     'ARCHIVE' AS status
-- FROM orders



-- practise
 -- USE sql_store;
 
 -- SELECT p.product_id, name, quantity, oi.unit_price
--  FROM order_items AS oi
--  JOIN products AS p
--  ON oi.product_id=p.product_id;



-- USE sql_invoicing;
-- SELECT
-- 	c.client_id,
-- 	p.date,
--     p.invoice_id,
--     p.amount,
--     c.name,
--     pm.name
-- FROM payments AS p
-- JOIN clients AS c
-- 	ON p.client_id=c.client_id
-- JOIN payment_methods AS pm
-- 	ON p.payment_id=pm.payment_method_id;























