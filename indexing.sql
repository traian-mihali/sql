-- Indexing --
USE sql_store;

EXPLAIN SELECT customer_id
FROM customers
WHERE points > 1000;

CREATE INDEX idx_state ON customers (state);
CREATE INDEX idx_points ON customers (points);

ANALYZE TABLE customers;
SHOW INDEXES IN customers;
SHOW INDEXES in orders;

-- Prefix Indexes --
SELECT 
	COUNT(DISTINCT LEFT(last_name, 1)) as distinct_last_name,
	COUNT(DISTINCT LEFT(last_name, 5)) as distinct_last_name,
    COUNT(DISTINCT LEFT(last_name, 10)) as distinct_last_name 
FROM customers;

CREATE INDEX idx_last_name ON customers(last_name(5));

-- Full Text Indexes --
USE sql_blog;

CREATE FULLTEXT INDEX idx_title_body ON posts(title, body);

SELECT *, MATCH(title, body) AGAINST ('react -redux +form') as relevance_score
FROM posts
WHERE MATCH(title, body) AGAINST ('react -redux +form' IN BOOLEAN MODE);

SHOW INDEXES IN posts;

-- Composite Indexes --
USE sql_store;

Show INDEXES in customers;
CREATE INDEX idx_state_points ON customers (state, points);
DROP INDEX idx_points ON customers;
DROP INDEX idx_state ON customers;

EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' AND points > 1000;

-- Order of columns 
-- Frequently used > High Cardinality > Check queries

SELECT 
	COUNT(DISTINCT last_name) as lastname_cardinality, 
    COUNT(DISTINCT state) as state_cardinality
FROM customers;

CREATE INDEX idx_lastname_state ON customers (last_name, state);
CREATE INDEX idx_state_lastname ON customers (state, last_name);

EXPLAIN SELECT customer_id
FROM customers
USE INDEX (idx_lastname_state)
WHERE state = 'NY' AND last_name LIKE 'A%';

CREATE INDEX idx_points ON customers (points);

EXPLAIN SELECT customer_id FROM customers WHERE state = 'CA' 
UNION SELECT customer_id FROM customers WHERE points > 1000;
    
-- Using indexes for sorting
-- idx_state_points index
EXPLAIN SELECT customer_id FROM customers ORDER BY state;
-- filesort
EXPLAIN SELECT customer_id FROM customers ORDER BY first_name;

EXPLAIN SELECT customer_id FROM customers ORDER BY state DESC, points DESC;
SHOW STATUS LIKE 'last_query_cost';