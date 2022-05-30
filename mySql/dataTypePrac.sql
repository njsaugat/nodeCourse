-- SELECT product_id,JSON_EXTRACT(properties,'$.weight')
-- FROM products
-- WHERE product_id=1;

-- SELECT product_id, properties -> '$.weight' 
-- FROM products
-- WHERE product_id=1;

-- SELECT product_id, properties -> '$.manufacturer' 
-- FROM products
-- WHERE product_id=1;

-- SELECT product_id, properties ->> '$.manufacturer.name' 
-- FROM products
-- WHERE product_id=1;

SELECT product_id 
FROM products
WHERE properties ->> '$.manufacturer.name'='sony';