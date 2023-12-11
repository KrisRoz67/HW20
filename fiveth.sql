-- Найдите товар, который был куплен
-- наибольшим количеством покупателей.
SELECT name, product_id, count(customer_id)
FROM customer_order INNER JOIN product ON product.id = customer_order.product_id
GROUP BY product_id, name
HAVING count(customer_id)=(
    SELECT MAX(orders_count) FROM (
        SELECT count(customer_id) as orders_count
               FROM customer_order
               GROUP BY product_id
               ) as new);

UPDATE customer_order
SET  product_id = 1, customer_id = 2
WHERE id=9;