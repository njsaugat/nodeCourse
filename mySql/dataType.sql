USE sql_store;
-- UPDATE products
-- SET properties='
-- {
-- 	"dimensions" :[1,2,3],
--     "weight": 10,
--     "manufacturer" :{"name":"sony"}
-- }
-- '
-- WHERE product_id=1;

UPDATE products
SET properties=JSON_OBJECT(
		'weight',10,
        'dimesnions',JSON_ARRAY(2,3,4),
        'manufacturer',JSON_OBJECT('name','sony')
		)
WHERE product_id=2;