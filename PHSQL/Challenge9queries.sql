--What are the employees' numbers, surnames, first names, sexes, and salaries?
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, cast(salaries.salary as money)
from employees join salaries on employees.emp_no=salaries.emp_no;

--What are the first names, surnames, and hiring dates of our employees hired in 1986?
select first_name, last_name, hire_date from employees where extract(year from hire_date)=1986
order by 3;

--Who manages each department? What are their employee numbers, first and surnames, and their departments' names and numbers?
select employees.last_name, employees.first_name, employees.emp_no, dept_manager.dept_no, departments.dept_name
from dept_manager join employees on dept_manager.emp_no=employees.emp_no
join departments on dept_manager.dept_no=departments.dept_no
order by 1;

--Who, of our employees, has the first name Hercules and a surname starting with B? What are their sexes?
select first_name, last_name, sex from employees where first_name='Hercules' and last_name like 'B%';

--Who works in our Sales department, and what are their numbers?
select employees.emp_no, employees.last_name, employees.first_name
from employees where employees.emp_no in (select emp_no from dept_emp where dept_no = 'd007');

--What are the names and employee numbers of everyone in our Sales and Development departments?
with s_d_emp as (select emp_no, dept_no from dept_emp where dept_no in ('d007', 'd005'))
select sd.emp_no, e.last_name, e.first_name, d.dept_name
from s_d_emp sd join employees e on sd.emp_no=e.emp_no
join departments d on sd.dept_no=d.dept_no
order by 2;

--How many employees share each surname?
select last_name, count(last_name) as allof
from employees group by last_name
order by allof desc;