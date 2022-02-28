
--  where --> id = 12 most common case
--  customer_name --> IS NULL occation that we use IS

-- SELECT * FROM sales;

-- SELECT * FROM sales WHERE volume > 20;

-- SELECT * FROM sales WHERE is_recurring IS TRUE;

SELECT * FROM sales WHERE is_recurring IS TRUE AND volume > 10;

