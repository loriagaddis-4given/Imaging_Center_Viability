duckdb.sql("""
    WITH prevMammo AS(
    SELECT
        v.mrn as "subMRN"
    FROM 'Data Sets/Imaging Center Data/charges_cleaned_SQL.csv' as c
    JOIN 'Data Sets/Imaging Center Data/chgMast_cleaned_SQL.csv' as m
        ON c.chgNo = m.chgNo
    JOIN 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
        ON c.acctNum = v.acctNum
    WHERE m.description LIKE 'MM %'
    GROUP BY v.mrn
    HAVING SUM(c.qty) > 0
    )
    SELECT
        COUNT(DISTINCT v.mrn) as "Females >= 40 W/Out Previous Mammo"
    FROM 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
    LEFT JOIN prevMammo AS p
        ON p.subMRN = v.mrn
    WHERE v.zip = 30547
    AND date_sub('year', v.DOB, CURRENT_DATE) >= 40
    AND v.sex = 'F'
    AND p.subMRN IS NULL;
""")
