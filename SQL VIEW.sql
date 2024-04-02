------------------------------------
---------I.T Employee View----------
------------------------------------
create or alter view view_it_employee as
(
	select 
		name,
		department,
		salary
	from 
		tbl_employee
	where department ='I.T'
)
------------------------------------
---------ACC Employee View----------
------------------------------------
CREATE VIEW view_acc_employee AS
SELECT *
FROM tbl_employee
WHERE department = 'Account'


select * from view_it_employee

select * from view_acc_employee

insert into view_it_employee values('Mahesh' , 'I.T','28000')

update view_it_employee set name = 'Jinal Viradiya' where e_id = 1002

delete from view_it_employee where e_id = 1002

