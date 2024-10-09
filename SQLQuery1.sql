-- total loan application '
select* from Bank_loan_data


select count(id) as Total_loan_Application from Bank_loan_data
-- total application month to date  total application ##2021 data 
-
---(mtd-pmtd)/pmtd

-- total application motd (monthof month )total application 

 select count(id) as mmtd_Total_loan_Application from Bank_loan_data
where MONTH (issue_date)=12 And YEAR (issue_date)=2021

-- total funded amount 
select sum(loan_amount) as Total_loan_Application from Bank_loan_data
where MONTH(issue_date)=12 and Year(issue_date)=2021

--total amount recived in current month 
select sum(total_payment) as Total_loan_Application from Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021

--total amount recived in previous month 
-
--total averave intrest rate
select  round(AVG (int_rate),2)*100 as pmtd_Avg_interest_rate from Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021
--previous  total average intrest rate 2021
select  round(AVG (int_rate),2)*100 as pmtd_Avg_interest_rate from Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021

-- average debt to income ratio (dti) 
select Round(AVG(dti),4)*100 as PMTD_avg_dti from bank_loan_data
where month(issue_date)=11 and year (issue_date)=2021


-- good loan percentage and bad loan percentage 

select*from Bank_loan_data
select(count(case when loan_status='Fully Paid' or loan_status ='current' then id end)*100)
/COUNT(id) As Good_loan_percentage
from bank_loan_data 

-- good loan application or bad loan application 
-
--good loan funded amount 
select sum(loan_amount) as Good_loan_funded_amount from bank_loan_data
where loan_status ='Fully Paid' Or loan---_status='current'
--good loan total recived amount 


select sum(total_payment) as Good_loan_recived_amount from bank_loan_data
where loan_status ='Fully Paid' Or loan_status='current'


-- bad loan data 
select (count(case when loan_status='Charged off'then id end)*100.0)/count(id) as bad_loan
from bank_loan_data

-- total appliction of bad loan 
select count(id) as bad_loan_application from bank_loan_data
where loan_status ='Charged Off'


---

-- month to date how much amount recived 
select loan_status,
sum(total_payment) as mtd_total_amount,
sum(loan_amount) as mtd_total_fund_amount
from bank_loan_data
where month (issue_date)=12
group by loan_status 
select 
MONTH(issue_date) as Month_Number ,
DATENAME(Month ,issue_date) as month_Name,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by MONTH(issue_date),DateName(MONTH,issue_date)
order by MONTH(issue_date)

--ADDRESS STATE 
select 
address_state,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by address_state
order by address_state
--

--term 
select 
term,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by term
order by term

select 
emp_length,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by emp_length
order by emp_length


select 
home_ownership,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by home_ownership
order by home_ownership

--purpose 
select 
purpose,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
group by purpose 
order by count(id) desc

select 
home_ownership,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded__amount,
sum(total_payment) as total_recived_amount
from bank_loan_data
where grade='a'
group by home_ownership
order by count(id) desc