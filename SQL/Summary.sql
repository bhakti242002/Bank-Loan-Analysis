SELECT * FROM bank_loan_data

--Total number of loan applocations
SELECT COUNT(id) AS Total_loan_Applications FROM bank_loan_data 

--Total number of Month to Date(MTD) loan applocations
SELECT COUNT(id) AS MTD_loan_Applications FROM bank_loan_data 
WHERE MONTH(issue_date) = 12

--Total number of Previous Month to Date (PMTD) loan applocations
SELECT COUNT(id) AS PMTD_loan_Applications FROM bank_loan_data 
WHERE MONTH(issue_date) = 11

-- Total funded amount
SELECT SUM(loan_amount) AS Total_funded_amnt FROM bank_loan_data

--Total funded amount (MTD)
SELECT SUM(loan_amount) AS MTD_funded_amnt FROM bank_loan_data
WHERE MONTH(issue_date) = 12

--Total funded amount (PMTD)
SELECT SUM(loan_amount) AS PMTD_funded_amnt FROM bank_loan_data
WHERE MONTH(issue_date) = 11

-- Total amount received
SELECT SUM(total_payment) AS Total_amnt_received FROM bank_loan_data

--Total funded amount (MTD)
SELECT SUM(total_payment) AS MTD_amnt_received FROM bank_loan_data
WHERE MONTH(issue_date) = 12

--Total funded amount (PMTD)
SELECT SUM(total_payment) AS PMTD_amnt_received FROM bank_loan_data
WHERE MONTH(issue_date) = 11

-- Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_interest_rate FROM bank_loan_data

-- Average Interest Rate (MTD)
SELECT AVG(int_rate)*100 AS MTD_Avg_interest_rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12

-- Average Interest Rate (PMTD)
SELECT AVG(int_rate)*100 AS PMTD_Avg_interest_rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11

--Average Debt to Income(DTI) Ratio
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data

--Average Debt to Income(DTI) Ratio (MTD)
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12

--Average Debt to Income(DTI) Ratio (PMTD)
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11

--Total number of good loan applications
SELECT COUNT(loan_status) AS Good_loan_applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good loan funded amount
SELECT SUM(loan_amount) AS Good_loan_funded_amnt
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good loan total amount received
SELECT SUM(total_payment) AS Good_loan_amnt_received
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Total number of Bad loan applications
SELECT COUNT(loan_status) AS Bad_loan_applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad loan funded amount
SELECT SUM(loan_amount) AS Bad_loan_funded_amnt
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad loan total amount received
SELECT SUM(total_payment) AS Bad_loan_amnt_received
FROM bank_loan_data
WHERE loan_status = 'Charged Off'


-- Good Loan & Bad Loan Percentage
SELECT 
  COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0 / COUNT(id) AS good_loan_percentage,
  COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id) AS bad_loan_percentage
FROM bank_loan_data;


--Loan status grid view
SELECT 
       loan_status,
       COUNT(id) AS Total_applications,
	   SUM(loan_amount) AS Total_funded_amnt,
	   SUM(total_payment) AS Total_amnt_received,
	   AVG(int_rate)*100 AS Avg_interest_rate,
	   AVG(dti)*100 AS DTI
	FROM bank_loan_data 
	GROUP BY loan_status

--Loan status grid view (MTD)
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


