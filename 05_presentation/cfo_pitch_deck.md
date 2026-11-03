# CFO Pitch Deck: Meridian Cloud FinOps Optimization

**Target Audience:** Chief Financial Officer (CFO), Chief Information Officer (CIO)
**Objective:** Secure executive approval to execute the $10.5M cloud optimization plan and enforce new tagging governance policies.

---

## Slide 1: Title Slide
* **Headline:** FY25 Cloud Cost Optimization & FinOps Governance Strategy
* **Sub-headline:** Transforming a $60M run-rate into a $49.5M optimized baseline.


---

## Slide 2: Executive Summary (The Problem & The Solution)
* **The Current State:** Total FY25 cloud budget is $60.0M. Currently, 20% ($12M) of this spend is completely untagged, creating a massive financial accountability gap.
* **The Opportunity:** We have identified $10.5M in actionable, risk-free savings across AWS, Azure, and GCP.
* **The Ask:** Approval to terminate zero-utilization resources and procure 1-Year Reserved Instances.
* *(Visual Reference: Page 1 Power BI Waterfall Chart)*

---

## Slide 3: Resolving the Accountability Gap (Pro-Rata Chargeback)
* **The Challenge:** Historical cloud resources cannot be retrospectively tagged. $12M in costs were unaccounted for.
* **The Methodology:** Implemented a standard financial Pro-Rata model based on historical tagged consumption to distribute the $12M pool fairly across 12 Business Units.
* **Key Finding:** After trueing up the untagged allocation, the **Digital** and **Data Platform** departments are running significantly over budget ($500K+ variance each).
* *(Visual Reference: Page 2 Power BI Chargeback Matrix)*

---

## Slide 4: IT Execution & Risk Mitigation ($10.5M ROI)
* **Immediate Cash Release ($3.1M):** Targeted termination of "Zombie Servers" (CPU utilization strictly < 5%).
* **Strategic Procurement ($7.4M):** Procuring 1-Year Reserved Instances (RIs) at a 28% discount for the remaining healthy compute base.
* **Risk Mitigation (Zero Double-Counting):** The $7.4M RI discount was mathematically applied *only* to the $26.4M healthy compute base. Zombie servers were completely isolated prior to discount calculation to guarantee conservative forecasting.
* *(Visual Reference: Page 3 Power BI IT Action Plan)*

---

## Slide 5: Next Steps & Long-Term Governance
1. **Immediate Execution (Week 1):** IT Operations to execute the Zombie Server kill list.
2. **Contract Procurement (Week 2):** Finance to sign off on 1-Year RI vendor contracts.
3. **Hard-Block Policy (Month 1):** DevOps to implement strict Terraform/IaC tagging policies. No future server can be provisioned without a valid `cost_center_tag`. 

---
*End of Presentation Outline*