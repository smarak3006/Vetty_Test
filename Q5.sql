WITH buyer_first AS (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY buyer_id
            ORDER BY purchase_time
        ) AS rn
    FROM transactions t
),
first_only AS (
    SELECT store_id, item_id
    FROM buyer_first
    WHERE rn = 1
)
SELECT TOP 1
    i.item_name,
    COUNT(*) AS first_purchase_count
FROM first_only f
JOIN items i
  ON f.store_id = i.store_id
 AND f.item_id  = i.item_id
GROUP BY i.item_name
ORDER BY first_purchase_count DESC, i.item_name;
