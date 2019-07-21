-- Exercise
-- Create a trigger that gets fired when deleting a payment

DELIMITER $$
CREATE TRIGGER payments_before_delete
	BEFORE DELETE ON payments
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END$$

DELIMITER ;