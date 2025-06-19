SELECT pcn_name, AgeGroup, count(*)
FROM
(
	select p.pcn_name, pa.patient_id, pag.AgeGroup from dm_patients_age pa 
	JOIN dm_patient_age_group pag ON pa.Age between pag.AgeMin AND pag.AgeMax
	JOIN dim_practices pr ON pr.practice_id = pa.practice_id
	JOIN dim_pcns p ON pr.pcn_id = p.pcn_id
)
GROUP BY  pcn_name, AgeGroup
ORDER BY  pcn_name, AgeGroup

