

/* Total loan applications */
select count(id) as [Total loan applications]
from bank_loan_data

select count(id) as MTD_Total_loan_applications
from bank_loan_data 
where month(issue_date) = 12 and year(issue_date) = 2021

select count(id) as PMTD_total_loan_applications
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021


/* Total funded amount */
select sum(loan_amount) as [Total funded amount] from bank_loan_data

select sum(loan_amount) as MTD_Total_funded_amount from bank_loan_data where month(issue_date) = 12 and year(issue_date) = 2021

select sum(loan_amount) as PMTD_Total_funded_amount from bank_loan_data where month(issue_date)=11 and year(issue_date)= 2021

/* Total recieved amount */
select sum(total_payment) as [Total amount recieved] from bank_loan_data 

select sum(total_payment) as [MTD_total_amount_recieved] from bank_loan_data where month(issue_date)=12 and year(issue_date) = 2021

select sum(total_payment) as [PMTD_total_amount_recieved] from bank_loan_data where month(issue_date)=11 and year(issue_date)= 2021

/* Average interest rate */
select avg(int_rate)*100 as avg_int_rate from bank_loan_data 

select avg(int_rate)*100 as MTD_avg_interest_rate from bank_loan_data where month(issue_date)= 12 and year(issue_date)=2021

select avg(int_rate)*100 as PMTD_avg_int_rate from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021


/* Average DTI */
select avg(dti)*100 as AVG_DTI from bank_loan_data 

select avg(dti)*100 as MTD_AVG_DTI from bank_loan_data where month(issue_date)= 12 and year(issue_date)=2021

select avg(dti)*100 as PMTD_AVG_DTI from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021

/* Good Loans */

select( 
select cast(
(select count(id) from bank_loan_data where loan_status='Fully Paid' or loan_status='Current')
as FLOAT))
/ count(id) *100 as [Good Loan Applications Percentage] from bank_loan_data 

select count(id) as [Good Loan Applications] from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'

select sum(loan_amount) as [Good Loan Funded Amount] from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'

select sum(total_payment) as [Good Loan Total Recieved Amount] from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'


/* Bad Loans */

select( 
select cast(
(select count(id) from bank_loan_data where loan_status='Charged off')
as FLOAT))
/ count(id) *100 as [Bad Loan Applications Percentage] from bank_loan_data 

select count(id) as [Bad Loan Applications] from bank_loan_data where loan_status='Charged off'

select sum(loan_amount) as [Bad Loan Funded Amount] from bank_loan_data where loan_status='Charged off'

select sum(total_payment) as [Bad Loan Total Recieved Amount] from bank_loan_data where loan_status='Charged off'

/*Loan Status */

select loan_status, count(id) as [Total Loan Applications], sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved],
avg(int_rate)*100 as [Average Interest Rate], avg(dti)*100 as [Average DTI]

from bank_loan_data
group by(loan_status)
order by count(id) desc


select sum(loan_amount) as [MTD Funded Amount], sum(total_payment) as [MTD Amount Recieved]
from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
group by(loan_status)
order by count(id) desc

/* Bank Loan Overview by Month */
select month(issue_date) as [Month Number], Datename(month,issue_date) as [Month Name], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by month(issue_date), Datename(month,issue_date)
order by month(issue_date)

/* Bank Loan Overview by State */
select address_state as [State], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by address_state
order by address_state

/* Bank Loan Overview by Term */
select term as [Term], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by term
order by term

/* Bank Loan Overview by Employee Length*/
select emp_length as [Employee Length], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by emp_length
order by emp_length

/* Bank Loan Overview by Purpose*/
select purpose as [Purpose], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by purpose
order by purpose

/* Bank Loan Overview by Home Ownership*/
select home_ownership as [Home Ownership], count(id) as [Total Loan Applications],
sum(loan_amount) as [Total Funded Amount], sum(total_payment) as [Total Amount Recieved]

from bank_loan_data
group by home_ownership
order by home_ownership