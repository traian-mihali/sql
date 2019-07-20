-- Views

USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
    invoice_id,
    c.name,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance
FROM invoices
    JOIN clients c   
	USING(client_id);

-- Updateble Views do not contain the following:
-- DISTINCT
-- Aggregate Functions(MIN, MAX, SUM, etc)
-- GROUP BY / HAVING
-- UNION

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL
2 DAY)
WHERE invoice_id = 1;