duckdb.sql("""
    WITH prevMammo AS(
    SELECT
        v.mrn
    FROM charges as c
    JOIN 'Data Sets/Imaging Center Data/chgMast_cleaned_SQL.csv' as m
        ON c.chgNo = m.chgNo
    JOIN 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
        ON c.acctNum = v.acctNum
    WHERE m.revCode IN(0401, 0403)
    )
    SELECT
        COUNT(DISTINCT v.mrn) as "Females > 40 W/Out Previous Mammo"
    FROM 'Data Sets/Imaging Center Data/charges_cleaned_SQL.csv' as c
    JOIN 'Data Sets/Imaging Center Data/chgMast_cleaned_SQL.csv' as m
        ON c.chgNo = m.chgNo
    JOIN 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
        ON c.acctNum = v.acctNum
    WHERE v.zip = 30547
    AND DATE_ADD(v.DOB, INTERVAL 40 YEAR) < current_date
""")