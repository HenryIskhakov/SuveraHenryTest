SELECT pr.practice_name, ROUND(AVG(1. * Age), 1) from dm_patients_age p
LEFT JOIN dim_practices pr ON p.practice_id = pr.practice_id
GROUP BY pr.practice_name