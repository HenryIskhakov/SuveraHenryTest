WITH cte_inferred AS
( 
    SELECT DISTINCT TRY_CAST(practice_id AS INT) AS practice_id FROM {{ ref('stg_patients') }} 
    WHERE practice_id NOT IN
    (
        SELECT id FROM {{ ref('stg_practices') }} 
    )
)  
SELECT id AS practice_id, practice_name, location, established_date, pcn AS pcn_id FROM  {{ ref('stg_practices') }}
UNION
SELECT practice_id, '(Inferred)', '(Unknown)', NULL, -1 FROM cte_inferred ci1
WHERE practice_id > 0
-- We can add -1 ('(Unknown)') for practices too
