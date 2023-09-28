USE [Retrosheet]
GO
CREATE SCHEMA [raw]
GO
CREATE TABLE [dbo].[Ejection](
	[EjectionID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[RetroGameID] [char](12) NULL,
	[GameID] [bigint] NULL,
	[RetroTeamID] [char](3) NULL,
	[TeamID] [int] NULL,
	[Ejectee] [varchar](50) NULL,
	[EjecteePlayerID] [int] NULL,
	[Umpire] [varchar](50) NULL,
	[UmpirePlayerID] [int] NULL,
	[DH] [int] NULL,
	[Job] [char](1) NULL,
	[Inning] [int] NULL,
	[Reason] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[EjectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Event](
	[EventID] [bigint] IDENTITY(1,1) NOT NULL,
	[GameID] [bigint] NOT NULL,
	[EventNum] [int] NULL,
	[Inning] [int] NULL,
	[BattingTeam] [bit] NULL,
	[Outs] [int] NULL,
	[Balls] [int] NULL,
	[Strikes] [int] NULL,
	[PitchSequence] [varchar](max) NULL,
	[VisScore] [int] NULL,
	[HomeScore] [int] NULL,
	[Batter] [int] NULL,
	[BatterHand] [char](1) NULL,
	[ResBatter] [int] NULL,
	[ResBatterHand] [char](1) NULL,
	[Pitcher] [int] NULL,
	[PitcherHand] [char](1) NULL,
	[ResPitcher] [int] NULL,
	[ResPitcherHand] [char](1) NULL,
	[Catcher] [int] NULL,
	[FirstBase] [int] NULL,
	[SecondBase] [int] NULL,
	[ThirdBase] [int] NULL,
	[Shortstop] [int] NULL,
	[LeftField] [int] NULL,
	[CenterField] [int] NULL,
	[RightField] [int] NULL,
	[FirstRunner] [int] NULL,
	[SecondRunner] [int] NULL,
	[ThirdRunner] [int] NULL,
	[EventText] [varchar](max) NULL,
	[LeadoffFlag] [bit] NULL,
	[PinchHitFlag] [bit] NULL,
	[DefensivePosition] [int] NULL,
	[LineupPosition] [int] NULL,
	[EventType] [int] NULL,
	[BatterEventFlag] [bit] NULL,
	[ABFlag] [bit] NULL,
	[HitValue] [int] NULL,
	[SHFlag] [bit] NULL,
	[SFFlag] [bit] NULL,
	[OutsOnPlay] [int] NULL,
	[DoublePlayFlag] [bit] NULL,
	[TriplePlayFlag] [bit] NULL,
	[RBIOnPlay] [int] NULL,
	[WildPitchFlag] [bit] NULL,
	[PassedBallFlag] [bit] NULL,
	[FieldedBy] [int] NULL,
	[BattedBallType] [char](1) NULL,
	[BuntFlag] [bit] NULL,
	[FoulFlag] [bit] NULL,
	[HitLocation] [varchar](10) NULL,
	[NumErrors] [int] NULL,
	[ErrorPlayer1] [int] NULL,
	[ErrorType1] [char](1) NULL,
	[ErrorPlayer2] [int] NULL,
	[ErrorType2] [char](1) NULL,
	[ErrorPlayer3] [int] NULL,
	[ErrorType3] [char](1) NULL,
	[BatterDest] [int] NULL,
	[RunnerOn1stDest] [int] NULL,
	[RunnerOn2ndDest] [int] NULL,
	[RunnerOn3rdDest] [int] NULL,
	[PlayOnBatter] [varchar](50) NULL,
	[PlayOnRunnerOn1st] [varchar](50) NULL,
	[PlayOnRunnerOn2nd] [varchar](50) NULL,
	[PlayOnRunnerOn3rd] [varchar](50) NULL,
	[SBForRunnerOn1stFlag] [bit] NULL,
	[SBForRunnerOn2ndFlag] [bit] NULL,
	[SBForRunnerOn3rdFlag] [bit] NULL,
	[CSForRunnerOn1stFlag] [bit] NULL,
	[CSForRunnerOn2ndFlag] [bit] NULL,
	[CSForRunnerOn3rdFlag] [bit] NULL,
	[POForRunnerOn1stFlag] [bit] NULL,
	[POForRunnerOn2ndFlag] [bit] NULL,
	[POForRunnerOn3rdFlag] [bit] NULL,
	[ResponsiblePitcherForRunnerOn1st] [int] NULL,
	[ResponsiblePitcherForRunnerOn2nd] [int] NULL,
	[ResponsiblePitcherForRunnerOn3rd] [int] NULL,
	[NewGameFlag] [bit] NULL,
	[EndGameFlag] [bit] NULL,
	[PinchRunnerOn1st] [bit] NULL,
	[PinchRunnerOn2nd] [bit] NULL,
	[PinchRunnerOn3rd] [bit] NULL,
	[RunnerRemovedForPinchRunnerOn1st] [int] NULL,
	[RunnerRemovedForPinchRunnerOn1st2nd] [int] NULL,
	[RunnerRemovedForPinchRunnerOn1st3rd] [int] NULL,
	[BatterRemovedForPinchHitter] [int] NULL,
	[PositionOfBatterRemovedForPinchHitter] [int] NULL,
	[FielderWithFirstPutout] [int] NULL,
	[FielderWithSecondPutout] [int] NULL,
	[FielderWithThirdPutout] [int] NULL,
	[FielderWithFirstAssist] [int] NULL,
	[FielderWithSecondAssist] [int] NULL,
	[FielderWithThirdAssist] [int] NULL,
	[FielderWithFourthAssist] [int] NULL,
	[FielderWithFifthAssist] [int] NULL,
 CONSTRAINT [pk_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_Event_RetroGameID_EventNum] UNIQUE NONCLUSTERED 
(
	[GameID] ASC,
	[EventNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[FranchiseMaster](
	[FranchiseID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentRetroFranchiseID] [char](3) NOT NULL,
	[RetroFranchiseID] [char](3) NOT NULL,
	[League] [char](2) NULL,
	[Division] [char](1) NULL,
	[LocationName] [varchar](25) NULL,
	[Nickname] [varchar](50) NULL,
	[AltNickname] [varchar](50) NULL,
	[Start] [date] NOT NULL,
	[End] [date] NULL,
	[City] [varchar](25) NOT NULL,
	[State] [char](2) NOT NULL,
 CONSTRAINT [pk_FranchiseMaster] PRIMARY KEY CLUSTERED 
(
	[FranchiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Game](
	[GameID] [bigint] IDENTITY(1,1) NOT NULL,
	[RetroGameID] [char](12) NULL,
	[ParkID] [int] NULL,
	[GameType] [varchar](50) NULL,
	[Date] [date] NULL,
	[GameNumber] [int] NULL,
	[DayOfWeek] [varchar](10) NULL,
	[StartTime] [varchar](5) NULL,
	[DHUsedFlag] [bit] NULL,
	[DayNightFlag] [char](1) NULL,
	[VisitingTeam] [char](3) NULL,
	[HomeTeam] [char](3) NULL,
	[VisitorStartingPitcher] [int] NULL,
	[HomeStartingPitcher] [int] NULL,
	[HomePlateUmpire] [int] NULL,
	[FirstBaseUmpire] [int] NULL,
	[SecondBaseUmpire] [int] NULL,
	[ThirdBaseUmpire] [int] NULL,
	[LeftFieldUmpire] [int] NULL,
	[RightFieldUmpire] [int] NULL,
	[Attendance] [int] NULL,
	[HowScored] [int] NULL,
	[PitchesEntered] [int] NULL,
	[Temperature] [int] NULL,
	[WindDirection] [int] NULL,
	[WindSpeed] [int] NULL,
	[FieldCondition] [int] NULL,
	[Precipitation] [int] NULL,
	[Sky] [int] NULL,
	[TimeOfGame] [int] NULL,
	[NumberOfInnings] [int] NULL,
	[VisitorFinalScore] [int] NULL,
	[HomeFinalScore] [int] NULL,
	[VisitorHits] [int] NULL,
	[HomeHits] [int] NULL,
	[VisitorErrors] [int] NULL,
	[HomeErrors] [int] NULL,
	[VisitorLeftOnBase] [int] NULL,
	[HomeLeftOnBase] [int] NULL,
	[WinningPitcher] [int] NULL,
	[LosingPitcher] [int] NULL,
	[SaveFor] [int] NULL,
	[GWRBI] [int] NULL,
	[VisitorBatter1] [int] NULL,
	[VisitorPosition1] [int] NULL,
	[VisitorBatter2] [int] NULL,
	[VisitorPosition2] [int] NULL,
	[VisitorBatter3] [int] NULL,
	[VisitorPosition3] [int] NULL,
	[VisitorBatter4] [int] NULL,
	[VisitorPosition4] [int] NULL,
	[VisitorBatter5] [int] NULL,
	[VisitorPosition5] [int] NULL,
	[VisitorBatter6] [int] NULL,
	[VisitorPosition6] [int] NULL,
	[VisitorBatter7] [int] NULL,
	[VisitorPosition7] [int] NULL,
	[VisitorBatter8] [int] NULL,
	[VisitorPosition8] [int] NULL,
	[VisitorBatter9] [int] NULL,
	[VisitorPosition9] [int] NULL,
	[HomeBatter1] [int] NULL,
	[HomePosition1] [int] NULL,
	[HomeBatter2] [int] NULL,
	[HomePosition2] [int] NULL,
	[HomeBatter3] [int] NULL,
	[HomePosition3] [int] NULL,
	[HomeBatter4] [int] NULL,
	[HomePosition4] [int] NULL,
	[HomeBatter5] [int] NULL,
	[HomePosition5] [int] NULL,
	[HomeBatter6] [int] NULL,
	[HomePosition6] [int] NULL,
	[HomeBatter7] [int] NULL,
	[HomePosition7] [int] NULL,
	[HomeBatter8] [int] NULL,
	[HomePosition8] [int] NULL,
	[HomeBatter9] [int] NULL,
	[HomePosition9] [int] NULL,
	[VisitingFinisher] [int] NULL,
	[HomeFinisher] [int] NULL,
	[OfficialScorer] [int] NULL,
 CONSTRAINT [pk_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_Game_RetroGameID] UNIQUE NONCLUSTERED 
(
	[RetroGameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[ParkMaster](
	[ParkID] [int] IDENTITY(1,1) NOT NULL,
	[RetroParkID] [char](5) NOT NULL,
	[Name] [varchar](50) NULL,
	[AKA] [varchar](100) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](10) NULL,
	[Start] [date] NULL,
	[End] [date] NULL,
	[League] [char](2) NULL,
	[Notes] [varchar](100) NULL,
 CONSTRAINT [pk_ParkMaster] PRIMARY KEY CLUSTERED 
(
	[ParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_ParkMaster_RetroParkID] UNIQUE NONCLUSTERED 
(
	[RetroParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[PlayerMaster](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[RetroPlayerID] [char](8) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Nickname] [varchar](50) NULL,
	[Birthdate] [date] NULL,
	[BirthCity] [varchar](50) NULL,
	[BirthState] [varchar](50) NULL,
	[BirthCountry] [varchar](50) NULL,
	[PlayerDebut] [date] NULL,
	[PlayerLastGame] [date] NULL,
	[ManagerDebut] [date] NULL,
	[ManagerLastGame] [date] NULL,
	[CoachDebut] [date] NULL,
	[CoachLastGame] [date] NULL,
	[UmpDebut] [date] NULL,
	[UmpLastGame] [date] NULL,
	[DeathDate] [date] NULL,
	[DeathCity] [varchar](50) NULL,
	[DeathState] [varchar](50) NULL,
	[DeathCountry] [varchar](50) NULL,
	[Bats] [char](1) NULL,
	[Throws] [char](1) NULL,
	[Height] [varchar](25) NULL,
	[Weight] [int] NULL,
	[Cemetery] [varchar](500) NULL,
	[CemeteryCity] [varchar](500) NULL,
	[CemeteryState] [varchar](500) NULL,
	[CemeteryCountry] [varchar](500) NULL,
	[CemeteryNote] [varchar](500) NULL,
	[BirthName] [varchar](500) NULL,
	[NameChg] [varchar](500) NULL,
	[BatChg] [varchar](500) NULL,
	[IsHof] [bit] NULL,
 CONSTRAINT [pk_PlayerMaster] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE NONCLUSTERED 
(
	[RetroPlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[TeamMaster](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[RetroTeamID] [char](3) NOT NULL,
	[League] [char](2) NULL,
	[City] [varchar](25) NOT NULL,
	[Nickname] [varchar](25) NOT NULL,
	[Start] [int] NULL,
	[End] [int] NULL,
 CONSTRAINT [pk_TeamMaster] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_TeamMaster_RetroTeamID] UNIQUE NONCLUSTERED 
(
	[RetroTeamID] ASC,
	[League] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ejection]  WITH CHECK ADD  CONSTRAINT [fk_Ejection_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Ejection] CHECK CONSTRAINT [fk_Ejection_Game]
GO
ALTER TABLE [dbo].[Ejection]  WITH CHECK ADD  CONSTRAINT [fk_Ejection_PlayerMaster01] FOREIGN KEY([EjecteePlayerID])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Ejection] CHECK CONSTRAINT [fk_Ejection_PlayerMaster01]
GO
ALTER TABLE [dbo].[Ejection]  WITH CHECK ADD  CONSTRAINT [fk_Ejection_PlayerMaster02] FOREIGN KEY([UmpirePlayerID])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Ejection] CHECK CONSTRAINT [fk_Ejection_PlayerMaster02]
GO
ALTER TABLE [dbo].[Ejection]  WITH CHECK ADD  CONSTRAINT [fk_Ejection_TeamMaster] FOREIGN KEY([TeamID])
REFERENCES [dbo].[TeamMaster] ([TeamID])
GO
ALTER TABLE [dbo].[Ejection] CHECK CONSTRAINT [fk_Ejection_TeamMaster]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster01] FOREIGN KEY([Batter])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster01]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster02] FOREIGN KEY([ResBatter])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster02]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster03] FOREIGN KEY([Pitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster03]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster04] FOREIGN KEY([ResPitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster04]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster05] FOREIGN KEY([Catcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster05]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster06] FOREIGN KEY([FirstBase])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster06]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster07] FOREIGN KEY([SecondBase])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster07]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster08] FOREIGN KEY([ThirdBase])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster08]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster09] FOREIGN KEY([Shortstop])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster09]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster10] FOREIGN KEY([LeftField])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster10]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster11] FOREIGN KEY([CenterField])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster11]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster12] FOREIGN KEY([RightField])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster12]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster13] FOREIGN KEY([FirstRunner])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster13]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster14] FOREIGN KEY([SecondRunner])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster14]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster15] FOREIGN KEY([ThirdRunner])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster15]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster16] FOREIGN KEY([ResponsiblePitcherForRunnerOn1st])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster16]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster17] FOREIGN KEY([ResponsiblePitcherForRunnerOn2nd])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster17]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster18] FOREIGN KEY([ResponsiblePitcherForRunnerOn3rd])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster18]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster19] FOREIGN KEY([RunnerRemovedForPinchRunnerOn1st])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster19]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster20] FOREIGN KEY([RunnerRemovedForPinchRunnerOn1st2nd])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster20]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster21] FOREIGN KEY([RunnerRemovedForPinchRunnerOn1st3rd])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster21]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [fk_Event_PlayerMaster22] FOREIGN KEY([BatterRemovedForPinchHitter])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_Event_PlayerMaster22]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_ParkMaster] FOREIGN KEY([ParkID])
REFERENCES [dbo].[ParkMaster] ([ParkID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_ParkMaster]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster01] FOREIGN KEY([VisitorStartingPitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster01]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster02] FOREIGN KEY([HomeStartingPitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster02]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster03] FOREIGN KEY([HomePlateUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster03]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster04] FOREIGN KEY([FirstBaseUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster04]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster05] FOREIGN KEY([SecondBaseUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster05]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster06] FOREIGN KEY([ThirdBaseUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster06]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster07] FOREIGN KEY([LeftFieldUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster07]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster08] FOREIGN KEY([RightFieldUmpire])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster08]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster09] FOREIGN KEY([WinningPitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster09]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster10] FOREIGN KEY([LosingPitcher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster10]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster11] FOREIGN KEY([SaveFor])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster11]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster12] FOREIGN KEY([VisitorBatter1])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster12]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster13] FOREIGN KEY([VisitorBatter2])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster13]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster14] FOREIGN KEY([VisitorBatter3])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster14]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster15] FOREIGN KEY([VisitorBatter4])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster15]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster16] FOREIGN KEY([VisitorBatter5])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster16]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster17] FOREIGN KEY([VisitorBatter6])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster17]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster18] FOREIGN KEY([VisitorBatter7])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster18]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster19] FOREIGN KEY([VisitorBatter8])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster19]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster20] FOREIGN KEY([VisitorBatter9])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster20]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster21] FOREIGN KEY([HomeBatter1])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster21]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster22] FOREIGN KEY([HomeBatter2])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster22]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster23] FOREIGN KEY([HomeBatter3])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster23]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster24] FOREIGN KEY([HomeBatter4])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster24]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster25] FOREIGN KEY([HomeBatter5])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster25]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster26] FOREIGN KEY([HomeBatter6])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster26]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster27] FOREIGN KEY([HomeBatter7])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster27]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster28] FOREIGN KEY([HomeBatter8])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster28]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster29] FOREIGN KEY([HomeBatter9])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster29]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster30] FOREIGN KEY([VisitingFinisher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster30]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster31] FOREIGN KEY([HomeFinisher])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster31]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster32] FOREIGN KEY([OfficialScorer])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster32]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [fk_Game_PlayerMaster33] FOREIGN KEY([GWRBI])
REFERENCES [dbo].[PlayerMaster] ([PlayerID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [fk_Game_PlayerMaster33]
GO
