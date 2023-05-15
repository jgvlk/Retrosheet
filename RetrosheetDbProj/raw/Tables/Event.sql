﻿CREATE TABLE [raw].[Event] (
    [GameID]                                VARCHAR (500) NOT NULL,
    [VisitingTeam]                          VARCHAR (500) NULL,
    [Inning]                                VARCHAR (500) NULL,
    [BattingTeam]                           VARCHAR (500) NULL,
    [Outs]                                  VARCHAR (500) NULL,
    [Balls]                                 VARCHAR (500) NULL,
    [Strikes]                               VARCHAR (500) NULL,
    [PitchSequence]                         VARCHAR (500) NULL,
    [VisScore]                              VARCHAR (500) NULL,
    [HomeScore]                             VARCHAR (500) NULL,
    [Batter]                                VARCHAR (500) NULL,
    [BatterHand]                            VARCHAR (500) NULL,
    [ResBatter]                             VARCHAR (500) NULL,
    [ResBatterHand]                         VARCHAR (500) NULL,
    [Pitcher]                               VARCHAR (500) NULL,
    [PitcherHand]                           VARCHAR (500) NULL,
    [ResPitcher]                            VARCHAR (500) NULL,
    [ResPitcherHand]                        VARCHAR (500) NULL,
    [Catcher]                               VARCHAR (500) NULL,
    [FirstBase]                             VARCHAR (500) NULL,
    [SecondBase]                            VARCHAR (500) NULL,
    [ThirdBase]                             VARCHAR (500) NULL,
    [Shortstop]                             VARCHAR (500) NULL,
    [LeftField]                             VARCHAR (500) NULL,
    [CenterField]                           VARCHAR (500) NULL,
    [RightField]                            VARCHAR (500) NULL,
    [FirstRunner]                           VARCHAR (500) NULL,
    [SecondRunner]                          VARCHAR (500) NULL,
    [ThirdRunner]                           VARCHAR (500) NULL,
    [EventText]                             VARCHAR (500) NULL,
    [LeadoffFlag]                           VARCHAR (500) NULL,
    [PinchHitFlag]                          VARCHAR (500) NULL,
    [DefensivePosition]                     VARCHAR (500) NULL,
    [LineupPosition]                        VARCHAR (500) NULL,
    [EventType]                             VARCHAR (500) NULL,
    [BatterEventFlag]                       VARCHAR (500) NULL,
    [ABFlag]                                VARCHAR (500) NULL,
    [HitValue]                              VARCHAR (500) NULL,
    [SHFlag]                                VARCHAR (500) NULL,
    [SFFlag]                                VARCHAR (500) NULL,
    [OutsOnPlay]                            VARCHAR (500) NULL,
    [DoublePlayFlag]                        VARCHAR (500) NULL,
    [TriplePlayFlag]                        VARCHAR (500) NULL,
    [RBIOnPlay]                             VARCHAR (500) NULL,
    [WildPitchFlag]                         VARCHAR (500) NULL,
    [PassedBallFlag]                        VARCHAR (500) NULL,
    [FieldedBy]                             VARCHAR (500) NULL,
    [BattedBallType]                        VARCHAR (500) NULL,
    [BuntFlag]                              VARCHAR (500) NULL,
    [FoulFlag]                              VARCHAR (500) NULL,
    [HitLocation]                           VARCHAR (500) NULL,
    [NumErrors]                             VARCHAR (500) NULL,
    [ErrorPlayer1]                          VARCHAR (500) NULL,
    [ErrorType1]                            VARCHAR (500) NULL,
    [ErrorPlayer2]                          VARCHAR (500) NULL,
    [ErrorType2]                            VARCHAR (500) NULL,
    [ErrorPlayer3]                          VARCHAR (500) NULL,
    [ErrorType3]                            VARCHAR (500) NULL,
    [BatterDest]                            VARCHAR (500) NULL,
    [RunnerOn1stDest]                       VARCHAR (500) NULL,
    [RunnerOn2ndDest]                       VARCHAR (500) NULL,
    [RunnerOn3rdDest]                       VARCHAR (500) NULL,
    [PlayOnBatter]                          VARCHAR (500) NULL,
    [PlayOnRunnerOn1st]                     VARCHAR (500) NULL,
    [PlayOnRunnerOn2nd]                     VARCHAR (500) NULL,
    [PlayOnRunnerOn3rd]                     VARCHAR (500) NULL,
    [SBForRunnerOn1stFlag]                  VARCHAR (500) NULL,
    [SBForRunnerOn2ndFlag]                  VARCHAR (500) NULL,
    [SBForRunnerOn3rdFlag]                  VARCHAR (500) NULL,
    [CSForRunnerOn1stFlag]                  VARCHAR (500) NULL,
    [CSForRunnerOn2ndFlag]                  VARCHAR (500) NULL,
    [CSForRunnerOn3rdFlag]                  VARCHAR (500) NULL,
    [POForRunnerOn1stFlag]                  VARCHAR (500) NULL,
    [POForRunnerOn2ndFlag]                  VARCHAR (500) NULL,
    [POForRunnerOn3rdFlag]                  VARCHAR (500) NULL,
    [ResponsiblePitcherForRunnerOn1st]      VARCHAR (500) NULL,
    [ResponsiblePitcherForRunnerOn2nd]      VARCHAR (500) NULL,
    [ResponsiblePitcherForRunnerOn3rd]      VARCHAR (500) NULL,
    [NewGameFlag]                           VARCHAR (500) NULL,
    [EndGameFlag]                           VARCHAR (500) NULL,
    [PinchRunnerOn1st]                      VARCHAR (500) NULL,
    [PinchRunnerOn2nd]                      VARCHAR (500) NULL,
    [PinchRunnerOn3rd]                      VARCHAR (500) NULL,
    [RunnerRemovedForPinchRunnerOn1st]      VARCHAR (500) NULL,
    [RunnerRemovedForPinchRunnerOn1st2nd]   VARCHAR (500) NULL,
    [RunnerRemovedForPinchRunnerOn1st3rd]   VARCHAR (500) NULL,
    [BatterRemovedForPinchHitter]           VARCHAR (500) NULL,
    [PositionOfBatterRemovedForPinchHitter] VARCHAR (500) NULL,
    [FielderWithFirstPutout]                VARCHAR (500) NULL,
    [FielderWithSecondPutout]               VARCHAR (500) NULL,
    [FielderWithThirdPutout]                VARCHAR (500) NULL,
    [FielderWithFirstAssist]                VARCHAR (500) NULL,
    [FielderWithSecondAssist]               VARCHAR (500) NULL,
    [FielderWithThirdAssist]                VARCHAR (500) NULL,
    [FielderWithFourthAssist]               VARCHAR (500) NULL,
    [FielderWithFifthAssist]                VARCHAR (500) NULL,
    [EventNum]                              VARCHAR (500) NULL
);

