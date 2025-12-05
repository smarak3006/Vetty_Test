WITH store_orders AS (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY purchase_time
        ) AS rn
    FROM transactions t
)
SELECT
    store_id,
    buyer_id,
    purchase_time,
    gross_transaction_value
FROM store_orders
WHERE rn = 1
ORDER BY store_id;
