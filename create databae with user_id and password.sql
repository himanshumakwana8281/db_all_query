create database db_hims

-- Create a login
CREATE LOGIN dummy_login 
WITH PASSWORD = 'dummy_password';
GO

USE db_hims;
GO

CREATE USER dummy_user 
FOR LOGIN dummy_login;
GO

GRANT SELECT, INSERT, UPDATE, DELETE TO dummy_user;
GO
