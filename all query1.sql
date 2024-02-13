--select * from tbl_country


--insert into tbl_country
--values('India')

--update
--	tbl_country
--set
--	c_name='Austraila'
--where
--	c_id=1

--delete from tbl_country

--truncate table tbl_country

create table tbl_Country1
(
c_id int identity(1,1),
c_name varchar(50) not null

)

select * from tbl_Country1
truncate table tbl_Country1 

insert into tbl_Country1
values('India'),('Australia') ,('Canada'),('England'),('America')


create table tbl_state
(
s_id int identity(1,1),
c_id int,
s_name varchar(50)
)
select * from tbl_state

select * from tbl_state

insert into tbl_state values ('1' ,'Gujrat'),
	('2' , 'Victoria'),
	('3' , 'Alberta'),
	('4' , 'London'),
	('5' , 'California')

insert into tbl_Country1
values('UAE')


select 
	c.c_id, 
	s.s_id,
	c_name,
	s_name
from
	tbl_Country1 as c
	join tbl_state s
on 
	c.c_id = s.c_id  

select c.c_id , s_id , c_name, s_name  from tbl_Country1 as c
left join tbl_state s
on c.c_id = s.c_id 


create table tbl_state1
(
s_id int identity(1,1),
s_name varchar(50)
)

select * from tbl_state1
select * from tbl_Country1

create table tbl_Country2
(
c_id int identity(1,1),
c_name varchar(50) not null
)

select * from tbl_Country2
truncate table tbl_Country2
