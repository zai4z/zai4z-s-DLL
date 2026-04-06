-- Modifier on warmonger score
-- Update the base eras with the correct values
-- Also add new city bombard art for each era
UPDATE Eras SET WarmongerPercent = 50, CityBombardEffectTag = 'ART_DEF_VEFFECT_AFRICAN_FOREST_SPEAR_STATIC' WHERE Type = 'ERA_ANCIENT';
UPDATE Eras SET EraSplashImage = 'ERA_Classical.dds', WarmongerPercent = 60 WHERE Type = 'ERA_CLASSICAL';
UPDATE Eras SET EraSplashImage = 'ERA_Medievel.dds', WarmongerPercent = 70  WHERE Type = 'ERA_MEDIEVAL';
UPDATE Eras SET EraSplashImage = 'ERA_Renissance.dds', WarmongerPercent = 80, CityBombardEffectTag = 'ART_DEF_VEFFECT_HWACHA_ARROW' WHERE Type = 'ERA_RENAISSANCE';
UPDATE Eras SET EraSplashImage = 'ERA_Industrial.dds', WarmongerPercent = 90, CityBombardEffectTag = 'ART_DEF_VEFFECT_WW1_BOMBER_PROJECTILE' WHERE Type = 'ERA_INDUSTRIAL';
UPDATE Eras SET EraSplashImage = 'ERA_Modern.dds', WarmongerPercent = 100, CityBombardEffectTag = 'ART_DEF_VEFFECT_WW1_BOMBER_PROJECTILE' WHERE Type = 'ERA_MODERN';
UPDATE Eras SET EraSplashImage = 'ERA_Atomic.dds', WarmongerPercent = 110 WHERE Type = 'ERA_POSTMODERN';
UPDATE Eras SET EraSplashImage = 'ERA_Future.dds', WarmongerPercent = 120, CityBombardEffectTag = 'ART_DEF_VEFFECT_TRAIL_RAILGUN_PROJ' WHERE Type = 'ERA_FUTURE';
