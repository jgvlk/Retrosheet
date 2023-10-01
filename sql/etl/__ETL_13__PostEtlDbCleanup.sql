IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Ejection]') AND type in (N'U'))
    DROP TABLE [raw].[Ejection]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[FranchiseMaster]') AND type in (N'U'))
    DROP TABLE [raw].[FranchiseMaster]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[ParkMaster]') AND type in (N'U'))
    DROP TABLE [raw].[ParkMaster]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[PlayerMaster]') AND type in (N'U'))
    DROP TABLE [raw].[PlayerMaster]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TeamMaster]') AND type in (N'U'))
    DROP TABLE [raw].[TeamMaster]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Game]') AND type in (N'U'))
    DROP TABLE [raw].[Game]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Event]') AND type in (N'U'))
    DROP TABLE [raw].[Event]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Schedule]') AND type in (N'U'))
    DROP TABLE [raw].[Schedule]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[GameLog]') AND type in (N'U'))
    DROP TABLE [raw].[GameLog]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[Discrepancy]') AND type in (N'U'))
    DROP TABLE [raw].[Discrepancy]
