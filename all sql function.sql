-------------------------------------
---Print 1 to 100 Using While Loop --
-------------------------------------
declare @v1 int

set @v1 = 0

while(@v1<100)

begin

set @v1 = @v1 + 1

print @v1

end


declare @v1 int 
set @v1 =0
while (@v1 < 10)
begin
set @v1 = @v1+1

print @v1

set @v1 = @v1+1
end


-------------------------------------
---Print odd number Using if Loop --
-------------------------------------
declare @v2 int

set @v2 = 0

while(@v2<=100)

begin

set @v2 = @v2+1

print @v2

	if(@v2 >= 100)
	begin 
	break
	end

	set @v2 = @v2+1
end

-------------------------------------
---Print even number Using if Condn --
-------------------------------------

declare @v3 int

set @v3 =0
print @v3
Label:

set @v3 = @v3+2
print @v3

if(@v3 <=100)

goto label


-------------------------------------
---Print odd number Using if Condn --
-------------------------------------
declare @v4 int

set @v4 = 1
print @v4

Label:

set @v4 = @v4 + 2

print @v4
if(@v4 <=100)

goto Label

-------------------------------------
---------Age Differnce --------------
-------------------------------------

declare @Age1 int = 50
declare @Age2 int = 18
if(@Age1 > @Age2)
	begin 
	print 'Old Man'  
	end
else
begin
print 'Young Man'  
end

-------------------------------------
---------7 Table --------------------
-------------------------------------
declare @num1 varchar(100) = 7
declare @num2 varchar(100) =1

while @num1 <=70
while @num2 <=10
begin

	print '7 * '+ @num2 + ' = ' + @num1 
	set @num1 = @num1 + 7
	set @num2 = @num2 + 1
end
-------------------------------------
---------9 Table --------------------
-------------------------------------

declare @num4 varchar(100) = 9
declare @num5 varchar(100)=1

	while @num4<=90
	while @num5<=10

begin

	print '9 * ' + @num5+ ' = ' +@num4
	set @num4=@num4+9
	set @num5 = @num5 + 1

end

declare @i varchar(100) = 6, @j varchar(100) = 1
	while @i<=60
	while @j<=10
begin

	print'6 * ' +@j + ' = '+@i
	set @i = @i +6
	set @j = @j +1
end


declare @num2 int = 2
while @num2 <= 2048
begin

print @num2
set @num2 = @num2 * 2
end


-----------------------------------
---Display Current Database User ---
-----------------------------------

SELECT CURRENT_USER
select USER


-----------------------------------
---Ascii Value Find & Fetch data ---
-----------------------------------

select c_name ,ASCII(c_name) as asciivalue from tbl_Country

select c_name from tbl_Country where ASCII(c_name) = 73

-----------------------------------
------Find Character Length-------
-----------------------------------

select LEN('Vaibhav Gohel') as length_of_name

select c_name , len(c_name) as name_length from tbl_Country

-----------------------------------
------Print Today Date-------------
-----------------------------------

declare @date date = '2023-aug-19';
begin
select @date as Today_date
end

select CURRENT_TIMESTAMP as time

select GETDATE() as Today_date

SELECT FORMAT (getdate(), 'd')
SELECT FORMAT (getdate(), 'D') as With_day
SELECT FORMAT (getdate(), 'f') as with_am_pm

declare 
	@Today varchar(100) = '2023-08-19'
		SELECT
		FORMAT(CAST(@Today AS DATE), 'dd-MMMM-yyy');

-----------------------------------
------Join 2 value or column-------
-----------------------------------

select CONCAT('himanshu' ,' ' , 'makwana') as Full_name
select CONCAT('Azam', ' ' , 'Piludiya')


-----------------------------------
------Store In Format ------------
-----------------------------------

select FORMAT(555565.65 , 'c', 'hi-IN') as Value

select format(23365.656 , '##,######') as value

-----------------------------------
------Convert Lower ------------
-----------------------------------

select LOWER('HI! I AM HIMANSHU ') AS Message

select LOWER('HELLO I AM AZAM') as Message

-----------------------------------
---Find char from left & Right-----
-----------------------------------
select left('himanshu makwana' , '8') as name

select left('Vaibhav Gohel' , '7') as Name

select RIGHT('Vaibhav Gohel' , '5') as Suranme

SELECT LEFT('Himanshu Makwana', 8) AS ExtractString;

select RIGHT('hii i am Himanshu Makwana' , 7) as string

select LEFT (c_name , 3) as country_short_name from tbl_Country 

-----------------------------------
---Remove Space left & Right-----
-----------------------------------

select  LTRIM('    Azam Piludia') as full_name

select LTRIM('            This Is a Test') as Test

select RTRIM('Azam Piludia            ') as full_name

select RTRIM('This Is a Test             ') as test

select TRIM(    'himanshumakwana'      );

-----------------------------------
---Character Position Find-----
-----------------------------------

select CHARINDEX('Frd', 'Hii! Frds')
select CHARINDEX(',' , 'him, mak' , 1) as position

DECLARE @NAME VARCHAR(100) = 'HIMANSHU'

select PATINDEX('%MAN%' , @NAME)
SELECT CHARINDEX('N' , @NAME )

select NCHAR(65) as number_to_unicode

-----------------------------------
--------- For Quotes --------------
-----------------------------------
SELECT QUOTENAME(c_name , '{ }') from tbl_Country 
SELECT QUOTENAME(c_name , '" "') from tbl_Country 
SELECT QUOTENAME(c_name , '[]') from tbl_Country 
SELECT QUOTENAME(c_name , '''') from tbl_Country 
SELECT QUOTENAME(c_name , '()') from tbl_Country 
SELECT QUOTENAME(c_name , '<>') from tbl_Country 
select QUOTENAME(c_name , '{}') from tbl_Country
select QUOTENAME(c_name , '()') from tbl_Country
select QUOTENAME(c_name , '[]') from tbl_Country
select QUOTENAME(c_name , '<>') from tbl_Country
select QUOTENAME(c_name , '" "') from tbl_Country
select QUOTENAME(c_name , '''') from tbl_Country
-----------------------------------
--------- For Replace --------------
-----------------------------------

declare @name3 varchar(100) = 'Maulik'

select REPLACE(@name3 ,@name3 , 'Himanshu') as Updated_Name

declare @surname varchar(100) = 'Makwana'
select REPLACE(@surname , @surname , 'Viradiya')

-----------------------------------
--------- For Repeat --------------
-----------------------------------

select REPLICATE(s_name, 3) from tbl_state

declare @Subject varchar(100) ='ASP.Net'
select REPLICATE(@Subject , 2)

select REPLICATE(c_name + SPACE(2), 2) from tbl_Country


-----------------------------------
--------- For Reverse --------------
-----------------------------------

select REVERSE('himanshu')

select REVERSE(c_name) from tbl_Country

declare @Password int = 25250
select REVERSE(@Password) as Reverse_Pass

select DIFFERENCE('himanshu' , 'makwana')

-----------------------------------
---- Convert int to string --------
-----------------------------------
select STR(25.575,5,55)
select STR(99.99)

select STR(25.75)

select STR(90.38)
-----------------------------------
---- Work like a Replace --------
-----------------------------------
select STUFF('College Best', 1 ,7,'School')

select STUFF('Waste' , 1 , 5 , 'Best')

select STUFF('himanshu makwana' , 1 , 8 , 'Maulik')

select STUFF('himanshu maulik' , 10 , 6 , 'Makwana')as name , LEN('himanshu makwana') as length 

SELECT SOUNDEX('Himanshu'), SOUNDEX('himanshu')

select c_id , s_name +SPACE(10)  from tbl_state

-----------------------------------
-------- Find String -------------
-----------------------------------

select SUBSTRING('HEllO Frds !' ,1 ,5)

select SUBSTRING('Good Morning' , 6 ,7)

select c_name ,UNICODE(c_name) as Unicode_value  from tbl_Country

select  UPPER(c_name) from tbl_Country

select 'himanshu' +SPACE(10)+ 'makwana'

-----------------------------------
-------- Operators -------------
-----------------------------------

declare @val1 int = 20
declare @val2 int = 2

print @val1 % @val2
print @val1 / @val2
print @val1 * @val2
print @val1  - @val2
print @val1  + @val2


declare @person1_age int = 45
declare @person2_age int = 18

if(@person1_age < @person2_age )
	begin
		print 'Age is 45'
	end
else
begin
		print 'Age is 18'
end


select * from tbl_admin_master
where password = 'hi@123' and email = 'hi@gmail.com' 

select * from tbl_admin_master
where password='a@123' or email = 'm@gmail.com'

select f_name from tbl_admin_master where admin_id between 1 and 4

select c_id from tbl_country where c_id in(1,4)

select f_name from tbl_admin_master where admin_id not in(1,4)

select f_name from tbl_admin_master where f_name like 'h_r%'


SELECT c_id, COUNT (c_id) AS Number
FROM tbl_admin_master
GROUP BY c_id

select len('Himanshu')

select CHARINDEX('n' , 'Himanshu' )

select CONCAT('Makwana ' , 'Himanshu' )

select DATALENGTH('himanshu@gmail.com')

select LEFT('Vaidik Bhatt' , '6')

select RIGHT('Vaidik Bhatt' , '5')

select LEN('Vaidik Bhatt')

select LOWER('Vaidik Bhatt')

select UPPER('Vaidik Bhatt')

select LTRIM('               Vaidik Bhatt')

select RTRIM('Vaidik Bhatt          ')

select QUOTENAME('Vaidik' , '()')


select ASCII('India')

select CHAR(72)

select char(90)

select CHARINDEX('F' , 'HELLO FRD')

select CONCAT('Vaibhav' , 'Gohel')

select DATALENGTH('Vaibhav Gohel')

select CHARINDEX('n' , 'himanshu')

select DIFFERENCE('himanshu' , 'himashu')

select FORMAT(22233 , 'c' , 'hi-IN')

declare @datetime date = '2021-09-18'
select FORMAT (cast(@datetime as date), 'dd-MMM-yyy')

select FORMAT(GETDATE() , 'd')

select FORMAT(GETDATE() , 'D')

select FORMAT(GETDATE() , 'F')
select FORMAT(GETDATE(), 'dd-MMM-yyy')

select LEFT('Himanshu Makwana' , 8)

select RIGHT('Maulik Viradiya' , 8)

select len('himanshu')

select LOWER('JAVIYA VAIBHAV')

select LTRIM('           left space remove') as Remove_space

select RTRIM('Right Space Remove              ')as Remove_space

select PATINDEX('%shu%' , 'himanshu')

select PATINDEX('%h%', 'Hii!')

select QUOTENAME('Roshani' , '<>')
select QUOTENAME('Aman' , '{}')

select REPLACE('Vaibhav' , 'vai' ,'jai')

select REPLACE('himanshu' , 'hu' , 'u')

select REPLICATE('Hii! ' , 2)

select REPLICATE(c_name + SPACE(2), 2) from tbl_Country

select REVERSE('Hurray!')

declare @number int = 252550
select REVERSE(@number)

select UPPER('himanshu makwana')

select stuff('Hiii Dear' , 1 , 4 , 'Hello')

select stuff('Dear Frds' , 6 ,4 ,'Hello')

select UNICODE(c_name) ,c_name from tbl_Country


declare @number1 varchar(100) = 10
declare @number2 varchar(100) = 1

while @number1<=100
while @number2<=10
begin

print '10 * ' +@number2 + ' = ' +@number1
set @number1 = @number1+10
set @number2 = @number2+1
end


declare @value varchar(10) = 5
declare @value1 varchar(10) = 1
					
while @value<=50
while @value1<=10
				
begin
print '5 * ' +@value1 + ' = ' +@value
set @value = @value + 5
set @value1 = @value1 + 1
end


declare @val varchar(4)=23
declare @val1 varchar(4) = 1

while @val <=230
while @val1 <=10

begin
print '23 * ' +@val1 + ' = ' +@val
set @val = @val+23
set @val1 = @val1 + 1
end

  

declare @j int = 1
while @j<=10
begin
print '500 * ' + cast(@j as varchar(2)) + ' = ' + cast(500 * @j as varchar(4));
set @j = @j + 1
end


select REPLICATE('Asp.net' , 2)

select REVERSE('Ravi')

select REPLACE('Himanshu' , 'Himanshu' , 'Himanshu Makwana')

select CONCAT('Hello!' ,' ','World')

select STUFF('Himanshu Makwana', 1 , 8 , 'Keval')

select QUOTENAME('Test' , '{}')

select FORMAT(GETDATE() , 'F')

select FORMAT(25555.555 , 'c' , 'hi-IN')

select LEFT('Dharmesh' , 3)
select RIGHT('Mahaveer' , 4),len('veer')

select SUBSTRING('Sql Server' , 1 , 3)

select SUBSTRING(c_name , 1 ,4) from tbl_Country

select LEFT(c_name , 4) from tbl_Country

declare @param1 int
set @param1 = 1
while @param1<=100
begin
print @param1 
set @param1 = @param1 + 2

end


declare @parameter int
set @parameter = 1

while @parameter<=10
begin
print @parameter % 2
set @parameter  = @parameter + 1
end

select STUFF('himanshu makwana' , 1 , 8 , 'Keval')
select REPLACE('himanshu' , 'shu', 'su' )
select CONCAT('Jay' , 'Hind')
select REPLICATE('ASp.net   ' , 2)
select FORMAT(GETDATE() , 'dd-MMM-yyy')
select FORMAT(557893.12 ,'c' , 'EN-US') as Indin_Rupees
select LTRIM('            Test')

select RTRIM('Test mark       ')
select ASCII(c_name)  ,c_name from tbl_Country
select ASCII('A')
select ASCII('Z')

select LEFT('Vaibhav Gohel' , 7 )
select right('Vaibhav Gohel' , 5)
select SUBSTRING('Vaibhav Gohel' ,9 , 5)

select QUOTENAME('Practice' , '{}')

select LOWER('KEVAL MAKWANA')
select UPPER('keval makwana')

select LEN('harpreet')

declare @val int
set @val = 1
while @val<10
begin
print @val % 2
set @val = @val + 1
end

select COS(2)
select EXP(2)

select SQRT(16)
select SQUARE(8)

select POWER(2 ,10)

select FLOOR(25.999)

select CEILING(26.00001)

select SUM(admin_id) from tbl_admin_master
select MAX(admin_id) from tbl_admin_master
select min(admin_id) from tbl_admin_master

select RAND() * (10-5)+7

-------------------------------------
----------Date Functions-------------
-------------------------------------
SELECT CURRENT_TIMESTAMP;

declare @dateadd date = '2001-11-08'
begin
select DATEADD(YEAR , 25 , @dateadd)
end

select DATEDIFF(YEAR ,'2001-11-08' , '2024-11-08')

select DATEADD(QUARTER , 2 , GETDATE())

select DATEADD(WEEK,1 , GETDATE())

select DATEADD(DAY , 3 , GETDATE())

declare @diff date = '2001-11-08'
begin
select DATEDIFF(YEAR , @diff , GETDATE())
end

select DATEFROMPARTS(2023 ,12,12)

select DATENAME(WEEKDAY , GETDATE())

select DAY(GETDATE())
select MONTH(GETDATE())
select YEAR(GETDATE())

select SYSDATETIME()

select DATEDIFF(YEAR , '2001-11-08' , GETDATE())

select cast('2023-11-08' as date)

select CAST(25.65 as varchar(100))

select CONVERT(char, GETDATE())

select CONVERT(bigint,9510418003)

SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');
select coalesce(NULL , NULL , 'Value' , NULL , 'Test')

select CURRENT_USER

select IIF(500> 1000 ,'yes' , 'no')

select IIF(25000>5000 , 'yes' , 'no')
select  admin_id ,f_name , iif(admin_id >=3 , 'more' , 'less') from tbl_admin_master

select ISNUMERIC('12345')
select ISNUMERIC('hiii')
select ISNUMERIC(25+28)
select ISNUMERIC(20 - 08- 2020)
select ISNUMERIC('20/08/2020')


---------------------------------
-------Compare Value ------------
----if same so ans null----------
---------------------------------
select NULLIF('hello' , 'hiii')       --hello

select nullif('Vaibhav' , 'VAIBHAV')  --null
select nullif('1234' , 1234)          --null 

select SESSION_USER

SELECT SESSIONPROPERTY('ANSI_PADDING');

select SYSTEM_USER

select USER_NAME(3)

select CURRENT_USER

select DB_ID()


------------------------------
-------* Patterns-------------
------------------------------

declare @p1 int
select @p1 = 1
while @p1<=5
begin
print replicate('*' , @p1)
set @p1 = @p1 +1
end


declare @p2 int
select @p2 = 5
while @p2>0
begin 
print replicate('*' , @p2)
set @p2 = @p2 -1
end

declare @p2 int = 5
while @p2>0
begin
print replicate('*',@p2)
set @p2 = @p2-1
end



declare @p3 int , @p4 int
select @p3 = 1 ,@p4=4
while @p3<=5
begin
print space(@p4) + replicate('*', @p3)
set @p4 =@p4-1
set @p3 = @p3 + 1
end

declare @h1 int , @h2 int
select @h1 = 5 , @h2=1
while @h1>=0
begin
print space(@h2) + replicate('*' ,@h1)
set @h1 = @h1 -1
set @h2 = @h2 +1 
end

declare @p5 int , @p6 int
select @p5=5 , @p6=1
while @p5>=1
begin
print space(@p6) + replicate('*',@p5)
set @p5 = @p5 - 1
set @p6 = @p6 +1
end


declare @i int , @j int
select @i = 1
select @j = 7
while @i <=7
begin
print space((@j - @i)/2) + replicate('*' , @i)
set @i = @i + 2
end

select ASCII('A') 
select CHAR(65)

select CHARINDEX('m' , 'himanshu')
select CONCAT('himanshu ' ,'makwana')
select DATALENGTH('himanshu')
select DIFFERENCE('himanshu' , 'HIMANSHU')
select FORMAT(GETDATE() , 'dd-MMM-yyy')
select FORMAT(25525 , 'c' , 'hi-in')
select LEFT('vivek paghdar' , 5)
select RIGHT('vivek paghdar' , 7)
select LEN('vivek')
select LOWER('VIVEK PAGHDAR')
select UPPER('vivek paghdar')
select LTRIM('          vivek')
select RTRIM('vivek         ')
select NCHAR(72)
select PATINDEX('%ve%' , 'vivek')
select QUOTENAME('vivek' , '<>')
select REPLACE('vivek' ,'vek' , 'cket' )
select REPLICATE('vivek ' , 2)
select REVERSE(2525)
select SOUNDEX('himanshu') , SOUNDEX('Himansu')
select CONCAT('vivek' + SPACE(10) , 'paghdar')
select STR(10.30)
select STUFF('sql tutorial' , 1 , 3 , 'html')
select SUBSTRING('sql tutorial' , 5 , 8)
select c_name ,UNICODE(c_name) from tbl_Country

select COUNT(admin_id) from tbl_admin_master
select avg(admin_id) from tbl_admin_master

select FLOOR(25.9999)
select CEILING(35.001)

select MAX(admin_id) from tbl_admin_master

select MIN(admin_id) from tbl_admin_master
select pi()
select POWER(2 , 10)
select SQRT(64)
select SQUARE(5)
select sum(admin_id) from tbl_admin_master
select RAND()*  (15 -10)+7

select DATEADD(YEAR ,2, GETDATE())
select DATEADD(MONTH , 2 , GETDATE())
select DATEADD(DAY , 1 , GETDATE())

select DATEDIFF(YEAR ,'08-11-2001' ,GETDATE())
select DATEFROMPARTS(2011 , 11 , 08)
select DATENAME(WEEKDAY,'2001-11-08')
select DATEPART(MONTH , GETDATE())

select DAY('2001-11-08')
select ISDATE('hi')
select ISDATE('08-11-2001')
select MONTH('2001-11-08')

select SYSDATETIME()
select YEAR('2001-11-08')

select COALESCE(null , null , 'himanshu')

select CURRENT_USER
select ISNUMERIC('1234')
select ISNUMERIC('hi')
select ISNULL(Null , '1234')
select nullif('himanshu' , 'himanshu')
select nullif('hello' , '1234')
select SESSION_USER
select SYSTEM_USER
select USER_NAME()
select IIF(500<100 , 'yes','no')


print dbo.getstate(12)

print dbo.addition(125.12 ,125.24)

print dbo.subs(220 , 120)    

print dbo.multiply(200, 60)

print dbo.division(14 , 7)

print dbo.division(2500,20)

print dbo.addition(220 , 250)

alter function AgeCalculator(@dob date)
returns int
as
begin
declare @age int
set @Age = DATEDIFF(YEAR , @dob , GETDATE())
return @Age
end
 
print dbo.AgeCalculator('1974-06-01') 
print dbo.AgeCalculator('1979-10-20')

print dbo.AgeCalculator('08/11/2001')
print dbo.agecalculator('1998/09/15')
print dbo.agecalculator('2001/09/28')
print dbo.agecalculator('1998/12/12')
print dbo.agecalculator('1998/04/01')

select STUFF('html turorial' , 1 , 4 , 'SQL')
select SUBSTRING('SQL Tutorial' , 5 ,8)
select CONCAT('Sql' ,'Tutorial')
select DATALENGTH('hims')
select FORMAT(455300 , 'c','hi-IN')
select Format(GETDATE() , 'dd-MMM-yyy')
select LEFT('Himanshu makwana', '8')
select RIGHT('Himanshu Makwana' , '7')
select LEN('Vaibhav')
select LTRIM('    Abhi')
select RTRIM('Abhi     ')
select LOWER('ABHISHEK')
select UPPER('abhishek')
select PATINDEX('%bhi%','abhishek')
select QUOTENAME('Abhi' ,'<>')
select REPLACE('himanshu' , 'shu' , 'su')
select REPLICATE('INDIA  ' , 2)
select REVERSE('Vaibhav')


select CEILING(25.0000001)
select FLOOR(25.99999)
select COUNT(admin_id) from tbl_admin_master
select min(admin_id) from tbl_admin_master
select max(admin_id) from tbl_admin_master
select pi()
select POWER(2,8)
select SQRT(16)
select SQUARE(10)

select DATEADD(YEAR , 1 , GETDATE())
select DATEADD(MONTH , 2 , GETDATE())
select DATEADD(WEEK , 2 , GETDATE())
select DATEDIFF(YEAR , '2001-11-08' , GETDATE())
select DATEFROMPARTS('2001','11','20')

declare @parmeter varchar(100) = 'a,b,c,d,e,f,g'


select SUBSTRING(@parmeter,1,1)

select SUBSTRING(@parmeter,3,1)

select SUBSTRING(@parmeter,5,1)


DECLARE @parmeter VARCHAR(100) = 'a,b,c,d,e,f,g,h,i,j';

DECLARE @startIndex INT = 1;

declare @char varchar(100)

WHILE @startIndex <= LEN(@parmeter)
BEGIN
    SET @char = SUBSTRING(@parmeter, @startIndex, 1);
	SET @parmeter = REPLACE(@parmeter, ',', '');
	SET @startIndex = @startIndex + 1;

	select @char 
end


declare @str varchar(max)='A,BB,CCCC,DDDDD,'

declare @index int,@value varchar(100)

set @index =CHARINDEX(',',@str)

while(@index>0)
begin
	set @value = SUBSTRING(@str,0,@index)

	select @value

	set @str=SUBSTRING(@str,@index+1,len(@str))
	
	set @index =CHARINDEX(',',@str)
end

--declare @string varchar(100) = 'hi , abhi , how , are , you,'

--declare @position int , @values varchar(100)
--set @position = CHARINDEX(',' ,@string)

--while @position>0
--begin
--set @values = SUBSTRING(@string , 0 , @position)
--select @values

--set @string = SUBSTRING(@string,@position+1,LEN(@string))
--set @position = CHARINDEX(',' , @string)
--end


declare @string varchar(100) = 'hii , i , am , himanshu,'

declare @position int , @values varchar(100)
set @position = CHARINDEX(',' , @string)

while @position>0

begin

	set @values = SUBSTRING(@string , 0 , @position)
	select @values

	set @string = SUBSTRING(@string , @position+1 , LEN(@string))
	set @position = CHARINDEX(',' , @string)

end



DECLARE @user_ids NVARCHAR(MAX) = N'hii, 198667, 193718, 188769';

-- Create a table variable to hold the user IDs
DECLARE @users TABLE (user_id NVARCHAR(MAX));

-- Split and insert the user IDs into the table variable
DECLARE @start INT = 1, @end INT, @separator CHAR(1) = ',';
SET @user_ids = @user_ids + @separator;

WHILE @start <= LEN(@user_ids)
BEGIN
    SET @end = CHARINDEX(@separator, @user_ids, @start);
    INSERT INTO @users (user_id)
    VALUES (SUBSTRING(@user_ids, @start, @end - @start));
    SET @start = @end + 1;
END;

-- Select and display the user IDs from the table variable
SELECT * FROM @users;



