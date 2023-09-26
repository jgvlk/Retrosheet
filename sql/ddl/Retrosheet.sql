USE [master]

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Retrosheet')
BEGIN
    DROP DATABASE [Retrosheet]
END

CREATE DATABASE [Retrosheet]
