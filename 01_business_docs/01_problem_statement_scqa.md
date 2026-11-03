# Problem Statement & Executive Strategy (SCQA)
**Project:** Meridian Cloud FinOps Optimization

To ensure absolute clarity for the executive board and technical stakeholders, this cloud financial operations (FinOps) challenge is structured using the SCQA (Situation, Complication, Question, Answer) methodology. This framework breaks down the $60M business problem and outlines our exact data-driven strategy.

## 1. Situation (The Business Background)
Meridian Global Bank has aggressively accelerated its digital transformation, relying on a multi-cloud enterprise infrastructure to power its core banking applications. The current environment is distributed across three major vendors: Amazon Web Services (AWS) at 55%, Microsoft Azure at 30%, and Google Cloud Platform (GCP) at 15%. 

This massive infrastructure supports 12 critical Business Units (BUs), ranging from Retail Banking and Payments to Risk Management. Historically, during FY24, the bank's total cloud operating expense (OpEx) was strictly managed at $43.5 Million, which represented a stable 1.43% of the bank's total revenue.

## 2. Complication (The Core Problem)
In the current financial year (FY25), total cloud spend surged by 38% year-over-year, hitting an unsustainable **$60.0 Million baseline**. The Office of the CFO currently lacks the granular visibility required to audit, control, or reverse this cost spike due to three systemic failures:

* **The $12M "Untagged" Black Hole:** IT engineers routinely provision new cloud servers without assigning mandatory department metadata tags. As a result, approximately 20% of the daily billing data (representing $12M in spend) is orphaned. Finance is paying the vendor invoice but cannot trace the compute cost back to the specific business unit that consumed it.
* **Zero Cost Accountability:** Because cloud costs are historically paid from a centralized IT budget rather than individual BU P&Ls, department directors treat cloud compute as an infinite, free resource. This lack of financial accountability drives severe technical waste, resulting in hundreds of "Zombie" servers that are powered on and billing daily, despite handling zero banking traffic.
* **Inefficient Financial Contracts:** Currently, only 35% of the bank's servers are covered under long-term discounted contracts (such as AWS Compute Savings Plans or Azure Reserved Instances). The remaining 65% are running on highly expensive, daily "On-Demand" rates, bleeding operational capital.

## 3. Question (The Strategic Dilemma)
How can the bank design and implement a data-driven FinOps ecosystem that accurately allocates 100% of the cloud bill to the correct departments, safely terminates wasted infrastructure, and optimizes financial vendor contracts—all without risking downtime for active banking operations?

## 4. Answer (Our Data & Financial Solution)
I will execute a structured data engineering and financial modeling strategy to restructure the bank's cloud OpEx:

1. **Data Pipeline & Structuring (SQL):** I will ingest and standardize 1.46 million rows of messy daily billing data. This involves cleaning text anomalies and securely isolating the 20% untagged spend into a dedicated pool for downstream mathematical processing.
2. **Pro-Rata Chargeback Model (Excel):** I will build a dynamic financial model that mathematically distributes the $12M untagged pool across the 12 BUs based on their proportional tagged spend. This enables a strict "Chargeback" reporting system, forcing BUs to finally take financial accountability for their exact usage.
3. **Waste Identification & ROI Sizing (SQL & Excel):** By cross-referencing billing data with CPU utilization metrics, I will pinpoint mathematically idle "Zombie" servers (targeting $3.1M in immediate shutdown savings). Furthermore, I will model the financial ROI of increasing our 1-year contract coverage to 70%, applying strict "Overlap Haircuts" to ensure estimated savings are mathematically sound and never double-counted.