# zai4z's DLL

This is a fork of the Community Patch DLL (used in vox populi)

This version has various changes to better support my ecosystem of mods

- Removes hard coded no follow-up from attacking out of cities
- Adds canal city tag functionality for lua, allowing cities to produce naval units
- ```AllowsWalkWater``` column in Improvements table will ignore embarked land units (bridges will only act as land for non-embarked land units)
- Workers are able to construct railroad on top of ```AllowsWalkWater``` improvements with road
- Upgrading units in allied miltaristic city-state territory will now apply to all allied city-state territory
- ```MakesPassable``` column in Improvements will now work outside friendly territory and on any land tile
- Naval units will be able to enter ```MakesPassable``` improvements in enemy territory or open border territory
