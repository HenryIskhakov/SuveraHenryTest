select fl.patient_id, MIN(fl.First_Activity_Date) AS First_Activity_Date, CAST(MIN(a.activity_date) AS DATE) AS Second_Activity_Date 
from dm_patient_first_and_last_activity_dates fl
join fact_activities a ON a.patient_id = fl.patient_id 
join dim_patients p ON p.patient_id = a.patient_id
where CAST(a.activity_date AS DATE)  > fl.First_Activity_Date
group by fl.patient_id
having DATE_ADD(MIN(fl.First_Activity_Date), INTERVAL 3 month) < CAST(MIN(a.activity_date) AS DATE) 

UNION ALL

select fl2.patient_id, fl2.First_Activity_Date, fl2.Last_Activity_Date FROM dm_patient_first_and_last_activity_dates fl2
WHERE fl2.First_Activity_Date = fl2.Last_Activity_Date
AND DATE_ADD(fl2.First_Activity_Date, INTERVAL 3 month) < TODAY()
