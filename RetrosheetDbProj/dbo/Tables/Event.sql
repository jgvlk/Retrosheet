CREATE TABLE [dbo].[Event] (
    [EventID]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [GameID]                                BIGINT        NOT NULL,
    [EventNum]                              INT           NULL,
    [Inning]                                INT           NULL,
    [BattingTeam]                           BIT           NULL,
    [Outs]                                  INT           NULL,
    [Balls]                                 INT           NULL,
    [Strikes]                               INT           NULL,
    [PitchSequence]                         VARCHAR (MAX) NULL,
    [VisScore]                              INT           NULL,
    [HomeScore]                             INT           NULL,
    [Batter]                                INT           NULL,
    [BatterHand]                            CHAR (1)      NULL,
    [ResBatter]                             INT           NULL,
    [ResBatterHand]                         CHAR (1)      NULL,
    [Pitcher]                               INT           NULL,
    [PitcherHand]                           CHAR (1)      NULL,
    [ResPitcher]                            INT           NULL,
    [ResPitcherHand]                        CHAR (1)      NULL,
    [Catcher]                               INT           NULL,
    [FirstBase]                             INT           NULL,
    [SecondBase]                            INT           NULL,
    [ThirdBase]                             INT           NULL,
    [Shortstop]                             INT           NULL,
    [LeftField]                             INT           NULL,
    [CenterField]                           INT           NULL,
    [RightField]                            INT           NULL,
    [FirstRunner]                           INT           NULL,
    [SecondRunner]                          INT           NULL,
    [ThirdRunner]                           INT           NULL,
    [EventText]                             VARCHAR (MAX) NULL,
    [LeadoffFlag]                           BIT           NULL,
    [PinchHitFlag]                          BIT           NULL,
    [DefensivePosition]                     INT           NULL,
    [LineupPosition]                        INT           NULL,
    [EventType]                             INT           NULL,
    [BatterEventFlag]                       BIT           NULL,
    [ABFlag]                                BIT           NULL,
    [HitValue]                              INT           NULL,
    [SHFlag]                                BIT           NULL,
    [SFFlag]                                BIT           NULL,
    [OutsOnPlay]                            INT           NULL,
    [DoublePlayFlag]                        BIT           NULL,
    [TriplePlayFlag]                        BIT           NULL,
    [RBIOnPlay]                             INT           NULL,
    [WildPitchFlag]                         BIT           NULL,
    [PassedBallFlag]                        BIT           NULL,
    [FieldedBy]                             BIT           NULL,
    [BattedBallType]                        CHAR (1)      NULL,
    [BuntFlag]                              BIT           NULL,
    [FoulFlag]                              BIT           NULL,
    [HitLocation]                           VARCHAR (10)  NULL,
    [NumErrors]                             INT           NULL,
    [ErrorPlayer1]                          INT           NULL,
    [ErrorType1]                            CHAR (1)      NULL,
    [ErrorPlayer2]                          INT           NULL,
    [ErrorType2]                            CHAR (1)      NULL,
    [ErrorPlayer3]                          INT           NULL,
    [ErrorType3]                            CHAR (1)      NULL,
    [BatterDest]                            INT           NULL,
    [RunnerOn1stDest]                       INT           NULL,
    [RunnerOn2ndDest]                       INT           NULL,
    [RunnerOn3rdDest]                       INT           NULL,
    [PlayOnBatter]                          VARCHAR (50)  NULL,
    [PlayOnRunnerOn1st]                     VARCHAR (50)  NULL,
    [PlayOnRunnerOn2nd]                     VARCHAR (50)  NULL,
    [PlayOnRunnerOn3rd]                     VARCHAR (50)  NULL,
    [SBForRunnerOn1stFlag]                  BIT           NULL,
    [SBForRunnerOn2ndFlag]                  BIT           NULL,
    [SBForRunnerOn3rdFlag]                  BIT           NULL,
    [CSForRunnerOn1stFlag]                  BIT           NULL,
    [CSForRunnerOn2ndFlag]                  BIT           NULL,
    [CSForRunnerOn3rdFlag]                  BIT           NULL,
    [POForRunnerOn1stFlag]                  BIT           NULL,
    [POForRunnerOn2ndFlag]                  BIT           NULL,
    [POForRunnerOn3rdFlag]                  BIT           NULL,
    [ResponsiblePitcherForRunnerOn1st]      INT           NULL,
    [ResponsiblePitcherForRunnerOn2nd]      INT           NULL,
    [ResponsiblePitcherForRunnerOn3rd]      INT           NULL,
    [NewGameFlag]                           BIT           NULL,
    [EndGameFlag]                           BIT           NULL,
    [PinchRunnerOn1st]                      BIT           NULL,
    [PinchRunnerOn2nd]                      BIT           NULL,
    [PinchRunnerOn3rd]                      BIT           NULL,
    [RunnerRemovedForPinchRunnerOn1st]      INT           NULL,
    [RunnerRemovedForPinchRunnerOn1st2nd]   INT           NULL,
    [RunnerRemovedForPinchRunnerOn1st3rd]   INT           NULL,
    [BatterRemovedForPinchHitter]           INT           NULL,
    [PositionOfBatterRemovedForPinchHitter] INT           NULL,
    [FielderWithFirstPutout]                INT           NULL,
    [FielderWithSecondPutout]               INT           NULL,
    [FielderWithThirdPutout]                INT           NULL,
    [FielderWithFirstAssist]                INT           NULL,
    [FielderWithSecondAssist]               INT           NULL,
    [FielderWithThirdAssist]                INT           NULL,
    [FielderWithFourthAssist]               INT           NULL,
    [FielderWithFifthAssist]                INT           NULL,
    [dCreated]                              DATETIME      CONSTRAINT [df_Event_dCreated] DEFAULT (getdate()) NOT NULL,
    [dModified]                             DATETIME      CONSTRAINT [df_Event_dModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Event] PRIMARY KEY CLUSTERED ([EventID] ASC),
    CONSTRAINT [fk_Event_PlayerMaster01] FOREIGN KEY ([Batter]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster02] FOREIGN KEY ([ResBatter]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster03] FOREIGN KEY ([Pitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster04] FOREIGN KEY ([ResPitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster05] FOREIGN KEY ([Catcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster06] FOREIGN KEY ([FirstBase]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster07] FOREIGN KEY ([SecondBase]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster08] FOREIGN KEY ([ThirdBase]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster09] FOREIGN KEY ([Shortstop]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster10] FOREIGN KEY ([LeftField]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster11] FOREIGN KEY ([CenterField]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster12] FOREIGN KEY ([RightField]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster13] FOREIGN KEY ([FirstRunner]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster14] FOREIGN KEY ([SecondRunner]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster15] FOREIGN KEY ([ThirdRunner]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster16] FOREIGN KEY ([ResponsiblePitcherForRunnerOn1st]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster17] FOREIGN KEY ([ResponsiblePitcherForRunnerOn2nd]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster18] FOREIGN KEY ([ResponsiblePitcherForRunnerOn3rd]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster19] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster20] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st2nd]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster21] FOREIGN KEY ([RunnerRemovedForPinchRunnerOn1st3rd]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Event_PlayerMaster22] FOREIGN KEY ([BatterRemovedForPinchHitter]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [ak_Event_RetroGameID_EventNum] UNIQUE NONCLUSTERED ([GameID] ASC, [EventNum] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_SecondRunner]
    ON [dbo].[Event]([SecondRunner] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_FirstRunner]
    ON [dbo].[Event]([FirstRunner] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_CenterField]
    ON [dbo].[Event]([CenterField] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_RightField]
    ON [dbo].[Event]([RightField] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_LeftField]
    ON [dbo].[Event]([LeftField] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_Shortstop]
    ON [dbo].[Event]([Shortstop] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ThirdBase]
    ON [dbo].[Event]([ThirdBase] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_SecondBase]
    ON [dbo].[Event]([SecondBase] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_FirstBase]
    ON [dbo].[Event]([FirstBase] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_Catcher]
    ON [dbo].[Event]([Catcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ResPitcher]
    ON [dbo].[Event]([ResPitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_Pitcher]
    ON [dbo].[Event]([Pitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ResBatter]
    ON [dbo].[Event]([ResBatter] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_Batter]
    ON [dbo].[Event]([Batter] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_BatterRemovedForPinchHitter]
    ON [dbo].[Event]([BatterRemovedForPinchHitter] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_RunnerRemovedForPinchRunnerOn1st3rd]
    ON [dbo].[Event]([RunnerRemovedForPinchRunnerOn1st3rd] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_RunnerRemovedForPinchRunnerOn1st2nd]
    ON [dbo].[Event]([RunnerRemovedForPinchRunnerOn1st2nd] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_RunnerRemovedForPinchRunnerOn1st]
    ON [dbo].[Event]([RunnerRemovedForPinchRunnerOn1st] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ResponsiblePitcherForRunnerOn3rd]
    ON [dbo].[Event]([ResponsiblePitcherForRunnerOn3rd] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ResponsiblePitcherForRunnerOn2nd]
    ON [dbo].[Event]([ResponsiblePitcherForRunnerOn2nd] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ResponsiblePitcherForRunnerOn1st]
    ON [dbo].[Event]([ResponsiblePitcherForRunnerOn1st] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Event_ThirdRunner]
    ON [dbo].[Event]([ThirdRunner] ASC);

