-- Exercise
-- CREATE a stored procedure called get_invoices_with_balance
-- to return all the invoices with a balance greater than 0
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_invoices_with_balance;

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT *
    FROM invoices_with_balance
    WHERE balance > 0;
END$$

DELIMITER ;

CALL get_invoices_with_balance();