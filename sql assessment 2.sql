#How scattered is the man-power for each title?
select t.title, count(e.emp_no) as man_power
from employees e
join titles t on t.emp_no = e.emp_no
group by t.title;

#How is the salary distribution between titles?
select s.emp_no, t.title, s.salary
from salaries s
join titles t on s.emp_no = t.emp_no
order by salary;

#How scattered is the man-power in each department?
select d.dept_no, d.dept_name,count(de.emp_no) as manpower
from departments d
join dept_emp de on d.dept_no=de.dept_no
group by dept_name;


#Who is the highest and lowest paid employee in the company?

select e.emp_no, e.first_name, s.salary
from employees e
join salaries s on e.emp_no=s.emp_no
where 
s.salary in (select max(salary) from salaries)
or s.salary in (select min(salary) from salaries);

#Who are the managers for each department? List their names
select de.dept_no,d.dept_name, e.first_name, e.last_name
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on d.dept_no=de.dept_no
;

#using union only command, list all the employees who were hired in 1985, 1989 and 1994 only and sort them by hire dates
select  first_name,last_name,hire_date
from employees
where hire_date like '1985%'
union
select first_name,last_name,hire_date
from employees
where hire_date like '1989%'
union
select first_name,last_name,hire_date
from employees
where hire_date like '1994%'
order by hire_date;

#What is the average salary of those employees who were hired after 01st Jan 1986?

select employees.emp_no,employees.first_name,
 employees.last_name,employees.hire_date, 
 avg(salaries.salary) as average_salary
from 
employees.employees
join 
employees.salaries on employees.emp_no = salaries.emp_no
 where employees.hire_date >'1986-01-01'
 group by employees.emp_no
 order by average_salary
 ;
 
# Is there gender disparity in the company?

select 
 d.dept_no , 
 sum(gender='F') AS no_of_females,
 sum(gender='M') as no_of_males
 from employees e
 join dept_manager d on e.emp_no=d.emp_no
 group by d.dept_no;

#Which department is best paid in the company?

 select de.dept_no,d.dept_name,
 avg(s.salary) as avg_salary
 from salaries s
 join dept_emp de on s.emp_no=de.emp_no
 join departments d on de.dept_no=d.dept_no
 group by de.dept_no
 order by de.dept_no;

#How has the salary changed over the years?
select t.title,
year(s.from_date)as yearofjoining,
avg(s.salary) as average_salary
from titles t
join salaries s on t.emp_no=s.emp_no
group by t.title,yearofjoining
order by  t.title,yearofjoining;








