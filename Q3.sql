SELECT
    store_id,
    MIN(DATEDIFF(MINUTE, purchase_time, refund_time)) AS min_refund_interval_minutes
FROM transactions
WHERE refund_time IS NOT NULL
GROUP BY store_id
ORDER BY store_id;