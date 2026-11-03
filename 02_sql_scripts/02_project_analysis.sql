-- ====================================================================
-- FILE 2: 02_project_analysis.sql
-- Kaam: Clean data se CFO ke liye final numbers aur reports nikalna.
-- ====================================================================

-- QUERY 1: Vendor Split (Paisa kis cloud company ko ja raha hai?)
-- Logic: Billing table aur Services table ko jodo, aur provider ke hisaab se total kharch nikal lo.
SELECT 
    dim_services.provider, 
    SUM(fact_billing.final_cost) as total_bill
FROM fact_billing
JOIN dim_services ON fact_billing.service_id = dim_services.service_id
GROUP BY dim_services.provider;


-- QUERY 2: Zombie Servers Dhoondhna ($3.1M Savings ke liye)
-- Logic: Wo servers dhoondho jinka average CPU use 5% se bhi kam hai.
SELECT 
    resource_id, 
    AVG(avg_cpu_percent) as average_cpu_used
FROM fact_utilization
GROUP BY resource_id
HAVING AVG(avg_cpu_percent) < 5.0;


-- QUERY 3: Excel ke liye data chhota karna (Data Extract)
-- Logic: 14 lakh rows Excel mein crash ho jayenge. Isliye hum har mahine ka 
-- aur har department ka total kharch nikal rahe hain, taaki chhota data Excel mein daal sakein.


SELECT 
    DATE_FORMAT(b.date, '%Y-%m') as billing_month, 
    COALESCE(b.cost_center_tag, 'Untagged_Pool') as department, 
    s.eligible_for_commitment,
    SUM(b.final_cost) as monthly_cost
FROM fact_billing b
LEFT JOIN dim_services s ON b.service_id = s.service_id
GROUP BY 
    DATE_FORMAT(b.date, '%Y-%m'), 
    COALESCE(b.cost_center_tag, 'Untagged_Pool'),
    s.eligible_for_commitment
ORDER BY billing_month DESC;


