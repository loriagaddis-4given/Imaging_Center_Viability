duckdb.sql("""
    SELECT
        CASE
            WHEN m.revCode IN(0320, 0321, 0322, 0323, 0324, 0329) THEN 'Diagnostic X-Rays'
            WHEN m.revCode IN(0401, 0403) THEN 'Mammography'
            WHEN m.revCode IN(0402) THEN 'Ultrasound'
            WHEN m.revCode IN(0350, 0351, 0352, 0359) THEN 'CT'
            WHEN m.revCode IN(0610, 0611, 0612, 0614, 0615, 0616) THEN 'MRA/MRI'
            ELSE m.revCode
        END AS "Modality",
        SUM(c.qty) as "Exams/Modality",
        CAST(SUM((c.qty * m.chgAmt)) AS DECIMAL(12,2)) as "Revenue/Modality"
    FROM 'Data Sets/Imaging Center Data/charges_cleaned_SQL.csv' as c
    JOIN 'Data Sets/Imaging Center Data/chgMast_cleaned_SQL.csv' as m
        ON c.chgNo = m.chgNo
    JOIN 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
        ON c.acctNum = v.acctNum
    WHERE v.zip = 30547
    GROUP BY "Modality"
""")
