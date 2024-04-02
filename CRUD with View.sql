------------------------------------------
----------ACC Dept Employee---------------
------------------------------------------
CREATE VIEW view_acc_employee AS
SELECT *
FROM tbl_employee
WHERE department = 'Account'
WITH CHECK OPTION;

------------------------------------------
----------DIS Dept Employee---------------
------------------------------------------
create proc dis_acc_employee_sp
as
begin
	select  
		* 
	from 
		view_acc_employee
end

------------------------------------------
----------Select Dept Employee---------------
------------------------------------------
create proc sel_acc_dept_emp_sp
(
	@e_id int
)
as
begin
	select  
		* 
	from 
		view_acc_employee
where 
	e_id = @e_id
end


------------------------------------------
------Insert ACC Dept Employee------------
------------------------------------------
create proc ins_acc_dept_emp_sp
(
	@name varchar(100),
	@department varchar(100),
	@salary varchar(100)
)
as
begin
	insert into view_acc_employee
	values
		(
			@name,
			@department,
			@salary
		)
end

------------------------------------------
------Update ACC Dept Employee------------
------------------------------------------
create proc upd_acc_dept_emp_sp
(
	@e_id int,
	@name varchar(100),
	@department varchar(100),
	@salary varchar(100)
)
as
begin
	update view_acc_employee
	set
		name = @name,
		department=@department,
		salary = @salary
	where
		e_id = @e_id
end

------------------------------------------
------Update ACC Dept Employee------------
------------------------------------------
create proc del_acc_emp_dept_sp
(
	@e_id int
)
as
begin
	delete from view_acc_employee 
	where 
		e_id = @e_id
end
