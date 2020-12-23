BACKUP DATABASE [Retrosheet] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV\MSSQL\Backup\Retrosheet.bak' WITH NOFORMAT, NOINIT,  NAME = N'Retrosheet-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'Retrosheet' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'Retrosheet' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Retrosheet'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV\MSSQL\Backup\Retrosheet.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
