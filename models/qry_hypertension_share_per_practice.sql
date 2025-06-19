SELECT 
practice_name
, ROUND(1. * SUM(CASE WHEN conditions_json LIKE '%hypertension%' THEN 1 ELSE 0 END) 
 / COUNT(patient_id), 3) AS share
FROM dim_patients p
JOIN dim_practices pr ON p.practice_id = pr.practice_id
GROUP BY pr.practice_name
