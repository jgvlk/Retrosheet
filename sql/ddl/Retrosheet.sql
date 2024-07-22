USE [master]
GO
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Retrosheet'
GO
ALTER DATABASE [Retrosheet] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [Retrosheet]
GO
CREATE DATABASE [Retrosheet]
GO
