-- CREATE DATABASE sql_store2;
-- CREATE DATABASE IF NOT EXISTS sql_store2;
-- USE sql_store2;
-- CREATE TABLE IF NOT EXISTS customers
-- (
-- 	customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     points INT NOT NULL DEFAULT 0,
--     email VARCHAR(255) NOT NULL UNIQUE
-- );

-- USE sql_store2;
-- ALTER TABLE customers
-- 	-- ADD last_name VARCHAR(50) NOT NULL AFTER first_name,
--     ADD city 	  VARCHAR(50) NOT NULL,
--     MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',
--     DROP points
-- ;


-- CREATE TABLE IF NOT EXISTS orders
-- (
-- 	order_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_id INT NOT NULL,
--     FOREIGN KEY fk_orders_customers(customer_id)
-- 		REFERENCES customers (customer_id)
--         ON UPDATE CASCADE
--         ON DELETE NO ACTION
-- 		
-- ); 



-- ALTER TABLE orders
-- 	ADD PRIMARY KEY(order_id),
--     DROP PRIMARY KEY,
-- 	DROP FOREIGN KEY fk_orders_customers,
--     ADD FOREIGN KEY fk_orders_customers(customer_id) -- syntax like previous stuff only
-- 		REFERENCES customers(customer_id)
--         ON UPDATE CASCADE
--         ON DELETE NO ACTION
-- ;

  