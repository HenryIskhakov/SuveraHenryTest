SELECT id AS pcn_id, pcn_name FROM {{ ref('stg_pcns') }}
UNION
SELECT -1, '(Unknown)'

