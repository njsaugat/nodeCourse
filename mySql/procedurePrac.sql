-- DELIMITER $$

-- CREATE PROCEDURE get_invoices_with_balance()
-- BEGIN
-- 	SELECT *
--     FROM invoice_balance;
-- END $$

-- DELIMITER ; 


-- USE `sql_invoicing`;
-- DROP procedure IF EXISTS `get_payments`;

-- DELIMITER $$
-- USE `sql_invoicing`$$
-- CREATE PROCEDURE `get_payments` ()
-- BEGIN
-- 	SELECT * FROM payments;
-- END$$

-- DELIMITER ;




-- DROP procedure IF EXISTS `get_invoices_by_clients`;

-- DELIMITER $$
-- USE `sql_invoicing`$$
-- CREATE PROCEDURE `get_invoices_by_clients` (id int)
-- BEGIN
-- 	SELECT * 
--     FROM payments AS p
--     WHERE p.client_id=id;
-- END$$

-- DELIMITER ;


-- CALL get_invoices_by_clients(3);









-- DROP PROCEDURE IF EXISTS get_payments;
-- DELIMITER $$
-- CREATE PROCEDURE get_payments(client_id INT, payment_method_id TINYINT)
-- BEGIN
-- 	SELECT *
--     FROM payments AS p
-- 	WHERE 
-- 		p.client_id=IFNULL(client_id,p.client_id) AND
-- 		p.payment_method =IFNULL(payment_method_id,p.payment_method) ;
-- END $$

-- DELIMITER ;

-- USE `sql_invoicing`;
-- DROP procedure IF EXISTS `get_unpaid_invoices_for_client`;

-- DELIMITER $$
-- USE `sql_invoicing`$$
-- CREATE PROCEDURE `get_unpaid_invoices_for_client`
-- (
-- 	client_id INT,
--     OUT invoices_count INT,
--     OUT invoices_total DECIMAL(9,2)
-- )
-- BEGIN 
-- 	SELECT COUNT(*),SUM(invoice_total)
-- 	INTO invoices_count,invoices_total
-- 	FROM invoices i
--     WHERE i.client_id=client_id
-- 		 AND payment_total=0;
-- END$$

-- DELIMITER ;


-- CALL get_payments(NULL,2);


