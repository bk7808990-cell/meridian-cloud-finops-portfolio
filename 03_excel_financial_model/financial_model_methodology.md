# Financial Methodology & Excel Architecture Report
**Project:** Meridian Cloud FinOps Optimization

## 1. Executive Summary
This report details the exact financial modeling methodology utilized to analyze Meridian Global Bank's $60M cloud OpEx. The accompanying financial model (`Meridian_FinOps_Model.xlsx`) was engineered to execute accurate Chargeback distribution across 12 Business Units and mathematically validate cost-saving levers. The model successfully identifies a total risk-adjusted optimization ROI of **$10.5 Million**.

## 2. Core Methodology & Business Logic
Rather than relying on black-box algorithms, this financial model is built on transparent, auditable business logic designed for executive review.

### A. Untagged Spend Allocation ($12M Pool)
* **The Challenge:** Approximately 20% of the total cloud invoice lacked department tags, creating a $12M orphaned cost pool.
* **The Strategy (Pro-Rata Allocation):** To implement strict Chargeback without arbitrarily punishing any single department, we distribute the untagged costs proportionally based on each department's known baseline usage.
* **Calculation Logic:** `(Department's Tagged Spend / Total Bank's Tagged Spend) * Total Untagged Pool`. 

### B. Waste Elimination ($3.1M Immediate Cash Savings)
* **The Challenge:** The bank is bleeding operational capital on servers that are turned on but performing zero computational work.
* **The Strategy (Performance Thresholding):** The SQL pipeline merged billing data with CPU performance data. The Excel model ingests this extract and applies a strict threshold logic.
* **Calculation Logic:** Any resource with a lifetime average CPU utilization strictly `< 5.0%` is flagged as a 'Zombie'. The model aggregates the historical costs of these specific instances to size the $3.1M immediate shutdown savings.

### C. Financial Commitment Optimization ($7.4M Safe Savings)
* **The Challenge:** High reliance on expensive daily "On-Demand" vendor rates. 
* **The Strategy (The Overlap Haircut):** A catastrophic error in amateur FinOps is applying a blanket vendor discount (e.g., 28%) to the entire cloud bill. I enforced a strict "Overlap Haircut." We mathematically cannot purchase a 1-year financial contract for a 'Zombie' server we intend to terminate tomorrow.
* **Calculation Logic:** The model deducts the $3.1M Zombie waste from the on-demand baseline to calculate a `Net Eligible Base`. The 28% multi-year discount is strictly applied *only* to this optimized base, ensuring the $7.4M estimated savings are double-count-free and safe for the CFO to report.

## 3. Applied Excel Logic & Formula Architecture
To prove the model's robustness without requiring a line-by-line audit of the `.xlsx` file, below are the core Excel formulas and logic structures utilized in the engine:

* **Dynamic Pro-Rata Distribution:** 
  Used `SUMIFS` to aggregate tagged spend per BU, then applied proportional division against the dynamic `$12M` cell reference.
* **Overlap Haircut (Boolean Logic):**
  Used nested `IF` statements to enforce the double-counting rule before applying the 28% discount variable: `= IF(Status_Cell="Zombie", 0, (On_Demand_Spend_Cell * 0.28))`
* **Data Ingestion & Mapping:**
  Used `XLOOKUP` to map the 12 Business Unit names from the `dim_bu` reference table directly into the Chargeback variance matrix, ensuring zero mapping errors.

---

## 4. Sheet-by-Sheet Architecture & Strategic Approach
The Excel file (`Meridian_FinOps_Model.xlsx`) is structured across five sequential tabs. Below is the detailed breakdown of what each sheet contains and the business rationale behind its design.

### Sheet 1: `1_Assumptions` (The Control Panel)
* **What it contains:** All static driver variables for the project. This includes the Total Baseline Budget ($60M), WACC (10%), Target Discount Rate (28%), and Waste Threshold (<5% CPU).
* **Strategic Approach (Why):** Hardcoding numbers directly into Excel formulas is a poor corporate practice. By placing all core variables in a single "Control Panel" sheet, the model becomes 100% dynamic. If the CFO asks, *"What if our discount is only 20%?"*, changing a single cell on this sheet will automatically cascade the update through the entire financial model.

### Sheet 2: `2_Chargeback_Variance` (The Accountability Engine)
* **What it contains:** The Pro-Rata mathematical distribution. It shows each of the 12 Business Units, their tagged spend, their mathematically allocated share of the $12M Untagged Pool, and their Final Adjusted Bill.
* **Strategic Approach (Why):** Built to solve the "Zero Accountability" problem. This sheet provides a clean, indisputable ledger that the CFO can use to deduct exact costs from individual department P&Ls without the BU heads claiming the math is unfair.

### Sheet 3: `3_Optimization_ROI` (The ROI Calculator)
* **What it contains:** The itemized breakdown of the $10.5M savings. It separates the immediate cash savings ($3.1M from Zombie shutdowns) from the future contractual savings ($7.4M from 1-Year Commitments).
* **Strategic Approach (Why):** This sheet enforces the critical "Overlap Haircut" rule. It acts as the mathematical proof for the CFO, demonstrating that we subtracted the wasted infrastructure *before* applying vendor discounts, ensuring no fake or double-counted savings are reported to the board.

### Sheet 4: `4_Sensitivity_Analysis` (The Risk Mitigator)
* **What it contains:** A data table stress-testing the final ROI against different vendor discount scenarios (e.g., 15% Pessimistic, 28% Base Case, 35% Optimistic).
* **Strategic Approach (Why):** Executive boards rarely trust a single-point estimate. Adding a sensitivity matrix proves that the analyst has anticipated market volatility and negotiation risks with AWS/Azure, providing the CFO with a safe range of expected savings rather than a blind guess.

### Sheet 5: `5_Integrity_Checks` (The Audit Trail)
* **What it contains:** Automated Boolean audit balances (evaluating to `TRUE` or `FALSE`). It checks if the sum of the newly allocated Chargeback matrix exactly matches the original $60.0M vendor invoice.
* **Strategic Approach (Why):** Data loss during massive Excel aggregations is a common point of failure. This sheet serves as an automated auditor. A green `TRUE` proves to any technical reviewer that no financial data was leaked or duplicated during the complex Pro-Rata allocations.