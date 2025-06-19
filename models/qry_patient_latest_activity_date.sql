SELECT p.patient_id, MAX(activity_date) FROM dim_patients p
LEFT JOIN fact_activities a ON p.patient_id = a.patient_id
GROUP BY p.patient_id
ORDER BY p.patient_id