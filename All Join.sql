select * from tbl_country
select * from tbl_state
select * from tbl_city

------------------------------------
---Innner Join(match data dispaly)--
------------------------------------

select c_name,s_name,city_name 
from tbl_country 
as c join tbl_city  as ci
on c.c_id=ci.c_id 
join 
tbl_state as s on  s.s_id = ci.s_id

------------------------------------
---Left Join(left side all data)--
------------------------------------

select c_name,city_name 
from tbl_country 
as c left join tbl_city  as ci
on c.c_id=ci.c_id 

------------------------------------
---Right Join(right side all data)--
------------------------------------

select c_name,city_name 
from tbl_country 
as c right join tbl_city  as ci
on c.c_id=ci.c_id 

------------------------------------
---full outer Join(display all data)--
------------------------------------

select c_name,city_name 
from tbl_country 
as c full outer join tbl_city  as ci
on c.c_id=ci.c_id 

------------------------------------
--cross Join(data display multi times)--
------------------------------------

select c_name,city_name 
from tbl_country
as c cross join tbl_city  as ci


select  c_name , s_name , city_name from tbl_city as c
join tbl_country as co on c.c_id=co.c_id join tbl_state as s on c.s_id = s.s_id

select city_name , c_name from tbl_city as c
left join tbl_country as co on c.c_id= co.c_id

select city_name , c_name from tbl_city as c
right join tbl_country as co on c.c_id=co.c_id

select city_name , c_name from tbl_city as c
full outer join tbl_country as co on c.c_id = co.c_id
