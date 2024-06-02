#Extract the information about all department managers who were 
#hired between the 1st of January 1990 and the 1st of January 1995.

select e.emp_no,e.first_name,e.last_name,e.hire_date,d.dept_no
 from employees e
 join dept_manager d on e.emp_no=d.emp_no
 where e.emp_no 
 in(
 select emp_no from dept_manager
 );


#Extract information of all the “Female Managers
select
	e.emp_no,e.gender, e.first_name, e.last_name, dm.dept_no, dm.from_date, dm.to_date
from employees e
	JOIN dept_manager dm on e.emp_no = dm.emp_no
where e.emp_no in (select emp_no from employees where gender='F');


#Select the entire information for all employees whose job title is “Assistant Engineer”.
select * from employees
where emp_no in
(
select emp_no from titles where title='Assistant Engineer'
);


#Please get the minimum, maximum and average salary of all the employees. Then, 
#Add another column (“Salary Bracket) to the “Salaries” table with following conditions:
 #    a) Anyone with the salary less than or equal to 65000 should return “Low salaried” in the new column
  #   b) Anyone with salary between 65000 and 100,000 should return Medium
   #  c) Otherwise “High Salaried” in the new column
   select emp_no,
   min(salary) as minimum,
   max(salary) as maximun,
   avg(salary)as average
group by emp_no
from salaries
case 
when average<= '65000' then 'low salaried'
when average between '65000' and '100,000' then 'medium'
else 'High salaried'  
end as salary_Bracket
;
   

   
   
   
   
  # Add another column (name the column to your liking) to the “Titles”
 # table with following conditions. Anyone with the title “Engineer” or “Technical” 
  #in it should return “Engineer” in the new column, otherwise “Admin” in the new column
  select * ,
  case when title like 'Engineer' then 'Engineer'
  when title like 'Technical' then 'Engineer'
  else 'Admin'
  end as New_tag
  from titles
  ;
  
  #Add another column to the “employees” table (call it hire_quarter),
#that returns the Quarter number for the respective hire month. For eg, 
#if someone joined in either Jan, Feb or March, this column should return the value “Q1”

select * ,
case
when month(hire_date) between 1 and 3 then 'Q1'
when month(hire_date) between 4 and 6 then 'Q2'
when month(hire_date)between 7 and 9 then 'Q3'
when month(hire_date)between 10 and 12 then 'Q4'
 end as hire_Quarter
 from employees;
 
# Using “Case When”, in the “dept_emp” table, please add the respective department name
select * from departments;
select * ,
case
when dept_no='d001' then 'Marketing'
when dept_no='d002' then 'Finance'
when dept_no='d003' then 'Human Resources'
when dept_no='d004' then 'Production'
when dept_no='d005' then 'Development'
when dept_no='d006' then 'Quality Management'
when dept_no='d007' then 'Sales'
when dept_no='d008' then 'Research'
when dept_no='d009' then 'Customer Service'
end as department_name
from dept_emp;


