WITH cte_deduplicated AS
(
SELECT *, ROW_NUMBER() OVER(PARTITION BY patient_id ORDER BY registration_date DESC) AS row_id FROM {{ ref('int_patients') }}
)
SELECT 
    d1.patient_id
    , COALESCE(d1.practice_id, d2.practice_id) AS practice_id
    , COALESCE(d1.gender, d2.gender) AS gender
    , COALESCE(d1.age, d2.age, -1) AS age
    , d1.registration_date
    , COALESCE(d1.email, d2.email) AS email
    , COALESCE(d1.phone, d2.phone) AS phone
    , COALESCE(d1.conditions_json, d2.conditions_json) AS conditions_json
FROM cte_deduplicated d1
LEFT JOIN cte_deduplicated d2
ON d1.patient_id = d2.patient_id AND d1.row_id = 1 AND d2.row_id = 2
WHERE d1.row_id = 1

