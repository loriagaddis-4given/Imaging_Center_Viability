duckdb.sql("""
COPY(
SELECT
   acctNum,
   chgNo,
   qty,
   CAST(
       try_strptime(
           TRIM(svcDate),
           ['%m/%d/%Y', '%Y-%m-%d']
       )
       AS DATE
       )AS svcDate
FROM 'Data Sets/Imaging Center Data/charges_new.csv'
)
    TO 'Data Sets/Imaging Center Data/charges_cleaned_SQL.csv'
    WITH (HEADER, DELIMITER ',');
""")