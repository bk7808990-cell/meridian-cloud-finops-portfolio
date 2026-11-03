-- ====================================================================
-- FILE 1: 01_data_cleaning.sql
-- Kaam: Raw data mein jo kachra hai (spelling mistakes, missing tags), 
-- usko theek karna taaki aage analysis aasaan ho jaye.
-- ====================================================================

-- STEP 1: Department ke naamon ki spelling theek karna
-- Problem: Data mein kahin 'retail-bu' likha hai, kahin ' Retail '.
-- Solution: Hum in sabko saaf karke ek standard naam 'Retail' de rahe hain.
UPDATE fact_billing 
SET cost_center_tag = 'Retail' 
WHERE cost_center_tag = 'retail-bu' OR cost_center_tag = ' Retail ';

-- STEP 2: Missing tags ko handle karna (The $12M Untagged problem)
-- Problem: 20% data mein department ka naam hi nahi hai (NULL hai).
-- Solution: Hum inko delete nahi kar sakte warna total bill kam ho jayega. 
-- Isliye hum in sabhi blank (NULL) rows ko 'Untagged_Pool' ka naam de rahe hain.
UPDATE fact_billing 
SET cost_center_tag = 'Untagged_Pool' 
WHERE cost_center_tag IS NULL;

-- STEP 3: Cleaning check karna
-- Kaam: Ek simple check ki data saaf hone ke baad kaisa dikh raha hai.
SELECT 
    cost_center_tag, 
    COUNT(*) as total_rows 
FROM fact_billing 
GROUP BY cost_center_tag;