duckdb.sql("""
COPY(
SELECT
    chgNo as "chgNo",
    UPPER(description) as "description",
    CPT as "CPT",
    revCode as "revCode",
    CAST(chgAmt AS DECIMAL(10, 2)) as "chgAmt"
FROM
    'Data Sets/Imaging Center Data/chgMast.csv'
)
    TO 'Data Sets/Imaging Center Data/chgMast_Cleaned_SQL.csv'
    WITH (HEADER, DELIMITER ',');
""")