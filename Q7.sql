WITH ranked AS (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY buyer_id
            ORDER BY purchase_time
        ) AS rn
    FROM transactions t
)
SELECT *
FROM ranked
WHERE rn = 2
ORDER BY buyer_id, purchase_time;
