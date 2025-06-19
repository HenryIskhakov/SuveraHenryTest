WITH cte_patients AS
(
SELECT 
    TRY_CAST(patient_id AS INT) AS patient_id
    , TRY_CAST(practice_id AS INT) AS practice_id
    , REPLACE(gender, '"', '') AS gender
    , TRY_CAST(age AS INT) AS age
    , TRY_CAST(REPLACE(registration_date, '"', '') AS DATE) AS registration_date 
    , REPLACE(email, '"', '') AS email
    , REPLACE(phone, '"', '') AS phone
    , REPLACE(conditions_json, '"', '') AS conditions_json
FROM  {{ ref('stg_patients') }}
) 
SELECT * FROM cte_patients cp1
