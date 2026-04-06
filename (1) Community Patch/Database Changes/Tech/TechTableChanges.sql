-- Add range onto city ranged strike
ALTER TABLE Technologies ADD ExtraBombardRange integer DEFAULT 0;

-- Give indirect fire to city ranged strikes
ALTER TABLE Technologies ADD BombardIndirect boolean DEFAULT 0;

----------------------------------------------------------
-- 1 move cost to embark from/disembark into cities or canal tiles
ALTER TABLE Technologies ADD CityLessEmbarkCost boolean DEFAULT 0;

-- 0.1 move cost to embark from/disembark into cities or canal tiles. Overrides CityLessEmbarkCost.
ALTER TABLE Technologies ADD CityNoEmbarkCost boolean DEFAULT 0;

-- Happiness to every city
ALTER TABLE Technologies ADD Happiness integer DEFAULT 0;

-- Enables founding corporations
ALTER TABLE Technologies ADD CorporationsEnabled boolean DEFAULT 0;

-- Enables gaining vassals
ALTER TABLE Technologies ADD VassalageTradingAllowed boolean DEFAULT 0;

-- Extra automatons for every city
-- Automaton works the same as citizen, but doesn't count towards population
ALTER TABLE Technologies ADD CityAutomatonWorkersChange integer DEFAULT 0;

-- Extra working range for every city
-- Note that working range caps at MAX_CITY_RADIUS
ALTER TABLE Technologies ADD CityWorkingChange integer DEFAULT 0;
