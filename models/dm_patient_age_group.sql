-- In my designs such views go to DM (DataMart) level
SELECT 0 AS AgeMin, 18 AS AgeMax, '0-18' AgeGroup
UNION 
SELECT 19, 35, '19-35'
UNION 
SELECT 36, 50, '36-50'
UNION 
SELECT 51, 100, '51+'