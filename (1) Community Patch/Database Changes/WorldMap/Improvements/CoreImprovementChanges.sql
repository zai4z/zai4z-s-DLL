-- Use Improvement_YieldPerXAdjacentImprovement instead
UPDATE Improvements SET CultureAdjacentSameType = 0 WHERE Type = 'IMPROVEMENT_MOAI';
INSERT INTO Improvement_YieldPerXAdjacentImprovement
	(ImprovementType, OtherImprovementType, YieldType, Yield, NumRequired)
VALUES
	('IMPROVEMENT_MOAI', 'IMPROVEMENT_MOAI', 'YIELD_CULTURE', 1, 1);
