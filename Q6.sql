SELECT
    t.*,
    CASE
        WHEN refund_time IS NOT NULL
         AND DATEDIFF(HOUR, purchase_time, refund_time) <= 72
        THEN 1
        ELSE 0
    END AS refund_can_be_processed
FROM transactions t;
