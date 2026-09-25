create schema employeedatabase;
use employeedatabase;
create table departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
    );
  CREATE TABLE location (
    location_id INT PRIMARY KEY,
	location VARCHAR(30)
    );
    create table employees (
         employee_id INT PRIMARY KEY,
         employee_name VARCHAR(50),
         gender ENUM('M', 'F'),
         age INT,
         hire_date DATE,
         designation VARCHAR(100),
         department_id INT,
		location_id INT,
   foreign key (department_id) references departments(department_id),
    foreign key (location_id) references location(location_id),
     salary decimal(10,2));
     alter table employees add column email varchar(100);

alter table employees drop column age;
alter table employees change column hire_date date_of_joining date;
Rename table departments to Departments_Info;
Rename table location to Locations;
truncate table employees;
drop table employees;
drop database employeedatabase;
create TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);




