DECLARE @date DATETIME
SET @date = GETDATE()

SELECT 
       DATEPART(WEEK, @date) AS 'Week Number'
