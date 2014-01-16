//	@file Version: 1.0
//	@file Name: fn_refilltruck.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2013 15:28

if (!isServer) exitWith {};

private ["_truck", "_truckItems", "_item", "_qty", "_mag"];
_truck = _this;

// Clear prexisting cargo first
clearMagazineCargoGlobal _truck;
clearWeaponCargoGlobal _truck;
clearItemCargoGlobal _truck;

// Item type, Item, # of items, # of magazines per weapon
_truckItems =
[
	["itm", "FirstAidKit", 2],
	["itm", "Medikit", 3],
	["itm", "Toolkit", 1],
	["wep", "Rangefinder", 2],
	["itm", ["optic_SOS", 3],
	["itm", ["optic_Hamr", 1],
	["wep", ["SMG_01_F", "SMG_02_F", "hgun_PDW2000_F"], 1, 4],
	["wep", ["srifle_GM6_SOS_F", 2, 10],
	["wep", "launch_Titan_short_F", 2, 5],
	["wep", "srifle_LRR_SOS_F", 2, 10],
	["mag", "HandGrenade", 5],
	["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag"], 5],
	["mag", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]
];

[_truck, _truckItems] call processItems;