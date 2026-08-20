duckdb.sql("""
    SELECT
        v.acctNum AS "Account #",
        v.mrn AS "Medical Record #",
        v.DOB AS "Date of Birth",
        v.sex as "Gender",
        v.admitDate as "Admit Date",
        v.dischDate as "Discharge Date",
        v.zip AS "Patient Zip Code",
        c.svcDate AS "Date of Service",
        c.chgNo AS "Charge #",
        m.description AS "Charge Description",
        m.CPT AS "CPT Code",
        m.revCode AS "Revenue Code",
        c.qty AS "Quantity",
        (c.qty * m.chgAmt) AS "Charge Amt"
    FROM 'Data Sets/Imaging Center Data/charges_cleaned_SQL.csv' as c
    JOIN 'Data Sets/Imaging Center Data/chgMast_cleaned_SQL.csv' as m
        ON c.chgNo = m.chgNo
    JOIN 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv' as v
        ON c.acctNum = v.acctNum
    LIMIT 25
""")
