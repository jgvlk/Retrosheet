IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ParkMaster]') AND type in (N'U'))
DROP TABLE [dbo].[ParkMaster]

CREATE TABLE [dbo].[ParkMaster](
	[ParkID] [int] IDENTITY(1,1) NOT NULL,
	[RetroParkID] [char](5) NOT NULL,
	[Name] [varchar](50) NULL,
	[AKA] [varchar](50) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](10) NULL,
	[Start] [date] NULL,
	[End] [date] NULL,
	[League] [char](2) NULL,
	[Notes] [varchar](100) NULL
 CONSTRAINT [pk_ParkMaster] PRIMARY KEY CLUSTERED 
(
	[ParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_ParkMaster_RetroParkID] UNIQUE NONCLUSTERED 
(
	[RetroParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
