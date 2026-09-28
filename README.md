# Market Feasibility for a Proposed Rural Imaging Center

## Project Overview

This project examines imaging utilization and gross billed charges among patients from a target rural ZIP code to support an initial market-feasibility assessment for a proposed outpatient imaging center. It also identifies a potential mammography outreach population within the existing patient base.

This public portfolio project recreates a real-world healthcare planning question using fully synthetic data. It demonstrates the analytical approach but does not reproduce an organization’s original data or results.

## Business Questions

- How many imaging exams were associated with patients from the target ZIP code?
- Which imaging modalities accounted for the greatest exam volume and gross billed charges?
- How did imaging activity vary over the analysis period?
- How many women age 40 or older in the target ZIP code had no net mammography record in the available data?
- What additional information would be needed before making a capital-investment decision?

## Data

The analysis uses three related synthetic datasets:

- **Visits:** Patient and encounter information, including MRN, account number, date of birth, sex, encounter dates, and ZIP code.
- **Charges:** Imaging charge activity connected to individual encounters.
- **Charge master:** Imaging descriptions, CPT codes, revenue codes, and gross charge amounts.

The validated dataset contains:

- 1,000 encounters
- 760 unique patients
- 1,217 charge records
- 40 imaging charge-master records
- Five imaging modalities
- Positive and reversal charge quantities

All patient and financial information is synthetic.

## Tools

- **Excel:** Initial data review and cleaning documentation
- **DuckDB SQL:** Data validation, cleaning, joins, aggregation, and patient-level analysis
- **Jupyter Notebook:** Documented SQL workflow and results
- **Tableau Public:** Interactive dashboard development

## Methodology

1. Validated required fields, unique identifiers, and foreign-key relationships.
2. Confirmed that service dates fell within their associated encounter dates.
3. Standardized inconsistent date formats.
4. Joined encounters, imaging charges, and charge-master information.
5. Categorized imaging activity by modality.
6. Calculated exam volume and gross billed charges by modality and date.
7. Used net quantities so charge reversals did not inflate results.
8. Evaluated mammography history at the patient level rather than the individual charge-row level.
9. Reconciled SQL results with the Tableau dashboard.

## Key Findings

- Imaging utilization and gross billed charges varied substantially across the five modalities.
- The dashboard provides separate views of exam volume and gross billed charges so high-charge services are not automatically treated as high-volume services.
- Among 76 women age 40 or older in the target ZIP code, 61 had no net mammography record in the available data.
- This group represents a **potential mammography outreach population**, not a confirmed count of patients who are clinically overdue for screening.

## Decision Use

The analysis provides an initial view of historical utilization within the target market. It could help leadership decide whether a more complete feasibility study is warranted.

It does not, by itself, establish that a new imaging center would be profitable or should be constructed. A full decision would require additional information such as payer mix, expected reimbursement, competitor activity, referral patterns, capital costs, staffing requirements, operating expenses, and projected market growth.

## Project Deliverables

- [View the interactive Tableau dashboard](https://public.tableau.com/app/profile/lori.gaddis/viz/ImagingCenterViability/Dashboard1)
- [View the complete Jupyter notebook](notebooks/Imaging_Center_Project_Final.ipynb)
- [View the data dictionary](<data_files/Data Dictionary.md>)
- [View the SQL scripts](sql_scripts)
- [View the synthetic source data](data_files)

## Dashboard

[![Imaging Center Viability dashboard](<images/Imaging Center Viability Dashboard Screenshot.png>)](https://public.tableau.com/app/profile/lori.gaddis/viz/ImagingCenterViability/Dashboard1)

## Limitations

- The project uses synthetic data and does not represent an actual healthcare organization.
- Gross billed charges are chargemaster amounts before contractual adjustments. They are not payments, allowed amounts, collected revenue, profit, or return on investment.
- The data includes activity from only one simulated health system and does not capture services performed by competitors.
- The mammography measure identifies patients without a net mammography record in the available data. It does not confirm screening eligibility, clinical need, outside services, or patient preference.
- Historical utilization does not constitute a future volume forecast.
