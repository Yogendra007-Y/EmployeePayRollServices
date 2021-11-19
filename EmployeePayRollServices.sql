# UC1: Ability to Create a Payroll Service Database
create database payroll_service;
show databases;
use payroll_service;

# UC2: Ability to Create Employee Payroll Table
select database();
create table employee_payroll (
id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key (id)
);
describe employee_payroll;

# UC3: Ability to create Employee Payroll data in Payroll service Database as part of CRUD Operation
insert into employee_payroll (name, salary, start) values
('Yogendra', 1000000.00, '2018-01-03'),
('Rahul', 2000000.00, '2019-11-13'),
('Sumit', 3000000.00, '2020-05-21');

# UC4: Ability to retrieve all employee payroll data 
select * from employee_payroll;

# UC5: Ability to retrieve salary data for particular employee
select salary from employee_payroll where name= 'Bill';
select * from employee_payroll
	where start between cast('2018-01-01' as date) and date(now());
    
# UC6: Ability to add Gender to the Employee Payroll Table
alter table employee_payroll add gender char(1) after name;
select * from employee_payroll;
update employee_payroll set gender = 'M' where name = 'Yogendra';
update employee_payroll set gender = 'M' where name = 'Rahul';
update employee_payroll set gender = 'F' where name = 'Sumit';

# UC7: Ability to find sum, avg, min, max and number of male and female employees
select sum(salary) from employee_payroll where gender = 'F' group by gender;
select avg(salary) from employee_payroll where gender = 'M' group by gender;
select min(salary) from employee_payroll where gender = 'M' group by gender;
select max(salary) from employee_payroll where gender = 'F' group by gender;
select count(salary) from employee_payroll where gender = 'M' group by gender;

# UC8: Ability to Extend employee_payroll data to store employee information like employee phone address and Department
alter table employee_payroll add phone_number char(12) after name;
select * from employee_payroll;
alter table employee_payroll add address char(50) after phone_number;
select * from employee_payroll;
alter table employee_payroll add department char(50) after address;
select * from employee_payroll;

# UC 9: Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable pay, Income tax, Net pay
alter table employee_payroll add basic_pay char(12) after gender;
select * from employee_payroll;
alter table employee_payroll add deductions double after basic_pay;
select * from employee_payroll;
alter table employee_payroll add taxable_pay double after deductions;
select * from employee_payroll;
alter table employee_payroll add tax double after taxable_pay;
select * from employee_payroll;
alter table employee_payroll add net_pay double after tax;
select * from employee_payroll;

# UC10: Ability to make Terissa as part of Sales and Marketing Department
insert into employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) values
('hemlata', 'Marketing', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2019-11-13');
insert into employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) values
('Jayalalitha', 'Sales', 'F', 3000000.00, 0.00, 0.00, 0.00, 0.00, '2019-11-13');
select * from employee_payroll;

# UC11: Create table of employee_department
create table employee_department (
department_id int unsigned not null auto_increment,
department char(50),
employee_id int unsigned not null,
PRIMARY KEY (department_id),
FOREIGN KEY (employee_id) REFERENCES employee_payroll(id)
			ON DELETE CASCADE
);

insert into employee_department (department, employee_id) values  ('Sales', 4);
insert into employee_department (department, employee_id) values  ('Marketing', 5);

select sum(basic_pay) from employee_payroll
where gender = 'F' group by gender;
select avg(basic_pay) from employee_payroll
where gender = 'M' group by gender;
select min(basic_pay) from employee_payroll
where gender = 'M' group by gender;
select max(basic_pay) from employee_payroll
where gender = 'F' group by gender;
select count(basic_pay) from employee_payroll
where gender = 'M' group by gender;

# UC12: all retrieve query working with new table structure
select * from employee_department;
select * from employee_payroll;
select department from employee_department where department_id= 1;
select * from employee_payroll
	where start between cast('2018-01-01' as date) and date(now());