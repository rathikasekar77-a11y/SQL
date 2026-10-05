USE employee;
show tables;
Select * from departments
select *from location
select * from employees
select  DISTINCT(salary) from employees;
SELECT age Employee_Age,salary Employee_Salary from employees;
select * from employees
where salary > 50000 and hire_date < "2016-01-01";
select * from employees
where designation = "Data Scientist";
SELECT department_id,salary from employees
ORDER BY department_id asc,salary desc;
select * from departments;
where YEAR(hire_date) = "2018"
LIMIT 5;
select sum(salary) as Total_Salary from employees
where department_id = (select department_id from departments where department_name = "Finance");
select min(age) as minium_age from employees;
SELECT location_id,max(salary) as Max_salary from employees
group by location_id;
select designation,AVG(salary) Avg_salary from employees
where designation like "%Analyst"
GROUP BY designation;
select department_id,count(employee_id) as emp_cnt from employees
GROUP BY department_id
HAVING emp_cnt < 3;
select location_id,avg(age) avg_age from employees
where gender = "F"
group by location_id
having avg_age < 30;
select e.employee_name,e.designation,d.department_name from employees e
join departments d on e.department_id = d.department_id;
select d.department_name,count(e.employee_id) emp_cnt from departments d
left join employees e on e.department_id = d.department_id
GROUP by d.department_name;
select l.location,e.employee_name from employees e
right join location l on e.location_id = l.location_id ;




















