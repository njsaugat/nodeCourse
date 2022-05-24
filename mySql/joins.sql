-- USE sql_store;

-- SELECT 
-- name,
-- unit_price,
-- (unit_price*1.1) AS 'new price' 
-- FROM products;

-- SELECT *
-- FROM orders
-- WHERE (order_date>='2019-01-01' AND order_date< '2019-12-31' );


-- SELECT *
-- FROM order_items
-- WHERE order_id = 6 AND quantity*unit_price>30;

-- SELECT *
-- FROM products
-- WHERE quantity_in_stock IN (49,38,72);


-- SELECT *
-- FROM customers
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


-- SELECT *
-- FROM customers
-- WHERE address LIKE '%TRAIL%' 
-- 	OR address LIKE '%AVENUE%';
-- -- WHERE phone LIKE '%9';


-- SELECT *
-- FROM customers
-- -- WHERE first_name REGEXP 'elka|ambur'
-- -- WHERE last_name REGEXP 'EY$|ON$'
-- -- WHERE last_name REGEXP '^MY|SE'
-- WHERE last_name REGEXP 'b[ru]';

-- SELECT *
-- FROM orders
-- WHERE shipped_date IS NOT NULL;

-- SELECT *
-- FROM customers
-- ORDER BY first_name DESC ;

-- SELECT *, quantity* unit_price AS total_price
-- FROM order_items
-- WHERE order_id=2
-- -- ORDER BY (quantity * unit_price) DESC
-- ORDER BY (total_price) DESC

-- SELECT *
-- FROM customers
-- ORDER BY points DESC
-- LIMIT 3;

-- USE sql_store;
-- SELECT *
-- FROM customers;

-- SELECT *
-- FROM customers
-- WHERE customer_id>2;
-- WHERE state='fl' AND points<= 1000;
-- WHERE state='ca' OR birth_date>'1990-02-01'
-- WHERE NOT points >2999;
-- WHERE state IN ('FL','CO' ,'CA');
-- WHERE phone LIKE '%7%';
-- WHERE birth_date LIKE '199%'
-- WHERE first_name REGEXP 'elka|t'
-- WHERE address REGEXP '[0-9]5|3'
-- WHERE last_name REGEXP 'boa|nas|^t'
-- WHERE points BETWEEN 1000 AND 2666;
-- WHERE phone IS NULL;
-- WHERE points>500 AND birth_date<'1990-01-01'
-- ORDER BY points DESC, birth_date
-- LIMIT 2,3;



-- SELECT *
-- FROM orders AS o
-- JOIN customers AS c
-- 	ON o.customer_id=c.customer_id
--     


-- -- implicit  join in MySQL
-- SELECT *
-- FROM orders AS o, customers AS c
-- WHERE o.customer_id=c.customer_id;

-- SELECT 
-- 	c.customer_id,
--     c.first_name,
--     o.order_id
-- FROM customers AS c
-- LEFT JOIN orders AS o
-- 	ON c.customer_id=o.customer_id
-- ORDER BY c.customer_id


-- SELECT 
-- 	c.customer_id,
--     o.order_date,
--     o.status,
--     o.comments,
--     o.shipped_date,
--     s.shipper_id
-- FROM customers AS c
-- LEFT JOIN orders AS o
-- 	ON c.customer_id=o.customer_id
-- LEFT JOIN shippers AS s
-- 	ON o.shipper_id=s.shipper_id
-- ORDER BY c.customer_id


-- USE sql_hr;

-- SELECT 
-- 	e.employee_id,
--     e.first_name,
--     m.first_name 
-- FROM employees e
-- JOIN employees m
-- 	ON e.reports_to=m.employee_id

-- USE sql_store;
-- SELECT 
-- 	o.order_id,
--     c.first_name,
--     s.name
-- FROM orders o
-- JOIN customers c
-- 	-- ON o.customer_id=c.customer_id
-- 	USING (customer_id)
-- LEFT JOIN shippers s
-- 	USING  (shipper_id)



-- SELECT *
-- FROM order_items oi
-- JOIN order_item_notes oin 
-- 	USING (order_id, product_id )

-- USE sql_store;
-- SELECT *
-- FROM orders o
-- NATURAL JOIN customers c



-- SELECT 
-- 	c.first_name,
--     p.name
-- FROM customers c
-- CROSS JOIN products p
-- ORDER BY c.first_name;


-- SELECT 
-- 	order_id,
--     order_date,
--     -- customer_id,
--     'ACTIVE' AS status
-- FROM orders
-- WHERE order_date>='2019-01-01'
-- UNION
-- SELECT 
-- 	order_id,
--     order_date,
--     'ARCHIVE' AS status
-- FROM orders
-- WHERE NOT order_date>='2019-01-01'


-- SELECT first_name
-- FROM customers
-- UNION
-- SELECT name
-- FROM shippers
