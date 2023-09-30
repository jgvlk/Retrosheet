IF OBJECT_ID('[fk_Game_ParkMaster]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_ParkMaster] FOREIGN KEY ([ParkID]) REFERENCES [dbo].[ParkMaster] ([ParkID])

IF OBJECT_ID('[fk_Game_PlayerMaster01]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster01] FOREIGN KEY ([VisitorStartingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster02]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster02] FOREIGN KEY ([HomeStartingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster03]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster03] FOREIGN KEY ([HomePlateUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster04]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster04] FOREIGN KEY ([FirstBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster05]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster05] FOREIGN KEY ([SecondBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster06]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster06] FOREIGN KEY ([ThirdBaseUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster07]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster07] FOREIGN KEY ([LeftFieldUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster08]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster08] FOREIGN KEY ([RightFieldUmpire]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster09]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster09] FOREIGN KEY ([WinningPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster10]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster10] FOREIGN KEY ([LosingPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster11]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster11] FOREIGN KEY ([SaveFor]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster12]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster12] FOREIGN KEY ([VisitorBatter1]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster13]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster13] FOREIGN KEY ([VisitorBatter2]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster14]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster14] FOREIGN KEY ([VisitorBatter3]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster15]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster15] FOREIGN KEY ([VisitorBatter4]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster16]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster16] FOREIGN KEY ([VisitorBatter5]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster17]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster17] FOREIGN KEY ([VisitorBatter6]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster18]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster18] FOREIGN KEY ([VisitorBatter7]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster19]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster19] FOREIGN KEY ([VisitorBatter8]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster20]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster20] FOREIGN KEY ([VisitorBatter9]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster21]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster21] FOREIGN KEY ([HomeBatter1]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster22]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster22] FOREIGN KEY ([HomeBatter2]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster23]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster23] FOREIGN KEY ([HomeBatter3]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster24]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster24] FOREIGN KEY ([HomeBatter4]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster25]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster25] FOREIGN KEY ([HomeBatter5]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster26]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster26] FOREIGN KEY ([HomeBatter6]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster27]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster27] FOREIGN KEY ([HomeBatter7]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster28]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster28] FOREIGN KEY ([HomeBatter8]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster29]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster29] FOREIGN KEY ([HomeBatter9]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster30]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster30] FOREIGN KEY ([VisitingFinisher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster32]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster31] FOREIGN KEY ([HomeFinisher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster32]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster32] FOREIGN KEY ([OfficialScorer]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Game_PlayerMaster33]') IS NULL
	ALTER TABLE [dbo].[Game] ADD CONSTRAINT [fk_Game_PlayerMaster33] FOREIGN KEY ([GWRBI]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster01]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster01] FOREIGN KEY ([Batter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster02]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster02] FOREIGN KEY ([ResBatter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster03]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster03] FOREIGN KEY ([Pitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster04]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster04] FOREIGN KEY ([ResPitcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster05]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster05] FOREIGN KEY ([Catcher]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster06]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster06] FOREIGN KEY ([FirstBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster07]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster07] FOREIGN KEY ([SecondBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster08]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster08] FOREIGN KEY ([ThirdBase]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster09]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster09] FOREIGN KEY ([Shortstop]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster10]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster10] FOREIGN KEY ([LeftField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster11]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster11] FOREIGN KEY ([CenterField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster12]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster12] FOREIGN KEY ([RightField]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster13]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster13] FOREIGN KEY ([FirstRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster14]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster14] FOREIGN KEY ([SecondRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster15]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster15] FOREIGN KEY ([ThirdRunner]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster16]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster16] FOREIGN KEY ([ResponsiblePitcherForRunnerOn1st]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster17]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster17] FOREIGN KEY ([ResponsiblePitcherForRunnerOn2nd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster18]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster18] FOREIGN KEY ([ResponsiblePitcherForRunnerOn3rd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster19]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster19] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster20]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster20] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st2nd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster21]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster21] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st3rd]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Event_PlayerMaster22]') IS NULL
	ALTER TABLE [dbo].[Event] ADD CONSTRAINT [fk_Event_PlayerMaster22] FOREIGN KEY ([BatterRemovedForPinchHitter]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Ejection_Game]') IS NULL
	ALTER TABLE [dbo].[Ejection] ADD CONSTRAINT [fk_Ejection_Game] FOREIGN KEY ([GameID]) REFERENCES [dbo].[Game]([GameID])

IF OBJECT_ID('[fk_Ejection_TeamMaster]') IS NULL
	ALTER TABLE [dbo].[Ejection] ADD CONSTRAINT [fk_Ejection_TeamMaster] FOREIGN KEY ([TeamID]) REFERENCES [dbo].[TeamMaster]([TeamID])

IF OBJECT_ID('[fk_Ejection_TeamMaster]') IS NULL
	ALTER TABLE [dbo].[Ejection] ADD CONSTRAINT [fk_Ejection_TeamMaster] FOREIGN KEY ([TeamID]) REFERENCES [dbo].[TeamMaster]([TeamID])

IF OBJECT_ID('[fk_Ejection_PlayerMaster01]') IS NULL
	ALTER TABLE [dbo].[Ejection] ADD CONSTRAINT [fk_Ejection_PlayerMaster01] FOREIGN KEY ([EjecteePlayerID]) REFERENCES [dbo].[PlayerMaster]([PlayerID])

IF OBJECT_ID('[fk_Ejection_PlayerMaster02]') IS NULL
	ALTER TABLE [dbo].[Ejection] ADD CONSTRAINT [fk_Ejection_PlayerMaster02] FOREIGN KEY ([UmpirePlayerID]) REFERENCES [dbo].[PlayerMaster]([PlayerID])
