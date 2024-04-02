alter PROCEDURE CreateDatabaseAndUser
    @dbName NVARCHAR(128),
    @loginName NVARCHAR(128),
    @loginPassword NVARCHAR(128),
    @userName NVARCHAR(128)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);

    -- Check if the database exists
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = @dbName)
    BEGIN
        -- Create database
        SET @sql = 'CREATE DATABASE ' + QUOTENAME(@dbName);
        EXEC sp_executesql @sql;
        PRINT 'Database created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Database already exists.';
    END

    -- Create login
    SET @sql = 'CREATE LOGIN ' + QUOTENAME(@loginName) + ' WITH PASSWORD = ''' + @loginPassword + '''';
    EXEC sp_executesql @sql;

    -- Create user
    SET @sql = 'CREATE USER ' + QUOTENAME(@userName) + ' FOR LOGIN ' + QUOTENAME(@loginName);
    EXEC sp_executesql @sql;

    -- Grant permissions to the user
    SET @sql = 'GRANT SELECT, INSERT, UPDATE, DELETE TO ' + QUOTENAME(@userName);
    EXEC sp_executesql @sql;

    PRINT 'Login, user, and permissions created successfully.';
END;
GO


EXEC CreateDatabaseAndUser 
    @dbName = 'MyDatabase1',
    @loginName = 'MyLogin1',
    @loginPassword = 'MyPassword1',
    @userName = 'MyUser1';




