----------------------------------------
-----Force View (No Actual Table)-------
----------------------------------------
alter VIEW view_test AS
SELECT 
    '' AS e_id,
    '' AS department
WHERE 1 = 0;

----------------------------------------
-----Force Emp View (No Actual Table)-------
----------------------------------------
CREATE VIEW view_emp_test AS
SELECT 
	'' as e_id ,
    '' AS name,
	0 as salary
WHERE 1 = 0;


INSERT INTO view_test (e_id, department)
VALUES (1, 'I.T');

select * from view_test
