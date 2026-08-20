SELECT
    chgNo as "chgNo",
    /* Charge descriptions have mixed case. Changing all to upper case to make text
       searches easier. */
    UPPER(description) as "description",
    CPT as "CPT",
    revCode as "revCode",
    /* Charge amounts are not in a standard 2 decimal place format. Casting as decimal
       to manually force 2 decimal places as these are dollar amounts. */
    CAST(chgAmt AS DECIMAL(10, 2)) as "chgAmt"
FROM
    'Data Sets/Imaging Center Data/chgMast.csv'