-- USE sql_store;
-- SELECT 
-- 	IF(last_name REGEXP 'A',last_name,first_name) 
-- FROM customers

-- SHOW TRIGGERS


-- USE sql_invoicing;
-- DELIMITER $$

-- CREATE TRIGGER payments_after_insert
-- 	AFTER INSERT ON payments
--     FOR EACH ROW
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total=payment_total+ NEW.amount
--     WHERE invoice_id=NEW.invoice_id ;
-- END $$

-- SHOW TRIGGERS

--  TO show how the triggers works, we will insert

-- INSERT INTO payments
-- VALUES (DEFAULT,5,2,'2019-01-09',20,1);

-- USE sql_invoicing;
-- DELIMITER $$
-- CREATE TRIGGER payment_after_delete
-- 	BEFORE DELETE ON payments
--     FOR EACH ROW
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total=payment_total-OLD.amount
--     WHERE invoice_id=OLD.invoice_id;
--     
-- END$$

-- DELIMITER ;

-- DELETE FROM payments 
-- WHERE payment_id=last_insert_id();

-- SHOW TRIGGERS LIKE '%payments%'

-- dropping like we do on functions/procdures















-- DROP TRIGGER IF EXISTS payments_after_insert;

-- DELIMITER $$

-- CREATE TRIGGER payments_after_insert
-- 	AFTER INSERT ON payments
--     FOR EACH ROW
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total=payment_total+ NEW.amount
--     WHERE invoice_id=NEW.invoice_id ;
--     
--     INSERT INTO payments_audit
--     VALUES (NEW.client_id,NEW.date,NEW.amount,'Insert', NOW());
--     
--     
-- END $$


-- DROP TRIGGER IF EXISTS payment_after_delete;
-- DELIMITER $$
-- CREATE TRIGGER payment_after_delete
-- 	BEFORE DELETE ON payments
--     FOR EACH ROW
-- BEGIN
-- 	UPDATE invoices
--     SET payment_total=payment_total-OLD.amount
--     WHERE invoice_id=OLD.invoice_id;
--     INSERT INTO payments_audit
--     VALUES (OLD.client_id,OLD.date,OLD.amount,'Delete', NOW());
--     
-- END$$

-- DELIMITER ;

-- SHOW TRIGGERS


-- INSERT INTO payments
-- VALUES (DEFAULT,5,2,'2019-01-09',20,1);

-- DELETE FROM payments
-- WHERE payment_id=last_insert_id();


-- SHOW VARIABLES LIKE 'event%';
-- SET GLOBAL event_scheduler=ON;

-- DELIMITER $$

-- CREATE EVENT yearly_delete_state_audit_rows
-- ON SCHEDULE
-- 	-- AT '2019-05-01'
--     EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
-- DO BEGIN
-- 	DELETE FROM payments_audit
--     WHERE action_date<NOW()-INTERVAL 1 YEAR;
-- END$$
-- DELIMITER ;

-- SHOW EVENTS;
DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;













