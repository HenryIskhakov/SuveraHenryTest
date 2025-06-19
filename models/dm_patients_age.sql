WITH cte_patient_age AS
(
    SELECT 
        patient_id
        , practice_id 
        , ABS(age) AS age
    FROM {{ ref('dim_patients') }}
    WHERE age <= 100 -- just an example of handling data quality
)
SELECT * FROM cte_patient_age