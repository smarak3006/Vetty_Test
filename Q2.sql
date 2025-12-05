SELECT COUNT(*) AS stores_with_at_least_5_orders
FROM (
    SELECT store_id, COUNT(*) AS order_count
    FROM transactions
    WHERE purchase_time >= '2020-10-01'
      AND purchase_time <  '2020-11-01'
    GROUP BY store_id
    HAVING COUNT(*) >= 5
) AS x;
