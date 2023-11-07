--Generate your tables under these parameters. Make sure your varchar length can fit every letter for each string datum.
create table titles (title_id varchar(50) not null, title varchar(50) not null, primary key (title_id)); 

create table employees (emp_no int not null, emp_title_id varchar(50) not null, birth_date date not null, first_name varchar(50) not null, last_name varchar (50) not null, sex character(1) not null, hire_date date not null, foreign key(emp_title_id) references titles(title_id), primary key (emp_no));

create table salaries (emp_no int not null, salary int not null, foreign key (emp_no) references employees (emp_no), unique (emp_no));

create table departments (dept_no varchar(50) not null, dept_name varchar (50) not null, primary key (dept_no));

create table dept_manager (dept_no varchar(50) not null, emp_no int not null, foreign key (dept_no) references departments (dept_no), foreign key (emp_no) references employees (emp_no));

create table dept_emp (emp_no int not null, dept_no varchar(50) not null, foreign key (dept_no) references departments (dept_no), foreign key (emp_no) references employees (emp_no));
--Refresh to generate all tables, then import each one's data in order. You may now start querying. 