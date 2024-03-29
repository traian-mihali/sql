USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
    invoice_id,
    c.name,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
JOIN clients c USING(client_id)
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION;