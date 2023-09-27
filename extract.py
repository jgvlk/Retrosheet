from datetime import datetime as dt
from pathlib import Path

import pandas as pd
from sqlalchemy import text

from db.session_manager import SessionManager


sql_franchise_master = """SELECT
    [FranchiseID]
    ,[CurrentRetroFranchiseID]
    ,[RetroFranchiseID]
    ,[League]
    ,[Division]
    ,[LocationName]
    ,[Nickname]
    ,[AltNickname]
    ,[Start]
    ,[End]
    ,[City]
    ,[State]
FROM [dbo].[FranchiseMaster]"""

sql_park_master = """SELECT
    [ParkID]
    ,[RetroParkID]
    ,[Name]
    ,[AKA]
    ,[City]
    ,[State]
    ,[Start]
    ,[End]
    ,[League]
    ,[Notes]
FROM [dbo].[ParkMaster]"""

sql_player_master = """SELECT
    [PlayerID]
    ,[RetroPlayerID]
    ,[FirstName]
    ,[LastName]
    ,[Nickname]
    ,[Birthdate]
    ,[BirthCity]
    ,[BirthState]
    ,[BirthCountry]
    ,[PlayerDebut]
    ,[PlayerLastGame]
    ,[ManagerDebut]
    ,[ManagerLastGame]
    ,[CoachDebut]
    ,[CoachLastGame]
    ,[UmpDebut]
    ,[UmpLastGame]
    ,[DeathDate]
    ,[DeathCity]
    ,[DeathState]
    ,[DeathCountry]
    ,[Bats]
    ,[Throws]
    ,[Height]
    ,[Weight]
    ,[Cemetery]
    ,[CemeteryCity]
    ,[CemeteryState]
    ,[CemeteryCountry]
    ,[CemeteryNote]
    ,[BirthName]
    ,[NameChg]
    ,[BatChg]
    ,[IsHof]
FROM [dbo].[PlayerMaster]"""

sql_team_master = """SELECT
    [TeamID]
    ,[RetroTeamID]
    ,[League]
    ,[City]
    ,[Nickname]
    ,[Start]
    ,[End]
FROM [dbo].[TeamMaster]"""

sql_event = """SELECT
    [EventID]
    ,[GameID]
    ,[EventNum]
    ,[Inning]
    ,[BattingTeam]
    ,[Outs]
    ,[Balls]
    ,[Strikes]
    ,[PitchSequence]
    ,[VisScore]
    ,[HomeScore]
    ,[Batter]
    ,[BatterHand]
    ,[ResBatter]
    ,[ResBatterHand]
    ,[Pitcher]
    ,[PitcherHand]
    ,[ResPitcher]
    ,[ResPitcherHand]
    ,[Catcher]
    ,[FirstBase]
    ,[SecondBase]
    ,[ThirdBase]
    ,[Shortstop]
    ,[LeftField]
    ,[CenterField]
    ,[RightField]
    ,[FirstRunner]
    ,[SecondRunner]
    ,[ThirdRunner]
    ,[EventText]
    ,[LeadoffFlag]
    ,[PinchHitFlag]
    ,[DefensivePosition]
    ,[LineupPosition]
    ,[EventType]
    ,[BatterEventFlag]
    ,[ABFlag]
    ,[HitValue]
    ,[SHFlag]
    ,[SFFlag]
    ,[OutsOnPlay]
    ,[DoublePlayFlag]
    ,[TriplePlayFlag]
    ,[RBIOnPlay]
    ,[WildPitchFlag]
    ,[PassedBallFlag]
    ,[FieldedBy]
    ,[BattedBallType]
    ,[BuntFlag]
    ,[FoulFlag]
    ,[HitLocation]
    ,[NumErrors]
    ,[ErrorPlayer1]
    ,[ErrorType1]
    ,[ErrorPlayer2]
    ,[ErrorType2]
    ,[ErrorPlayer3]
    ,[ErrorType3]
    ,[BatterDest]
    ,[RunnerOn1stDest]
    ,[RunnerOn2ndDest]
    ,[RunnerOn3rdDest]
    ,[PlayOnBatter]
    ,[PlayOnRunnerOn1st]
    ,[PlayOnRunnerOn2nd]
    ,[PlayOnRunnerOn3rd]
    ,[SBForRunnerOn1stFlag]
    ,[SBForRunnerOn2ndFlag]
    ,[SBForRunnerOn3rdFlag]
    ,[CSForRunnerOn1stFlag]
    ,[CSForRunnerOn2ndFlag]
    ,[CSForRunnerOn3rdFlag]
    ,[POForRunnerOn1stFlag]
    ,[POForRunnerOn2ndFlag]
    ,[POForRunnerOn3rdFlag]
    ,[ResponsiblePitcherForRunnerOn1st]
    ,[ResponsiblePitcherForRunnerOn2nd]
    ,[ResponsiblePitcherForRunnerOn3rd]
    ,[NewGameFlag]
    ,[EndGameFlag]
    ,[PinchRunnerOn1st]
    ,[PinchRunnerOn2nd]
    ,[PinchRunnerOn3rd]
    ,[RunnerRemovedForPinchRunnerOn1st]
    ,[RunnerRemovedForPinchRunnerOn1st2nd]
    ,[RunnerRemovedForPinchRunnerOn1st3rd]
    ,[BatterRemovedForPinchHitter]
    ,[PositionOfBatterRemovedForPinchHitter]
    ,[FielderWithFirstPutout]
    ,[FielderWithSecondPutout]
    ,[FielderWithThirdPutout]
    ,[FielderWithFirstAssist]
    ,[FielderWithSecondAssist]
    ,[FielderWithThirdAssist]
    ,[FielderWithFourthAssist]
    ,[FielderWithFifthAssist]
FROM
    [dbo].[Event]"""

sql_game = """SELECT
    [GameID]
    ,[RetroGameID]
    ,[ParkID]
    ,[GameType]
    ,[Date]
    ,[GameNumber]
    ,[DayOfWeek]
    ,[StartTime]
    ,[DHUsedFlag]
    ,[DayNightFlag]
    ,[VisitingTeam]
    ,[HomeTeam]
    ,[VisitorStartingPitcher]
    ,[HomeStartingPitcher]
    ,[HomePlateUmpire]
    ,[FirstBaseUmpire]
    ,[SecondBaseUmpire]
    ,[ThirdBaseUmpire]
    ,[LeftFieldUmpire]
    ,[RightFieldUmpire]
    ,[Attendance]
    ,[HowScored]
    ,[PitchesEntered]
    ,[Temperature]
    ,[WindDirection]
    ,[WindSpeed]
    ,[FieldCondition]
    ,[Precipitation]
    ,[Sky]
    ,[TimeOfGame]
    ,[NumberOfInnings]
    ,[VisitorFinalScore]
    ,[HomeFinalScore]
    ,[VisitorHits]
    ,[HomeHits]
    ,[VisitorErrors]
    ,[HomeErrors]
    ,[VisitorLeftOnBase]
    ,[HomeLeftOnBase]
    ,[WinningPitcher]
    ,[LosingPitcher]
    ,[SaveFor]
    ,[GWRBI]
    ,[VisitorBatter1]
    ,[VisitorPosition1]
    ,[VisitorBatter2]
    ,[VisitorPosition2]
    ,[VisitorBatter3]
    ,[VisitorPosition3]
    ,[VisitorBatter4]
    ,[VisitorPosition4]
    ,[VisitorBatter5]
    ,[VisitorPosition5]
    ,[VisitorBatter6]
    ,[VisitorPosition6]
    ,[VisitorBatter7]
    ,[VisitorPosition7]
    ,[VisitorBatter8]
    ,[VisitorPosition8]
    ,[VisitorBatter9]
    ,[VisitorPosition9]
    ,[HomeBatter1]
    ,[HomePosition1]
    ,[HomeBatter2]
    ,[HomePosition2]
    ,[HomeBatter3]
    ,[HomePosition3]
    ,[HomeBatter4]
    ,[HomePosition4]
    ,[HomeBatter5]
    ,[HomePosition5]
    ,[HomeBatter6]
    ,[HomePosition6]
    ,[HomeBatter7]
    ,[HomePosition7]
    ,[HomeBatter8]
    ,[HomePosition8]
    ,[HomeBatter9]
    ,[HomePosition9]
    ,[VisitingFinisher]
    ,[HomeFinisher]
    ,[OfficialScorer]
FROM [dbo].[Game]"""

sql_ejection = """SELECT
    [EjectionID]
    ,[RetroGameID]
    ,[GameID]
    ,[RetroTeamID]
    ,[TeamID]
    ,[EjecteePlayerID]
    ,[UmpirePlayerID]
    ,[DH]
    ,[Job]
    ,[Inning]
    ,[Reason]
FROM [dbo].[Ejection]
"""


def extract_retro_data() -> None:
    _db = SessionManager()
    _db_conn = _db.session.connection()
    sql_max_dt = "select max(Date) as max_dt from dbo.Game"
    max_dt = dt.strptime(_db.session.execute(text(sql_max_dt)).one()[0], r"%Y-%m-%d")
    extract_cfg = {
        "path": Path(r"C:\Data\RetrosheetExtract"),
        "queries": {
            "FranchiseMaster": sql_franchise_master,
            "ParkMaster": sql_park_master,
            "PlayerMaster": sql_player_master,
            "TeamMaster": sql_team_master,
            "Game": sql_game,
            "Event": sql_event,
            "Ejection": sql_ejection,
        },
        "file_name_date_part": "{}000000".format(max_dt.strftime(r"%Y%m%d")),
    }
    for i in extract_cfg["queries"].keys():
        extract_file = extract_cfg["path"] / "Retrosheet-{}-{}.csv".format(
            i, extract_cfg["file_name_date_part"]
        )
        print(
            "|| MSG @ {} || EXTRACTING CSV DATA FOR: {}".format(dt.now(), extract_file)
        )
        df = pd.read_sql_query(extract_cfg["queries"][i], _db_conn)
        df.to_csv(extract_file, index=False)
    return None


if __name__ == "__main__":
    _ = extract_retro_data()
