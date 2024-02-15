create table tbl_employee
(
e_id int identity(1,1),
name varchar(100),
department varchar(100),
salary varchar(100)
)

---------------------------------------
--------- Rank Function----------------
---------------------------------------

select 
	*,
	rank() 
	over (order by salary desc) as Rank 
		from 
	tbl_employee

select * , rank()  over(order by salary desc) as rank from tbl_employee 

---------------------------------------
------- Rank Or Partition--------------
---------------------------------------

select 
	*,
	dense_rank() 
	over (partition by department order by salary desc) as Rank 
		from 
	tbl_employee


---------------------------------------
--------- Row_Number Function----------
---------------------------------------

select 
	*,
	row_number() 
	over (order by salary desc) as Rank 
		from 
	tbl_employee

---------------------------------------
------------ Highest Salary------------
---------------------------------------
select * from 
(select name,salary , department,DENSE_RANK() over (partition by department order by salary desc) as ranking 
from tbl_employee) as h
where ranking=1

select * from
(
select name , department , salary , DENSE_RANK() over (partition by department order by salary desc) as ranking
from tbl_employee) as j
where ranking=1

select * , DENSE_RANK() over(partition by department order by salary) from tbl_employee

---------------------------------------
---------2nd Highest Salary------------
---------------------------------------

SELECT
	distinct(salary)
		from 
			tbl_employee 
		order by
			salary asc
	OFFSET 1 ROWS
	FETCH NEXT 2 ROW ONLY
	select * from tbl_employee  order by  salary desc


select distinct(salary) from tbl_employee order by salary desc offset 3 rows fetch next 1 Row only

---------------------------------------
---------2nd Highest Salary------------
---------------------------------------
WITH RankedSalaries AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM tbl_employee
)
SELECT name,salary
FROM RankedSalaries
WHERE salary_rank = 3;

SELECT * from
         (SELECT name,salary , DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
    FROM tbl_employee) as h
WHERE ranking = 3;

---------------------------------------
----------2nd Lowest Salary------------
---------------------------------------

WITH RankedSalaries AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY salary Asc) AS salary_rank
    FROM tbl_employee
)
SELECT name,salary
FROM RankedSalaries
WHERE salary_rank = 2;
--------------------------------------
----create Table with data Copy-------
--------------------------------------
SELECT *
INTO tbl_emp
FROM tbl_employee;

--------------------------------------
---create Table with No Data Copy-----
--------------------------------------
SELECT *
INTO tbl_emp1
FROM tbl_employee where 1 = 0


--------------------------------------
-------Salary bet 25k and 30k---------
--------------------------------------

select * from tbl_employee
where salary between 25000 and 30500 order by salary desc


select * from tbl_employee
where salary in(25000 , 30500 )order by salary desc


select * from tbl_employee
where salary not in(25000 , 30500 )order by salary desc

--------------------------------------
---------Case Statement --------------
--------------------------------------

select * ,
case when salary<26500 then 'low'
	 when salary<=29500 then 'medium'
	 when salary<=35000 then 'High'
	 else 'salary is null'
	 end as salary_test

	 from tbl_employee
	 where salary between 25000 and 30500 order by salary desc


select *,
case when department = 'I.T' then name + cast(e_id as varchar(100))
	when department !='I.T' then 'Non I.T'
	else 'Deparment Is Null'
	end as department_check
	from tbl_employee

-----------------------------------
----Top 5 High Salary Gainer-------
-----------------------------------

SELECT top 5 * FROM tbl_employee ORDER BY salary desc;

-----------------------------------
--------GET SALARY ROW-------------
-----------------------------------

create function get_salary()
returns table 
as
return
	select
		salary
	from
		tbl_employee


CREATE FUNCTION get_emp
(
    @e_id INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM tbl_employee WHERE e_id = @e_id
);


select * from get_emp(11)

-----------------------------------
--------Addition Function----------
-----------------------------------

CREATE FUNCTION dbo.addition_function
    (
	    @a AS INT,
	    @b AS INT
    )
    RETURNS INT
    AS
    BEGIN	   
	    DECLARE @result AS INT
	    SET @result = @a + @b
	    RETURN @a + @b
    END;

select dbo.addition_function(40,20)

-----------------------------------
--------Subtract Function----------
-----------------------------------
create function dbo.subtract_function
(
	@a as int,
	@b as int
)
returns int
	as
	begin

	declare @result as int
	set @result = @a - @b
	return @result
	end

select dbo.subtract_function(40,20)

-----------------------------------
--------Subtract Function----------
-----------------------------------
create function dbo.multiplication
(
	@a as int,
	@b as int
)
returns int
	as
	begin

	declare @result as int
	set @result = @a * @b
	return @result
	end

select dbo.multiplication(40,20)

-----------------------------------
--------Division Function----------
-----------------------------------
create function dbo.division
(
	@a as int,
	@b as int
)
returns int
	as
	begin

	declare @result as int
	set @result = @a / @b
	return @result
	end

select dbo.division(40,20)

-----------------------------------
--------Write ALL Name in----------
--single line with Semicolumn------
-----------------------------------
SELECT name+ ', ' 
From tbl_employee
for xml path('');

-----------------------------------
---Find Max ID without using max---
-----------------------------------
select top 1 e_id from tbl_employee order by e_id desc

-----------------------------------
------EVEN Number Records Only------
-----------------------------------
Select 
	* 
from 
	tbl_employee 
	where e_id % 2 = 0

SELECT TOP 100 * FROM tbl_employee WHERE e_id % 2 = 1 ORDER BY e_id

select top 5 * from tbl_employee where e_id % 2 = 1 order by e_id


SELECT DATEADD(MS, 1*1000, 0)

	select 
		top 25 percent *
	from 
		tbl_employee 
		order by e_id desc

	select 
		salary 
	from 
		tbl_employee
		group by salary;

-----------------------------------
------Blank Table from Existing----
-----------------------------------
SELECT
	*
INTO 
	tbl_temp_1
FROM 
	tbl_employee
where
		1=0
-----------------------------------
--------Ternary Operator ----------
-----------------------------------

SELECT name,salary, (CASE WHEN salary = '25500' THEN 'Low Salary' END) AS SALARY ,(CASE WHEN salary<='29500' THEN 'Medium Salary' ELSE 'High Salary' END)  FROM tbl_employee

-----------------------------------
----------- 10 Table --------------
-----------------------------------

declare		
	@h varchar(100) = 10 , 
	@j varchar(100)=1
while @h<=100 	
while @j<=10
begin
	print '10 * '+ @j + ' = ' + @h
set @h =@h+10	set @j = @j + 1
end

--------------------------------------------
-----------	Find Department ----------------
--------------------------------------------
---------Max Salay and Avg Salary ----------
--------------------------------------------

with max_sal as(
select department,salary from(
select department ,salary, ROW_NUMBER() over(partition by department order by salary desc) as c from tbl_employee
) as max_salary where c= 1
),
avg_sal as(
select department ,avg(TRY_CAST(salary AS DECIMAL(10, 2))) AS AvgSalary from tbl_employee
group by department
)
select mx.department , mx.salary , av.AvgSalary from max_sal as mx join avg_sal as av on mx.department = av.department

--------------------------------------------
--Find Who Can Enroll More Than One Course--
--------------------------------------------
SELECT s.stu_full_name
FROM tbl_lln_test s
GROUP BY s.stu_full_name
HAVING COUNT(DISTINCT s.test_id) > 1;





