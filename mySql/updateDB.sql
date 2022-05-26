-- AN sql file to practise insert update and delete qureries in sql
-- USE sql_store;
-- INSERT INTO customers
-- 	VALUES (
--     DEFAULT,
--     'John',
--     'Smilga',
--     '2000-01-01',
--     NULL,
--     'Diamond St',
--     'Beaverton',
--     'OR',
--     323);
-- USE sql_store;



-- THE other way to insert is like declaring all the columns, and then supplying values

-- INSERT INTO customers(
-- -- 	customer_id,
-- -- 	first_name,
-- --     last_name,
-- --     birth_date,
-- --     address,
-- --     city,
-- --     state,
-- 	customer_id,	
-- 	first_name,	
-- 	last_name,	
-- 	birth_date,	
-- 	phone,
-- 	address,
-- 	city,	
-- 	state	
-- 	,points	
-- )
-- 	VALUES (
-- 		DEFAULT,
-- 		'Sam',
-- 		'Phil',
-- 		'2000-08-24',
--         NULL,
-- 		'21 Choclate',
-- 		'Silver Street',
-- 		'AT',
--         DEFAULT
-- 	)


-- INSERT INTO shippers(name)
-- 	VALUES
-- 		('Nvidia LLC'),
-- 		('Qualcom INC'),
--         ('Chips MNC')



-- order is  parent and order_items is child

-- INSERT INTO orders(customer_id,order_date,status)
-- VALUES (2,'2019-07-02',1);
-- INSERT INTO order_items
-- 	VALUES(LAST_INSERT_ID(),1,1,3.33),
-- 		(LAST_INSERT_ID(),2,3,2.33),
-- 		(LAST_INSERT_ID(),3,5,1.39)

-- CREATE TABLE orders_archived AS 
-- SELECT * FROM orders;


-- now we created the table and truncated its value as we didnt't want to 
--   exactly copy all the values; but only copy certain values;
-- tyo Insert statement ma ni we could send a sub-query so 

-- INSERT INTO orders_archived
-- SELECT *
-- FROM orders
-- WHERE order_date<'2019-01-01' 

-- USE sql_invoicing;
-- UPDATE invoices
-- SET payment_total=32.33, payment_date='2019-07-11'
-- WHERE invoice_id=6;



-- USE sql_invoicing;
-- UPDATE invoices 
-- SET payment_total=invoice_total*0.5
-- WHERE client_id IN
-- 	(SELECT client_id
-- 	FROM clients
-- 	WHERE state IN ('CA','NY'))

