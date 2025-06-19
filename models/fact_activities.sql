SELECT * FROM {{ ref('stg_activities') }}
WHERE patient_id IN
-- Filtering out patients that we don't have in dimension
(SELECT patient_id FROM {{ ref('dim_patients') }})
