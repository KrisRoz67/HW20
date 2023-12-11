SELECT product_id, product.name, count(product_id)
FROM customer_order
INNER JOIN product ON product.id= customer_order.product_id
GROUP BY product_id,name
HAVING count(product_id)=(
    SELECT MAX(orders_count) FROM(
        SELECT product_id , count(product_id) as orders_count
        FROM customer_order
        GROUP BY product_id
        ) as new
)
ORDER BY product_id ASC;
