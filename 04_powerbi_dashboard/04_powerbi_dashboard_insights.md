# Phase 4: Executive Dashboard & Strategic Business Outcomes

## 1. Dashboard Architecture & Design Philosophy
Unlike academic projects that load massive raw datasets directly into BI tools, this dashboard follows a strict Tier-1 enterprise architecture: **"Lightweight BI & Auditable Financials."**

* **Data Lineage:** SQL (Data Extraction & Cleansing) -> Excel (Financial Engine & Pro-Rata Math) -> Power BI (Visualization Layer).
* **Architectural Rationale:** Pushing complex allocation math into Power BI via heavy DAX formulas creates a "black box" that Finance teams cannot independently verify. By keeping the core mathematical engine (such as the Untagged Pro-Rata allocation and the Overlap Haircuts) explicitly in Excel, we ensure 100% auditability for the FP&A team while keeping the `.pbix` file incredibly fast and focused purely on executive storytelling.

## 2. Key Business Insights & Methodology

### Insight A: CFO Executive Summary (The $10.5M Value Path)
* **Finding:** Out of the $60M total FY25 budget, there is a concrete, mathematically verified path to reduce the run-rate to $49.5M.
* **Methodology:** The Savings Waterfall chart breaks the $10.5M savings into two distinct execution tracks: immediate waste removal ($3.1M from Zombie servers) and strategic vendor commitments ($7.4M from 1-Year RIs).

### Insight B: BU Chargeback Matrix (Enforcing Accountability)
* **Finding:** $12M (20% of the total budget) was floating as "Untagged," creating a massive accountability gap. The dashboard identifies the *Digital* and *Data Platform* business units as the primary drivers of over-budget spending once untagged costs are factored in.
* **Methodology:** Since retrospective tagging of historical cloud resources is technically impossible, we utilized a mathematical **Pro-Rata allocation** based on historical tagged consumption. This is the industry-standard financial proxy to enforce accountability on historical data, forcing BUs to take ownership of their waste.

### Insight C: Optimization Action Plan & Risk Mitigation
* **Finding:** The IT action plan provides a strict "Kill List" for Zombie servers (CPU < 5%) and a procurement target for RI contracts.
* **Governance & Risk Mitigation:** The most common forecasting error in FinOps is "double-counting" savings (e.g., buying long-term discounts on servers that will be terminated). This model mathematically isolates the $3.1M Zombie server waste *before* applying the 28% commitment discount to the remaining $26.4M healthy compute base, guaranteeing a highly conservative and accurate ROI projection.

