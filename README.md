# Meridian Cloud Cost Optimization (FinOps)

**Tech Stack Used:** SQL, MS Excel (Financial Modeling), Power BI, Python, MS PowerPoint  
**Domain:** FinOps, Cloud Computing (AWS/Azure/GCP), Financial Strategy

---

## The Business Story: Fixing the $12M Leak

Imagine a corporate environment paying a **$60 Million** annual cloud bill, but having zero visibility into where **$12 Million (20%)** of that money was actually going. 

This project was built to tackle that exact reality. The organization was trapped in a reactive spending culture. Because there was no accountability for 'untagged' servers, departments were unknowingly burning cash on idle resources. More importantly, leadership was afraid to sign long-term discount contracts because the data was too messy to trust.

The goal of this project was simple: Untangle the raw billing data, allocate the hidden costs fairly, and build a strategy to stop the financial bleeding without disrupting live business operations.

---

## The Impact

This isn't just about a dashboard; it's about fixing a broken process. By transforming the raw data into actionable strategy, the following outcomes were modeled:

* **$10.5M Verified Savings:** Identified a clear path to reduce the $60M annual run-rate down to an optimized $49.5M.
* **Resolving the Accountability Gap:** Built a mathematical Pro-Rata model in Excel to fairly distribute the $12M untagged costs based on historical usage, instantly highlighting which departments were over-budget.
* **Zero Double-Counting:** Implemented a strict calculation sequence—isolating **$3.1M** in completely dead "Zombie Servers" *before* calculating the 28% volume discount for the **$7.4M** in healthy, long-term contracts.
* **Hard-Block Governance:** Recommended a "No Tag, No Server" deployment policy to ensure this untagged blind spot never happens again.

---

## Project Navigation 

To see how the raw data was transformed into an executive strategy, explore the folders in this logical flow:

* **[01_business_docs](./01_business_docs/)**
  * Start here. Contains the **As-Is vs. To-Be Process Transformation Report**, explaining the historical bottlenecks and the strategic roadmap to fix them.
* **[00_data](./00_data/)**
  * Contains the data dictionary and samples of the raw vs. cleaned datasets.
* **[02_sql_scripts](./02_sql_scripts/)**
  * The foundation. Contains the SQL scripts used to clean, filter, and aggregate the messy multi-cloud billing exports.
* **[03_excel_financial_model](./03_excel_financial_model/)**
  * The math engine. The complex Pro-Rata allocations and overlapping discount calculations were done here in Excel for 100% auditability, keeping the BI layer lightweight.
* **[04_powerbi_dashboard](./04_powerbi_dashboard/)**
  * The executive visual layer. 
  * *Tip: Open the `screenshots` folder to immediately view the "Kill List" and "Chargeback Matrix" without needing Power BI.*
* **[05_presentation](./05_presentation/)**
  * The final pitch. Contains the CFO-level presentation deck used to secure sign-off on the savings plan.

---

## A Note on Modern Workflow (AI Disclosure)

In the spirit of transparency and modern workflows, I want to clarify how this project was built. The strategic business logic, financial modeling (Pro-Rata/Haircut math), process transformation narrative, and dashboard architecture are **100% human-designed**. 

However, to execute this efficiently, Generative AI (LLMs) was utilized strictly as a productivity multiplier—specifically to generate the synthetic dataset (for privacy), write boilerplate SQL syntax, and assist in formatting markdown files. 

**The business brain is human; the execution speed is AI-assisted.**
