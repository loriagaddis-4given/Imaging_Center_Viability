# Market Feasibility for a Proposed Rural Imaging Center

## 📌 Executive Summary
This project evaluates the financial viability and market opportunity for establishing a new outpatient imaging center in a target rural zip code (Zip: 30547). By analyzing a relational dataset of 1,000 patient demographics and 2,500 imaging encounters, I built an end-to-end data pipeline using **Excel** for data auditing, **SQL (Jupyter Notebooks)** for rigorous cleaning and transformation, and **Tableau Public** for self-service executive dashboards. The analysis quantified a potential annual revenue of **$107,105**, led heavily by high-margin MRI and CT services. Crucially, the data revealed an immediate preventive health opportunity: identifying **142** female patients over age 40 within the primary service area who are overdue for a mammogram, representing an incremental outreach revenue opportunity of **$38,351**.

---

## 🔗 Live Deliverables
*   **Interactive Dashboard:** [👉 Click Here to View the Tableau Public Dashboard](https://public.tableau.com/views/ImagingCenterViability/ImagingCenterDashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
*   **Technical Code:** [View the Data Cleaning & Analysis Notebook](./notebooks/Imaging_Center_Project_Final.ipynb)

---

## 💼 The Business Problem
A regional healthcare system is evaluating whether patient volume and potential billing charges in a surrounding rural target zip code (30547) justify the capital expenditure of building a new physical imaging facility. 

To make this decision, hospital leadership requires:
1.  **Volume & Revenue Visibility:** A clear breakdown of historical imaging counts and total charges categorized by modality (MRI, CT, X-Ray, Ultrasound, Mammography) to identify the highest-value services.
2.  **Geographic & Temporal Trends:** Interactive, self-service filtering to understand how patient volume and revenue are distributed across primary versus secondary zip codes and whether local demand is growing over time.
3.  **Preventive Care White Space:** A targeted marketing list of existing female patients over 40 who reside in the service area but have no record of mammography screenings, allowing the hospital to project immediate campaign ROI.

---

## 🗃️ Data Architecture
To maintain strict **HIPAA data compliance**, this project utilizes an AI generated synthetic relational database designed to replicate real-world billing and clinical trends. 

The schema consists of three tables:
*   **`visits` Table (1,000 records):** Contains unique 'acctNum', 'mrn', 'DOB', 'sex', 'admitDate', 'dischDate', and 'zip'.
*   **`charges` Table (1,217 records):** Contains 'acctNum', 'chgNo', 'qty', and 'svcDate'.
*   **'chgMast' Table (2,500 records):** Contains 'chgNo', 'description', 'CPT', 'revCode', and 'chgAmt'.

---

## 🛠️ Technical Skills & Tools Used
*   **Excel:** Initial visual data quality auditing and documentation of data discrepancies.
*   **SQL (PostgreSQL / DuckDB via Jupyter Notebooks):** 
    *   Multi-table relational **`JOINs`** to isolate screening gaps.
    *   **`CASE` Statements** for modality categorization and data standardization.
    *   **`GROUP BY`** and aggregate functions (`SUM`, `COUNT`) for financial reporting.
    *   **Date/Time Functions** (`try_strptime`) to convert raw text dates to structured timestamps.
    *   **'CTE'** for creating a subset of patients who have had mammography exams done to establish the count of patients over 40 who have not had them done.
*   **Tableau Public:** Developed an interactive, executive-facing dashboard featuring dynamic date-range sliders and geographic zip-code filters.

---

## 🧠 Decision Log (The 2026 Analytical "Flex")
*Hiring managers: In healthcare analytics, data is never clean. Below are the critical architectural decisions and data integrity issues I identified and resolved during this project:*

1.  **Architectural Shift to Patient-Level Identifiers (MRN):** 
    *   *Observation:* The raw billing data lacked a unique Medical Record Number (MRN) and was structured purely at the "encounter" level. 
    *   *Decision:* I redesigned the data model to require a unique `Patient_ID` (MRN) key. This architectural shift was critical; without an MRN, it would have been impossible to run longitudinal patient-level analyses—such as identifying females over 40 who *haven't* had a mammogram.
2.  **Standardizing Inconsistent Date Formats:** 
    *   *Observation:* The synthetic billing system outputted inconsistent date formats (a mix of `MM/DD/YYYY` and `YYYY-MM-DD`).
    *   *Decision:* I wrote a cleaning script in SQL to standardize all values to a strict ISO `YYYY-MM-DD` format and converted the column data type from string to `DATE` to enable Tableau's temporal filtering.
3.  **Handling Leading Zero Failures in Zip Codes:** 
    *   *Observation:* Due to spreadsheet truncation, several regional zip codes starting with zero were rendered as 4-digit strings (e.g., `5123` instead of `05123`).
    *   *Decision:* I applied a string-padding function in SQL (`LPAD`) to restore the leading zeros, ensuring geographic maps in Tableau plotted the patients' home locations accurately.

---

## 📈 Results & Strategic Business Recommendations

### 1. Modality Revenue Optimization
*   **Finding:** While X-Ray and Ultrasound comprised **36,906** of total exam volume, MRI and CT services generated **167,311** of total revenue.
*   **Recommendation:** Hospital leadership should prioritize the installation of high-margin MRI and CT suites in the new facility. Even at lower volumes, these modalities represent the fastest path to breaking even on construction costs.

### 2. Targeted Mammography Marketing Campaign (Preventive Care Opportunity)
*   **Finding:** Using a custom SQL gap analysis query, I cross-referenced females over age 40 in the primary service area and discovered that **142** patients had no history of mammography screenings.
*   **Recommendation:** Launch a highly targeted direct-outreach campaign to these existing patients. Capturing just **15%** of this overdue population would result in **21** new screenings, generating an estimated **$5,670** in immediate preventive billing.

### 3. High-Growth Zip Code Focus
*   **Finding:** Patient volume in the primary target zip code (12345) grew by **[Insert %]** year-over-year, proving robust local demand.
*   **Recommendation:** Focus physical clinic placement within a 10-minute drive time of this zip code to capture the expanding patient base.

---

## 🔮 Next Steps & Project Limitations
Because this analysis relies on single-system billing data, it has a few realistic limitations:
*   **Lack of Competitor Leakage Data:** We can see our own patients' zip codes, but we do not know if they are traveling elsewhere for other services. If given more time, I would integrate broader regional claims databases to analyze "patient leakage" to competing health systems.
*   **Incorporate Payer Mix Data:** Analyze the ratio of commercial insurance, Medicare, and Medicaid patients to calculate a more precise "Net Revenue" model based on standard reimbursement rates.

