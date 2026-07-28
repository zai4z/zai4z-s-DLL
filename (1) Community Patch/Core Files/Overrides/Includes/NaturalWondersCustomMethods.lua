-------------------------------------------------------------------------------------------
-- NaturalWonderCustomMethods.lua written by zai4z
--------------------------------------------------------------------------------------------

local AdjReef
local Coast = TerrainTypes.TERRAIN_COAST
local Mountain = PlotTypes.PLOT_MOUNTAIN
local Grass = TerrainTypes.TERRAIN_GRASS
local Ocean = TerrainTypes.TERRAIN_OCEAN
local Reef = FeatureTypes.FEATURE_REEF

-------------------------------------------------------------------------------------------
-- Check if plot is valid
--------------------------------------------------------------------------------------------

function NWCustomEligibility(x, y, method_number)
	local iW, iH = Map.GetGridSize()
	local plot = Map.GetPlot(x, y)
	local TerrainType = plot:GetTerrainType()
	local FeatureType = plot:GetFeatureType()
	local ResourceType = plot:GetResourceType()
	local AdjacentToLand = plot:IsAdjacentToLand()

	-- Great Barrier Reef
	if method_number == 1 then	
		-- get latitude to prevent it from spawning in polar regions
		if (y >= (iH/2)) then	
			-- upper half of map
			if (math.abs((iH/2) - y)/(iH/2)) > 0.5 then
				return false
			end
		else
			-- lower half of map
			if (math.abs((iH/2) - (y + 1))/(iH/2)) > 0.5 then
				return false
			end
		end

		if not plot:IsWater() or plot:IsLake() or AdjacentToLand or (ResourceType ~= -1) or (FeatureType ~= -1) then
			return false
		end
		
		local naturalDirections, forcedDirections = {}, {}
		local iNumLand = 0

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)
			
			if not adjplot then
				return false
			end

			if adjplot:IsAdjacentToLand() then
				iNumLand = iNumLand + 1
			elseif (direction ~= 1) and (direction ~= 4) then
				if (adjplot:GetFeatureType() == -1) and (adjplot:GetResourceType() == -1) then
					table.insert(naturalDirections, direction)
				else
					table.insert(forcedDirections, direction)
				end
			end
		end

		-- Must be close to land
		if iNumLand < 3 then
			return false
		end

		local chosenDirection
		if #naturalDirections > 0 then
			chosenDirection = naturalDirections[1 + Map.Rand(#naturalDirections, "Reef orientation (natural) - Lua")];
		elseif #forcedDirections > 0 then
			chosenDirection = forcedDirections[1 + Map.Rand(#forcedDirections, "Reef orientation (forced) - Lua")];
		end

		if not chosenDirection then
			return false
		end

		AdjReef = chosenDirection
		return true

	-- Rock of Gibraltar
	elseif method_number == 2 then
		-- get latitude to prevent it from spawning in polar regions
		if (y >= (iH/2)) then	
			-- upper half of map
			if (math.abs((iH/2) - y)/(iH/2)) > 0.6 then
				return false
			end
		else
			-- lower half of map
			if (math.abs((iH/2) - (y + 1))/(iH/2)) > 0.6 then
				return false
			end
		end

		if (TerrainType ~= Coast) or not AdjacentToLand or (ResourceType ~= -1) or (FeatureType ~= -1) then
			return false
		end

		local iNumLand = 0

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)

			if not adjplot then
				return false
			end

			if not adjplot:IsWater() then 
				-- Must be on large continent
				if adjplot:Area():GetNumTiles() <= iH/2 then
					return false
				end
			
				iNumLand = iNumLand + 1
			end
		end
		
		-- Must only have 1 tile of land adjacent
		if iNumLand ~= 1 then
			return false
		end

		return true
	
	-- Krakatoa
	elseif method_number == 3 then
		-- get latitude to prevent it from spawning in polar regions
		if (y >= (iH/2)) then	
			-- upper half of map
			if (math.abs((iH/2) - y)/(iH/2)) > 0.5 then
				return false
			end
		else
			-- lower half of map
			if (math.abs((iH/2) - (y + 1))/(iH/2)) > 0.5 then
				return false
			end
		end 

		if not plot:IsWater() or plot:IsLake() or AdjacentToLand or (ResourceType ~= -1) or (FeatureType ~= -1) then
			return false
		end

		local iNumLand = 0

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)
			
			if not adjplot then
				return false
			end

			if adjplot:IsAdjacentToLand() then
				local Area = Map.GetArea(adjplot:GetNearestLandArea())
				if Area and Area:GetNumTiles() > iH/2 then
					-- Must be on small continent/island
					return false
				end

				iNumLand = iNumLand + 1
			end
		end

		if (iNumLand < 3) then
			return false
		end

		return true
	
	-- Unidentified Method Number
	else
		return false
	end
end

-------------------------------------------------------------------------------------------
-- Plot chosen, process
--------------------------------------------------------------------------------------------

function NWCustomPlacement(x, y, row_number, method_number)
	local plot = Map.GetPlot(x, y)

	-- Great Barrier Reef
	if method_number == 1 then
		
		plot:SetTerrainType(Coast)

		local secondplot = Map.PlotDirection(x, y, AdjReef)
		secondplot:SetResourceType(-1)
		secondplot:SetFeatureType(Reef)
		sx, sy = secondplot:GetX(), secondplot:GetY()

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)
			adjplot:SetTerrainType(Coast)
		end

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(sx, sy, direction)
			if adjplot then
				adjplot:SetTerrainType(Coast)
			end
		end

		return sx, sy

	-- Rock of Gibraltar.
	elseif method_number == 2 then
		plot:SetPlotType(Mountain)
		plot:SetTerrainType(Grass)

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)
			if (adjplot:GetTerrainType() == Ocean) then
				adjplot:SetTerrainType(Coast)
			end
		end

	-- Krakatoa
	elseif method_number == 3 then
		plot:SetPlotType(Mountain)
		plot:SetTerrainType(Grass)

		for direction = 0, 5 do
			local adjplot = Map.PlotDirection(x, y, direction)
			adjplot:SetTerrainType(Coast)
		end
	end
end
