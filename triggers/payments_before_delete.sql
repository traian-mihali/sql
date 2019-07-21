-- Exercise
-- Create a trigger that gets fired when deleting a payment
USE sql_invoicing;
DROP TRIGGER IF EXISTS payments_before_delete;

DELIMITER $$
CREATE TRIGGER payments_before_delete
	BEFORE DELETE ON payments
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
	INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date, OLD.amount, "DELETE", NOW());
END$$

DELIMITER ;