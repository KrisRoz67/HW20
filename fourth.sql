-- Найти общий доход, полученный от всех заказов,
-- сделанных каждым покупателем.

SELECT SUM(product.price)
FROM customer_order
INNER JOIN product ON product.id=customer_order.product_id;
