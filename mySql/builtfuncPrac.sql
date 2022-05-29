-- USE sql_store;
-- SELECT *
-- FROM orders
-- WHERE YEAR(order_date)= YEAR(NOW())-

-- USE sql_store;
-- SELECT 
-- 	CONCAT(first_name,'	', last_name) AS customer,
--     IFNULL(phone,'Unknown') AS phone
--     ,coalesce(phone,'Unknown') AS phone
-- FROM  customers;


-- SELECT 
-- 	product_id,
--     name,
--     COUNT(product_id) as orders,
-- 	IF(COUNT(product_id)=1,'ONCE', 'Many times') as frequency
-- FROM products
-- JOIN order_items
-- 	USING(product_id)
-- GROUP BY product_id,
-- 		name


SELECT 
	CONCAT(first_name,'	',last_name) AS full_name,
    points,
    CASE
		WHEN points <2000 THEN 'Bronze'
        WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
        -- WHEN points BETWEEN 3000 AND 4000 THEN 'Gold'
		-- ELSE 'No category'
		ELSE 'Gold'
	END AS category
FROM customers
ORDER BY points DESC