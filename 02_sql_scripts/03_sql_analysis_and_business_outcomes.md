# SQL Analysis & Business Outcomes Report
**Project:** Meridian Cloud FinOps Optimization

## 1. SQL Pipeline Strategy
In this project, I adopted a practical, real-world approach to data transformation and analysis. The pipeline is split into two focused SQL scripts:
* **`01_data_cleaning.sql`:** Focuses entirely on standardizing messy data and structuring missing values.
* **`02_project_analysis.sql`:** Focuses on extracting core metrics (vendor spend, identifying waste) and creating a lightweight summary for Excel.

I deliberately pushed complex financial math (like the Pro-Rata allocation logic) out of the SQL layer and into the Excel Financial Model. This allows the finance team and stakeholders to easily audit the calculations without needing to read SQL code.

---

## 2. Detailed Outcomes from Data Cleaning (`01_data_cleaning.sql`)

### A. Standardizing Department Names
* **The Issue:** The raw `fact_billing` table contained manually typed department tags with severe formatting inconsistencies (e.g., "retail-bu", " Retail ", "RETAIL").
* **The SQL Logic:** I used simple `UPDATE` statements to permanently fix these anomalies in the database.
* **The Result:** All variations were merged into a single, uniform category ("Retail"). This ensures that when the data is eventually pivoted in Excel or Power BI, the spend is consolidated accurately under one BU instead of fragmenting across three.

### B. Isolating the $12M "Untagged" Problem
* **The Issue:** Approximately 292,000 rows (20% of the dataset) had a `NULL` value in the `cost_center_tag` column. 
* **The Constraint:** Simply deleting these rows was not an option, as it would drop the CFO’s established total spend baseline from $60M down to $48M.
* **The SQL Logic:** I used an `UPDATE` query with a `WHERE ... IS NULL` clause to group all blank tags into a newly created `Untagged_Pool` category.
* **The Result:** This query safely ring-fenced the $12M in orphaned spend. It is now perfectly structured to be distributed to the 12 Business Units using Pro-Rata allocation in the Excel phase.

---

## 3. Detailed Outcomes from Project Analysis (`02_project_analysis.sql`)

### A. Vendor Spend Split (Cloud Provider Breakdown)
* **The Approach:** I used an `INNER JOIN` to connect the massive `fact_billing` table with the lightweight `dim_services` lookup table, grouped by the `provider` column.
* **The Result:** The query successfully aggregated the 1.46 million rows to reveal the exact distribution of the $60M budget:
  - **AWS:** Highest spend category at roughly $32M (53% of total).
  - **Azure:** Second highest at roughly $20M (33% of total).
  - **GCP:** Lowest spend at roughly $8M (14% of total).

### B. Identifying Zombie Servers ($3.1M Savings Opportunity)
* **The Approach:** I analyzed the `fact_utilization` table (which tracks daily CPU performance) to identify "Zombie" resources—servers that the bank is paying for but not actually using. 
* **The SQL Logic:** Using a `GROUP BY` and a `HAVING` clause, the query filtered for `resource_id`s where the lifetime average CPU utilization was strictly below 5.0%.
* **The Result:** The query output an exact list of idle servers. The historical billing cost associated with these specific servers totals exactly **$3.1M**. This provides the IT Operations team with a targeted "kill list" to execute immediate cash savings.

### C. Lightweight Data Extract for Financial Modeling
* **The Issue:** Loading 1.46 million rows of daily transaction data directly into Microsoft Excel causes severe performance lag and frequent crashes.
* **The SQL Logic:** I wrote a final extraction query that aggregates the daily costs into a "Monthly Summary by Department." 
* **The Result:** This query shrank the massive dataset from 1.46M rows down to fewer than 1,000 clean rows. This created a highly optimized, lightweight dataset that serves as the perfect, crash-proof engine for the final Excel Financial Model.