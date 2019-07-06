-- Transactions and Concurrency
-- Transactions - a group of SQL statements that represent a single unit of work
-- ACID properties
-- Atomicity
-- Consistency
-- Isolation
-- Durability

-- Common Concurrency problems
-- Lost updates (fixed with locks)
-- Dirty reads (fixed with read committed isolation level)
-- Non-repeating reads (fixed with repeatable read isolation level)
-- Phantom reads (fixed with serializable isolation level)

-- Transaction Isolation levels
-- Read uncommitted
-- Read committed
-- Repeatable read
-- Serializable

USE sql_store;

SHOW VARIABLES LIKE 'transaction_isolation';
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT points
FROM customers
WHERE customer_id = 1;
COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT *
FROM customers
WHERE state = 'VA';
COMMIT;