-- NUMERIC FUNCTIONS
-- SELECT ROUND(3.425,2)
-- SELECT TRUNCATE(3.3243,3)
-- SELECT ceiling(342.4343)
-- SELECT FLOOR (342.4343)
-- SELECT RAND()


-- STRING FUNCTION 
-- SELECT length('SKY')
-- SELECT upper('sddfs')
-- SELECT LOWER('SDFKLDSEO')
-- SELECT  ltrim('           JFSLDKJ;FD')
-- SELECT  rtrim('JFSLDKJ;DSF		')
-- SELECT  trim('           JFSLDKJ;DSF		')
-- SELECT LEFT('RACECAR',4)
-- SELECT RIGHT('RACECAR',3)
-- SELECT SUBSTRING('RACECAR',5,3)
-- SELECT LOCATE('A','pineapple')
-- SELECT REPLACE('pineapple','apple','wine')
-- SELECT CONCAT('FIRST','lastName')

-- USE sql_store;
-- SELECT 
-- 	CONCAT(first_name,'	',last_name) AS full_name,
--     phone,address,state,city,points
-- FROM customers
 

-- TIME AND DATE FUNCTION
-- SELECT NOW(),CURDATE(),CURTIME()

-- SELECT DATE(NOW())


-- SELECT YEAR(NOW())
-- SELECT MONTH(NOW())
-- SELECT DAY(NOW())

-- SELECT TIME(NOW())
-- SELECT HOUR(NOW())
-- SELECT MINUTE(NOW())
-- SELECT SECOND(NOW())


-- SELECT DAYNAME(NOW())
-- SELECT MONTHNAME(NOW())

-- SELECT EXTRACT(YEAR FROM NOW())
-- SELECT 	date_format(NOW(), '%M %D %Y')
-- SELECT time_format(now(), '%H:%i %p')

-- SELECT DATE_ADD(NOW(), INTERVAL 1 DAY)
-- SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR)
-- SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR)
-- SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR)
-- SELECT DATEDIFF(NOW(), '2022-05-01')
-- SELECT time_to_sec(CURTIME())



USE sql_store;

-- SELECT 
-- 	order_id,
--     IFNULL(shipper_id,'Not Assigned') AS shipper
-- FROM orders


-- SELECT 
-- 	order_id,
--     COALESCE(shipper_id,comments, 'NOT assigned') as shipper
-- FROM orders


-- SELECT 
-- 	order_id,
--     order_date,
--     IF(YEAR(NOW())-3=YEAR(order_date),
-- 		'Active',
-- 		'Archive') as status
-- FROM orders


SELECT 
	order_id,
    order_date, 
    CASE 
		WHEN YEAR(order_date)=YEAR(NOW())-3 THEN 'Active'
        WHEN YEAR(order_date)=YEAR(NOW())-4 THEN 'LAST year'
        WHEN YEAR(order_date)<YEAR(NOW()) THEN 'Archive'
        ELSE 'FUTUTE'
	END as category
FROM orders

	


