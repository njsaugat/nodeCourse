-- DELIMITER $$
-- CREATE PROCEDURE get_clients()

-- BEGIN
-- 	SELECT * FROM clients;
-- END $$

-- DELIMITER ;
-- 	 

-- CALL get_clients()


-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- BEGIN
-- 	SELECT * FROM clients c
--     WHERE c.state=state; 
-- END $$

-- DELIMITER ;


-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- BEGIN
-- 	IF state IS NULL THEN
-- 		SET state='CA'; -- setting a default value
-- 	END IF;
-- 	SELECT * FROM clients c
--     WHERE c.state=state; 
-- END $$

-- DELIMITER ;

-- CALL get_clients_by_state('NY')

-- CALL get_clients_by_state(NULL)


-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- BEGIN
-- 	IF state IS NULL THEN
-- 		SELECT * FROM clients c;
-- 	ELSE
-- 		SELECT * FROM clients c
-- 		WHERE c.state=state; 
-- 	END IF;
-- 	
-- END $$

-- DELIMITER ;


-- CALL get_clients_by_state('ca')




-- another way: 
-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- BEGIN
-- 	SELECT * FROM clients c
--     WHERE c.state=IFNULL(state,c.state); 
-- END $$

-- DELIMITER ;

-- DROP PROCEDURE IF EXISTS make_payment;
-- DELIMITER $$
-- CREATE PROCEDURE `make_payment`(
-- 	invoice_id INT,
--     payment_amount DECIMAL(9,2),
--     payment_date DATE
-- )
-- BEGIN
-- 	IF payment_amount <=0 THEN 
-- 		SIGNAL SQLSTATE '22003'
-- 			SET MESSAGE_TEXT='Invalid payment amount';
-- 	END IF;
-- 	UPDATE invoices i
--     SET 
-- 		i.payment_total=payment_amount,
--         i.payment_date=payment_date
-- 	WHERE i.invoice_id=invoice_id; 
-- END $$

-- DELIMITER ;

 
-- call make_payment(2,100,'2019-01-01')

-- DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;
-- DELIMITER $$

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
-- END
-- DELIMITER ;

-- call get_unpaid_invoices_for_client(3)
	 
     

-- USE `sql_invoicing`;
-- DROP procedure IF EXISTS `get_risk_factor`;

-- DELIMITER $$
-- USE `sql_invoicing`$$
-- CREATE PROCEDURE `get_risk_factor` ()
-- BEGIN
	-- DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
-- 	DECLARE invoices_total DECIMAL(9,2);
--     DECLARE invoices_count INT;
--     
--     SELECT COUNT(*), SUM(invoice_total)
--     INTO invoices_count,invoices_total
--     FROM invoices;
--     
--     SET risk_factor=invoices_total/invoices_count * 5;
--     SELECT risk_factor;
-- END$$

-- DELIMITER ;


-- USE `sql_invoicing`;
-- DROP function IF EXISTS `get_risk_factor_client`;

-- USE `sql_invoicing`;
-- DROP function IF EXISTS `sql_invoicing`.`get_risk_factor_client`;
-- ;

-- DELIMITER $$
-- USE `sql_invoicing`$$
-- CREATE DEFINER=`root`@`localhost` FUNCTION `get_risk_factor_client`(
-- 	client_id INT
-- ) RETURNS int
--     READS SQL DATA
-- BEGIN
-- 	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
-- 	DECLARE invoices_total DECIMAL(9,2);
--     DECLARE invoices_count INT;
--     
--     SELECT COUNT(*), SUM(invoice_total)
--     INTO invoices_count,invoices_total
--     FROM invoices i
--     WHERE i.client_id=client_id;
--     
--     SET risk_factor=invoices_total/invoices_count * 5;

--     
-- RETURN IFNULL(risk_factor,0);
-- END$$

-- DELIMITER ;
-- ;



SELECT 
	client_id,
	name,
    get_risk_factor_client(client_id)
FROM clients


