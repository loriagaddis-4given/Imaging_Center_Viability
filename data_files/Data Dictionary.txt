# Data Dictionary

| Dataset | Field | Type | Definition|
|---|---|---|---|
| visits_cleaned_SQL.csv | acctNum | Int64 | Number assigned per date of service|
| visits_cleaned_SQL.csv | mrn | Int64 | Unique medical record number per patient|
| visits_cleaned_SQL.csv | DOB | Date | Patient's date of birth |
| visits_cleaned_SQL.csv | sex | Text | Gender of patient|
| visits_cleaned_SQL.csv | admitDate | Date | Date of admission |
| visits_cleaned_SQL.csv | dischDate | Date | Date of discharge |
| visits_cleaned_SQL.csv | zip | Int64 | 5-digit zip code of patient's home address |
| chgMast_cleaned_SQL.csv | chgNo | Int64 | Unique value assigned per charge in table; Primary Key |
| chgMast_cleaned_SQL.csv | description | Text | Description of the charge |
| chgMast_cleaned_SQL.csv | CPT | Text | AMA CPT Code |
| chgMast_cleaned_SQL.csv | revCode | Int64 | NUBC UB-04 revenue code |
| chgMast_cleaned_SQL.csv | chgAmt | Double| Dollar amount associated with the charge |
| charges_cleaned_SQL.csv | acctNum | Int64 | Foreign Key from visits_cleaned_SQL.csv file |
| charges_cleaned_SQL.csv | chgNo | Int64 | Foreign Key from chgMast_cleaned_SQL.csv file |
| charges_cleaned_SQL.csv | qty | Int64 | Quantity charged |
| charges_cleaned_SQL.csv | svcDate | Date | Date the service was performed |
