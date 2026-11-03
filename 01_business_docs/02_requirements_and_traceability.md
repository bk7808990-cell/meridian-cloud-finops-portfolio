# Stakeholder Alignment & Requirements Traceability (RTM)
**Project:** Meridian Cloud FinOps Optimization

## 1. Stakeholder Power, Interest & Risk Mapping
In enterprise financial transformations, technical execution fails without strict stakeholder alignment. This section maps the core decision-makers, their primary operational fears, and the exact mitigation strategies employed.

* **Chief Financial Officer (CFO) [Project Sponsor - Power: High, Interest: High]**
  * *Risk/Fear:* The CFO requires absolute mathematical proof of Return on Investment (ROI) before approving any process changes to cloud provisioning.
  * *Mitigation (Accountable):* Deliver a robust Excel Financial Model that mathematically tracks the $12M untagged spend to specific BUs and accurately sizes the $3.1M waste reduction target.
* **Chief Information Officer (CIO) [Execution Lead - Power: High, Interest: High]**
  * *Risk/Fear:* The CIO fears that aggressive FinOps cost-cutting (shutting down servers) will cause critical production downtime for active banking applications.
  * *Mitigation (Responsible):* The SQL pipeline will strictly operate in "Read-Only/Reporting" mode. It will only flag "Zombie" servers. Manual User Acceptance Testing (UAT) and engineering approval are required before any actual termination.
* **12 Business Unit (BU) Heads [End Users - Power: High, Interest: Low]**
  * *Risk/Fear:* Highly resistant to strict "Chargeback" policies that deduct cloud expenses directly from their individual departmental P&L budgets.
  * *Mitigation (Consulted):* Implement a "Showback" transition phase. For the first quarter, the financial dashboard will merely show them their usage footprint without deducting funds, building trust and visibility before enforcing strict Chargeback.

## 2. Consolidated Business & Functional Requirements (MoSCoW)
This section merges the 'What' (Business Requirements - BRD) with the 'How' (Functional Requirements - FRD) to ensure zero ambiguity between the finance and data engineering functions.

* **Cost Allocation & Untagged Spend (Must Have)**
  * *Business Need:* The system must allocate 100% of the $60M bill to the 12 BUs, including mathematically distributing the 20% ($12M) "Unknown/Untagged" spend.
  * *Functional Execution:* The SQL pipeline will clean formatting errors and isolate all missing tags into an `Untagged_Pool`. The Excel Financial Model will ingest this clean SQL extract and apply a proportional (Pro-Rata) mathematical formula to distribute the $12M pool based on each BU's existing tagged consumption.
* **Waste Elimination (Must Have)**
  * *Business Need:* Identify mathematically idle "Zombie" servers that are billing daily but performing zero banking operations.
  * *Functional Execution:* The SQL script will execute an `INNER JOIN` between the daily billing and utilization tables. Using a `HAVING` clause, it will filter for `resource_id`s with a lifetime average CPU utilization strictly below 5.0%, generating a targeted kill list.
* **Financial Contract Optimization (Must Have)**
  * *Business Need:* Calculate the multi-million dollar ROI of transitioning from expensive daily "On-Demand" server rates to 1-year discounted contracts (Compute Savings Plans).
  * *Functional Execution:* The Excel model will apply a standardized 28% discount variable to eligible compute resources. To prevent fake/double-counted savings, an "Overlap Haircut" `IF` logic will be applied in Excel, strictly excluding all flagged "Zombie" servers from the discount calculation.

## 3. Requirement Traceability Matrix (RTM)
The RTM ensures every single business request is directly tied to a specific data engineering logic and a final financial output.

| Req ID | Business Requirement (The Goal) | Technical Logic & Tool (The Engine) | Final Output View (The Deliverable) |
| :--- | :--- | :--- | :--- |
| **BR-01** | Total $60M cost allocated to 12 BUs. | **SQL:** `GROUP BY` aggregates 1.46M raw rows into a lightweight monthly summary. | Excel: 'Chargeback' Sheet |
| **BR-02** | Distribute $12M Untagged Spend fairly. | **SQL & Excel:** SQL creates `Untagged_Pool`. Excel applies Pro-Rata percentage distribution. | Excel: 'Chargeback' Sheet |
| **BR-03** | Identify idle "Zombie" servers. | **SQL:** Filter `fact_utilization` for average CPU < 5.0%. | SQL Extract: 'Waste Tracker' |
| **BR-04** | Size ROI for 1-Year Contracts. | **Excel:** Applies 28% discount multiplier to on-demand spend. | Excel: 'Executive Summary' |
| **BR-05** | Enforce "Overlap Haircut". | **Excel:** `IF` statement logic dynamically excludes "Zombies" before applying the 28% discount. | Excel: 'Savings Sizing' Sheet |