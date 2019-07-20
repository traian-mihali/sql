-- generated from mysql workbench
USE `sql_invoicing`;
DROP procedure IF EXISTS `get_payments`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE `get_payments` ()
BEGIN
	SELECT * FROM payments;
END$$

DELIMITER ;
    
CALL get_payments();