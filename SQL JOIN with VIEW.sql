------------------------------------------
-------------Country Table View-----------
------------------------------------------
create view view_country as 
select
	*
from 
	tbl_country

------------------------------------------
----------State Table View ---------------
------------------------------------------
create view view_state as 
select
	*
from tbl_state

------------------------------------------
----------Both Table Join View -----------
------------------------------------------
create or alter view country_acc_state as 
select 
	vc.c_id,
	c_name , 
	vs.s_id,
	s_name 
from 
	view_country as vc join 
	view_state as vs 
on 
	vc.c_id = vs.c_id

------------------------------------------
--------Department High Salary -----------
------------------------------------------
create view view_dept_high_salary as
select name,department,salary from(
select * , ROW_NUMBER() over(partition by department order by salary desc) as c from tbl_employee)as highest_salary where c = 1


select * from view_dept_high_salary


update view_dept_high_salary set salary = 30500 where name = 'Azam'
