 select * from employees.employees
where gender= 'F' 
and  emp_no>10200
limit 50;

select *from employees.employees
where 
first_name = 'giri' or first_name='denis'
or
last_name = 'giri' or last_name='denis'
;

select first_name, last_name, gender from employees.employees
where ( first_name='shen' or last_name = 'shen'  ) and gender is not null;


select * from employees.employees
where first_name in ('Denis', 'Elvis') 
and gender ='F'; 

select *from employees.employees
where first_name not in ('John', 'Mark','Jacob')
limit 200;

select * from employees.employees
where birth_date like '195%';


select * from employees.employees
where first_name not like ('M%');

select *from employees.titles
where title like ('%engineer%');

select *from employees.employees
where emp_no like ('100__');

select birth_date, first_name, last_name,  gender from employees.employees
where birth_date between '1950-01-01' and '1956-10-01'
limit 500;

select * from employees.salaries
where salary not between '60000' and '69999'
;

select  distinct * from employees.titles 
where title like ('staff');

select count(distinct title) as 'count of titles' from employees.titles;

select  emp_no, avg(salary) as 'average_sal' from employees.salaries
group by emp_no
order by average_sal desc
limit 200 ;

select  hire_date, count(emp_no) as number_of_female_hires
from employees.employees
where hire_date like '1986%' and (gender ='f')
group by hire_date
order by hire_date asc
;





















