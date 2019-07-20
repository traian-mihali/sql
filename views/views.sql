-- Views
-- Updatable Views cannot contain the following:
-- DISTINCT
-- Aggregate Functions(MIN, MAX, SUM, etc)
-- GROUP BY / HAVING
-- UNION

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL
2 DAY)
WHERE invoice_id = 1;

-- WITH CHECK OPTION
-- prevents update or delete to exclude rows from the view
-- added at the end when creating a view