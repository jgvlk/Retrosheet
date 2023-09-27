UPDATE [raw].[Game]
SET
	[FirstBaseUmpire] = CASE
		WHEN [FirstBaseUmpire] = 'cockp201' THEN 'cockp101'
		WHEN [FirstBaseUmpire] = 'rogab201' THEN 'rogab101'
		ELSE [FirstBaseUmpire]
	END,
	[LosingPitcher] = CASE
		WHEN [LosingPitcher] = 'clarv101' THEN 'clarw103'
		ELSE [LosingPitcher]
	END,
	[SecondBaseUmpire] = CASE
		WHEN [SecondBaseUmpire] = 'charo201' THEN 'charo101'
		WHEN [SecondBaseUmpire] = 'rogab201' THEN 'rogab101'
		ELSE [SecondBaseUmpire]
	END,
	[ThirdBaseUmpire] = CASE
		WHEN [ThirdBaseUmpire] = 'suttm201' THEN 'suttm101'
		WHEN [ThirdBaseUmpire] = 'harrm201' THEN 'harrm103'
		WHEN [ThirdBaseUmpire] = 'cockp201' THEN 'cockp101'
		ELSE [ThirdBaseUmpire]
	END;