-- +1 city strike range at archery and rocketry, indirect fire at dynamite
UPDATE Technologies SET ExtraBombardRange = 1 WHERE Type = 'TECH_ARCHERY';
UPDATE Technologies SET ExtraBombardRange = 1 WHERE Type = 'TECH_ROCKETRY';
UPDATE Technologies SET BombardIndirect = 1 WHERE Type = 'TECH_DYNAMITE';
