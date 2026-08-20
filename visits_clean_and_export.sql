duckdb.sql("""
COPY(
SELECT
    acctNum,
    CAST(
        try_strptime(
            TRIM(DOB),
            ['%m/%d/%Y', '%Y-%m-%d']
       )
       AS DATE
       ) AS "DOB",
    CAST(
        try_strptime(
            TRIM(admitDate),
            ['%m/%d/%Y', '%Y-%m-%d']
       )
       AS DATE
       ) AS "admitDate",
    CAST(
        try_strptime(
            TRIM(dischDate),
            ['%m/%d/%Y', '%Y-%m-%d']
       )
       AS DATE
       ) AS "dischDate",
    zip
FROM
    'Data Sets/Imaging Center Data/visits.csv'
)  
TO 'Data Sets/Imaging Center Data/visits_cleaned_SQL.csv'
WITH (HEADER, DELIMITER ',');
""")