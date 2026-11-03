# Process Optimization, Risks & Data Assumptions
**Project:** Meridian Cloud FinOps Optimization

## 1. Process Gap Analysis (Current vs. Future State)
To solve the FinOps problem, we must map out how the company operates today (The "As-Is" State) and how it will operate after our project is implemented (The "To-Be" State).

### The "As-Is" State (The Current Broken Process)
1. **Creation:** IT Engineers across 12 departments spin up new cloud servers. Due to poor governance, they frequently omit the mandatory "Department Name Tag."
2. **Operation:** Servers run 24/7. Even after a project concludes, resources are rarely decommissioned, creating "Zombie" infrastructure.
3. **Billing:** At month-end, AWS, Azure, and GCP send massive, consolidated invoices to the centralized Finance Department.
4. **The Bottleneck:** The CFO pays the $60M invoice blindly. Finance cannot implement Chargeback because they cannot trace the orphaned infrastructure back to the specific departments.

### The "To-Be" State (Our Future Optimized Process)
1. **Automated Tracking:** Our SQL Data Analytics pipeline automatically ingests daily billing and CPU performance metrics, normalizing inconsistent tags.
2. **Waste Flagging:** The system automatically scans for idle resources (<5% CPU) and generates an actionable "Kill List" for IT Ops.
3. **Smart Allocation:** At month-end, the Excel Financial Model ingests the SQL summary. Using a Pro-Rata mathematical algorithm, it fairly distributes the orphaned $12M spend to the 12 BUs.
4. **The Result:** The CFO receives a clean, automated Chargeback Report, enabling them to confidently deduct exact cloud costs from each department's P&L.

## 2. Project Risk Register (Mitigation Strategies)
In any $60 Million enterprise project, strict risk governance is required. The following are the highest-priority operational and financial risks, along with their mitigation plans.

| Risk ID | What Could Go Wrong (The Risk) | Impact Level | How We Will Prevent It (Mitigation Plan) | Owner |
| :--- | :--- | :--- | :--- | :--- |
| **Risk-01** | **Production Crash:** The IT team might accidentally terminate a critical production server while attempting to delete "Zombie" instances. | Critical | We will not automate server deletion. The SQL pipeline will only generate a reporting list. A Senior IT Manager must manually review and approve every deletion (UAT). | CIO |
| **Risk-02** | **Over-Committing Capital:** We might sign a 3-year financial contract for a server, but if the business deletes that server next month, the contract capital is wasted. | High | **Overlap Haircut Rule:** Our Excel model strictly excludes all servers flagged for deletion *before* calculating any long-term commitment discounts, preventing fake ROI. | FinOps Lead |
| **Risk-03** | **Department Anger (Rejection):** The 12 Business Units will likely reject the Chargeback deductions, claiming the calculations are unfair. | Medium | We will employ a "Crawl, Walk, Run" transition. We will run a "Showback" phase for 3 months, offering complete transparency into the Pro-Rata calculations, before initiating actual P&L "Chargeback." | CFO |
| **Risk-04** | **Tagging Fatigue:** IT Engineers might continue to build servers without tags, perpetuating the $12M untagged problem. | Medium | As a final process recommendation, we will advise the IT Architecture team to enforce a "Hard Block" policy at the vendor level, preventing the launch of any new server unless a tag is provided. | CIO |

## 3. Assumptions & Synthetic Baseline Register
Because this project utilizes a mathematically engineered synthetic dataset (to comply with strict banking NDAs), all base numbers are carefully designed assumptions. This register ensures complete transparency for technical auditors reviewing the portfolio.

| Assumption Category | Variable / Metric | Value | Business Rationale / Source |
| :--- | :--- | :--- | :--- |
| **Financials** | FY25 Cloud Spend | $60.0M | Target baseline provided in project brief. |
| **Financials** | WACC (Cost of Capital) | 10% | Standard corporate discount rate for NPV/IRR calculations in Tier-1 banks. |
| **Infrastructure** | Provider Split | AWS: 55%, Azure: 30%, GCP: 15% | Reflects a realistic multi-cloud enterprise architecture. |
| **Operations** | Current Untagged Spend | ~20% | Industry average for enterprises lacking strict FinOps governance (Benchmark: FinOps Foundation). |
| **Operations** | Commitment Discount | 28% | Average discount blended across Compute Savings Plans and RIs (Benchmark: Flexera State of the Cloud). |
| **Operations** | Waste Threshold (Zombie) | < 5.0% CPU | Conservative threshold; any resource averaging below this over its lifetime is deemed idle. |

*Note: All data generated in the `/data/raw_csv_files` folder is mathematically anchored to these exact assumptions using the underlying Python generation scripts.*