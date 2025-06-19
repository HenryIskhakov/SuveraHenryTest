SELECT pc.pcn_name, COUNT(*) FROM dim_patients p
LEFT JOIN dim_practices pr ON p.practice_id = pr.practice_id
LEFT JOIN dim_pcns pc ON pr.pcn_id = pc.pcn_id
GROUP BY pc.pcn_name
