SELECT a.patient_id, TRY_CAST(MIN(activity_date) AS DATE) AS First_Activity_Date, TRY_CAST(MAX(activity_date) AS DATE) AS Last_Activity_Date 
FROM fact_activities a
JOIN dim_patients p ON p.patient_id = a.patient_id
GROUP BY a.patient_id