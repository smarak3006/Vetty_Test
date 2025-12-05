SELECT
    CONVERT(char(7), purchase_time, 120) AS purchase_month,  -- YYYY-MM
    COUNT(*) AS purchase_count
FROM transactions
WHERE refund_time IS NULL
GROUP BY CONVERT(char(7), purchase_time, 120)
ORDER BY purchase_month;


