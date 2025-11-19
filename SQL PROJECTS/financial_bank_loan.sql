SELECT * FROM financial_loan_data_excel

SELECT COUNT(ID) AS Total_Loan_applications FROM financial_loan_data_excel

SELECT COUNT(ID) AS MTD_Total_Loan_applications FROM financial_loan_data_excel
where MONTH(issue_date) = 12


SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan_data_excel
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM financial_loan_data_excel
WHERE MONTH(issue_date) = 12
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan_data_excel
WHERE MONTH(issue_date) = 12

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan_data_excel

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan_data_excel
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan_data_excel
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan_data_excel
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan_data_excel
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan_data_excel
WHERE loan_status = 'Charged Off'
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
       financial_loan_data_excel
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan_data_excel
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_data_excel
GROUP BY emp_length
ORDER BY emp_length
SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_data_excel
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_data_excel
GROUP BY home_ownership
ORDER BY home_ownership


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_data_excel
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
