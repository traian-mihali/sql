-- Write a stored procedured called get_payments with two default parameters
-- client_id INT
-- payment_method_id TINYINT

USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_payments;

DELIMITER $$
CREATE PROCEDURE get_payments(
	client_id INT, 
	payment_method_id TINYINT
)
BEGIN
	SELECT 
		p.payment_id, 
		p.client_id, 
		pm.payment_method_id, 
        pm.name
	FROM payments p
	JOIN payment_methods pm
		ON p.payment_method = pm.payment_method_id
	WHERE p.client_id = IFNULL(client_id, p.client_id) 
    AND pm.payment_method_id = IFNULL(payment_method_id, pm.payment_method_id);
END$$

DELIMITER ;


CALL get_payments(NULL, NUll);
CALL get_payments(5, NUll);
CALL get_payments(NULL, 1);
CALL get_payments(5, 2);