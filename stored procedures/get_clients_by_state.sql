-- Parameters
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	IF state IS NULL THEN
		SET state = 'CA';
	END IF;
    
	SELECT *
	FROM clients c
    WHERE c.state = state;
END$$

DELIMITER ;

CALL get_clients_by_state(NULL);
CALL get_clients_by_state('NY');