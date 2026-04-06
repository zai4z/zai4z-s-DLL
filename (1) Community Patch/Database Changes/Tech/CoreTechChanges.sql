-- Community Patch activates this unused BNW column, so make Mining (which unlocks chopping) grant 100% chopping bonuses
UPDATE Technologies SET FeatureProductionModifier = 100 WHERE Type = 'TECH_MINING';

-- +1 city strike range at archery and rocketry, indirect fire at dynamite
UPDATE Technologies SET ExtraBombardRange = 1 WHERE Type = 'TECH_ARCHERY';
UPDATE Technologies SET ExtraBombardRange = 1 WHERE Type = 'TECH_ROCKETRY';
UPDATE Technologies SET BombardIndirect = 1 WHERE Type = 'TECH_DYNAMITE';
