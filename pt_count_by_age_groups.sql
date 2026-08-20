duckdb.sql("""
WITH patientAge AS(
    SELECT 
        v.mrn,
        date_sub('year', v.DOB, CURRENT_DATE) AS AGE
    FROM 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' AS v
    WHERE v.ZIP = 30547)
    SELECT
        CASE
            WHEN patientAge.age <= 18 THEN 'Pediatric'
            WHEN patientAge.age >18 AND patientAge.age < 65 THEN 'Adult'
            WHEN patientAge.age >= 65 then 'Senior'
            ELSE CAST(patientAge.age AS VARCHAR)
        END AS "Age Group",
        COUNT(DISTINCT patientAge.mrn)
    FROM patientAge
    GROUP BY "Age Group"
""")