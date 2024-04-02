-------------------------------------
--------All Department View----------
-------------------------------------
create view emp_dept as 
select
	e_id,
	department 
from 
	tbl_employee

-------------------------------------
--------All Employee View------------
-------------------------------------
create view emp_detail as 
select
	e_id,
	name,
	salary
from 
	tbl_employee

-------------------------------------
----All Employee Dept and salary-----
-------------------------------------
create or alter view  view_emp_all_details as
select
	ed.e_id,
	emp_detail.name,
	department,
	emp_detail.salary
from 
	emp_dept as ed 
		join
	emp_detail as emp_detail on ed.e_id = emp_detail.e_id

-----------------------------------------------
---Who can get max salary from avg(salary)-----
-----------------------------------------------
select 
	v1.name,
	v1.salary,
	v2.avg_salary 
from 
	view_emp_all_details as v1 
join (
	select 
		department, 
		AVG(cast(salary as int)) as avg_salary 
	from 
		view_emp_all_details 
	group by 
		department
) as  v2
on
	v1.department = v2.department
where 
    cast(v1.salary as int) > v2.avg_salary;

--------------------------------------------------
---Top 3 High Salary taker From Each Department---
--------------------------------------------------
select 
	name,
	salary,
	department 
from (
	select 
		name ,
		salary,
		department,
		row_number() over(partition by department order by salary desc ) as c 
	from 
		view_emp_all_details
	) as d
where c <= 3

---------------------------------------------------
--Salary Differnce Between Avg(salary) and actual--
---------------------------------------------------
select 
	name,
	v1.department,
	salary,
	v2.avg_salary ,
	(v1.salary - v2.avg_salary) as salary_differce
from view_emp_all_details as v1 join
	(
	select 
		department, 
		AVG(cast(salary as int)) as avg_salary 
	from view_emp_all_details 
	group by 
		department
	) as v2
on 
	v1.department = v2.department
where 
	v1.salary <= v2.avg_salary

---------------------------------------------------
-------Same Salary but Different Department--------
---------------------------------------------------
select 
	v1.name,
	v1.department,
	v1.salary,
	v2.name,
	v2.department,
	v2.salary
from 
	view_emp_all_details as v1
join
    view_emp_all_details as v2
on 
	v1.salary = v2.salary
and
	v1.department <> v2.department

---------------------------------------------------
----------Display Incremented Salary --------------
---------------------------------------------------
alter PROCEDURE dis_incremented_salary
(
    @increment decimal(10,2)
)
AS
BEGIN
    SELECT
        name,
        salary,
        cast(salary * @increment / 100 AS decimal(10,2)) AS increment_amount,
        cast(salary + (salary * @increment / 100) AS decimal(10,2) ) AS incremented_salary
    FROM 
        view_emp_all_details;
END


select 
	name,
	salary,
	avg_salary,
	v1.department,
	(salary - avg_salary) as diff_salary,

    ROW_NUMBER() OVER (PARTITION BY diff_salary ORDER BY diff_salary DESC) AS c

from 
	tbl_employee as v1 join
	(
	select 
			department, 
			AVG(cast(salary as int)) as avg_salary 
		from tbl_employee as v2
		group by 
			department ) as v2 on v1.department = v2.department
