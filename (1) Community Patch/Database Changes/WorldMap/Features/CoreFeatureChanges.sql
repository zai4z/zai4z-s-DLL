-- Remove the conflict between FEATURE_LAKE == FEATURE_ICE and FEATURE_RIVER == FEATURE_JUNGLE
UPDATE FakeFeatures SET ID = ID + 200;

UPDATE Features SET Impassable = 1, NoImprovement = 0 WHERE Type = 'FEATURE_ICE';

-- They shouldn't be as obstructive as mountains
UPDATE Features
SET SeeThrough = 0
WHERE Type IN (
	'FEATURE_SOLOMONS_MINES',
	'FEATURE_CRATER',
	'FEATURE_FOUNTAIN_YOUTH'
);

UPDATE Features SET SeeThrough = 1 WHERE Type = 'FEATURE_GEYSER';

-- Natural Wonder placement criteria/post-placement effects
UPDATE Natural_Wonder_Placement
SET
	CoreTileCanBeAnyTerrainType = 1,
	CoreTileCanBeDesert = 0,
	CoreTileCanBeTundra = 0,
	AdjacentTilesCareAboutTerrainTypes = 0,
	AdjacentTilesAvoidGrass = 0,
	MaximumAllowedAdjacentGrass = 99,
	ChangeCoreTileToMountain = 0
WHERE NaturalWonderType = 'FEATURE_CRATER';

UPDATE Natural_Wonder_Placement
SET
	AdjacentTilesAvoidJungle = 1,
	MaximumAllowedAdjacentJungle = 0
WHERE NaturalWonderType = 'FEATURE_FUJI';

UPDATE Natural_Wonder_Placement
SET
	CoreTileCanBeTundra = 0,
	AdjacentTilesCareAboutTerrainTypes = 0,
	AdjacentTilesAvoidGrass = 0,
	MaximumAllowedAdjacentGrass = 99
WHERE NaturalWonderType = 'FEATURE_MESA';

UPDATE Natural_Wonder_Placement
SET
	LandBased = 1,
	AdjacentTilesCareAboutPlotTypes = 0,
	AdjacentTilesAvoidAnyland = 0,
	AdjacentTilesRequireShallowWater= 0,
	RequiredNumberOfAdjacentShallowWater = 0,
	AdjacentTilesCareAboutFeatureTypes= 0,
	ChangeCoreTileToMountain= 0,
	ChangeCoreTileTerrainToGrass= 0,
	SetAdjacentTilesToShallowWater= 0,
	EligibilityMethodNumber = 3,
	TileChangesMethodNumber= 3
WHERE NaturalWonderType = 'FEATURE_VOLCANO';

UPDATE Natural_Wonder_Placement
SET
	CoreTileCanBeAnyTerrainType = 0,
	CoreTileCanBeDesert = 1,
	AdjacentTilesAvoidDesert = 0,
	MaximumAllowedAdjacentDesert = 99,
	AdjacentTilesRequireHillsPlusMountains = 0,
	RequiredNumberOfAdjacentHillsPlusMountains = 0,
	ChangeCoreTileToMountain = 0
WHERE NaturalWonderType = 'FEATURE_GEYSER';

UPDATE Natural_Wonder_Placement
SET
	ChangeCoreTileToMountain = 0
WHERE NaturalWonderType = 'FEATURE_FOUNTAIN_YOUTH';

UPDATE Natural_Wonder_Placement
SET
	AdjacentTilesCareAboutFeatureTypes = 0,
	AdjacentTilesAvoidMarsh = 1,
	MaximumAllowedAdjacentMarsh = 99
WHERE NaturalWonderType = 'FEATURE_SRI_PADA';

UPDATE Natural_Wonder_Placement
SET
	AdjacentTilesCareAboutTerrainTypes = 0,
	AdjacentTilesAvoidJungle = 1,
	MaximumAllowedAdjacentJungle = 0
WHERE NaturalWonderType = 'FEATURE_MT_KAILASH';

UPDATE Natural_Wonder_Placement
SET
	AdjacentTilesCareAboutTerrainTypes = 1,
	AdjacentTilesAvoidGrass = 1,
	MaximumAllowedAdjacentGrass = 1
WHERE NaturalWonderType = 'FEATURE_LAKE_VICTORIA';

UPDATE Natural_Wonder_Placement
SET
	AdjacentTilesCareAboutFeatureTypes = 1
WHERE NaturalWonderType = 'FEATURE_KILIMANJARO';

UPDATE Natural_Wonder_Placement
SET
	CoreTileCanBeAnyTerrainType = 0,
	CoreTileCanBePlains = 1,
	CoreTileCanBeDesert = 1,
	CoreTileCanBeGrass = 1,
	AdjacentTilesAvoidHills = 1,
	MaximumAllowedAdjacentHills = 1
WHERE NaturalWonderType = 'FEATURE_SOLOMONS_MINES';
