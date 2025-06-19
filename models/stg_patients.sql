SELECT
  json_extract(data, '$.patient_id') AS patient_id,
  json_extract(data, '$.practice_id') AS practice_id,
  json_extract(data, '$.gender') AS gender,
  json_extract(data, '$.age') AS age,
  json_extract(data, '$.registration_date') AS registration_date,
  json_extract(data, '$.contact.email') AS email,
  json_extract(data, '$.contact.phone') AS phone,
  json_extract(data, '$.conditions') AS conditions_json
FROM {{ ref('raw_patients') }}
