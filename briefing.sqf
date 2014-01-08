//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["GSN", "GSN Changelog"];

player createDiaryRecord["GSN",
[
"v1",
"
<br/>
	[Pilot] - GSNGaming.com Alpha Version of our ARMA 3 Wasteland based off of Team Wasteland Altis v3 Alpha.<br/>
	[Gun Store] - Where you can get a wide variety of Weapons, Ammo and Equipment.<br/>
	[General Store] - Has Food, Water, Jerry Cans, Spawn Beacons, and Camo Netting.<br/>
	[Vehicle Service] - Is where you can pull up and Refuel, Repair, and Rearm your vehicle.<br/>
	[First-Aid] - If your not a medic and need healed you can go in this building and get Healed.<br/>
	[Heli Service] - Same as Vehicle Service but for Heli. You must be inside the circle.<br/>
	[Future] - We will be adding a Vehice Store one stop shop to get Land, Air and Sea Vehicles.<br/>
	[For Now] - Light Tank's, MBT's, and APC's. do not spawn and are not in Missions.<br/>
	[Errors] - Are likely and will be fixed when found within a day or two.<br/>
	[Report] - Errors that you find you can report them to our Forums @ GSNGaming.com.<br/>
	[Modifier] - <font size='16'>GSN Pager has converted this Team Wasteland Mod from their Altis Version to Stratis.</font><br/>
"
]
];

player createDiaryRecord["GSN",
[
"v2",
"
<br/>
	[NEW] - GSNGaming.com is now running the Beta Version of The Team Wasteland Mod.<br/>
	[NEW] - Added Divers as a class you can pick to be.<br/>
	[NEW] - Dive Missions: 1 for Main Missions and 1 for Side Missions.<br/>
	[Modified] - Vehicle Loadout.<br/>
	[Modified] - What weapons you spawn in with.<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v3",
"
<br/>
	[NEW] - Update of the Team Wasteland Beta Version.<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v4",
"
<br/>
	[NEW] - Update of the Team Wasteland Beta Version.<br/>
	[NEW] - Added Vehicle Stores.<br/>
        #1 Airfield North: Land, Air, & Heli Spawns.<br/>
        #2 Kamino Bay: Land, Heli, & Sea Spawns.<br/>
        #3 Air Station Mike: Land & Heli Spawns.<br/>
        #4 Strogos Bay: Land, Air, & Heli Spawns.<br/>
        [Updated] Mapping layout.<br/>
        [Changed] Loadout from Mk 20 to MXM w/ Hamr Scope and Pointer
"
]
];

player createDiaryRecord["GSN",
[
"v5",
"
<br/>
	[NEW] - Update of the Team Wasteland Initial Release v0.9c<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v6",
"
<br/>
	[NEW] - Update from Team Wasteland Initial Release v0.9d<br/>
	[Changed] - Vehicle loadout add The Camo GhostHawk as a spawning Heli<br/>
	[Changed] - Jets are turned off till I can get weapons to spawn that can shot them down.<br/>
	[Changed] - Gas Station is no longer a Vehicle Service Added one on the Airfield.<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v7",
"
<br/>
	[NEW] - Added the DMR (Rahim marksman rifle - bullpup 7.62) with the ARCO Scope as your Spawning Rifle.<br/>
	[NEW] - Added the 4-Five (.45 pistol) as your Spawning Pistol.<br/>
	[WORKING] - On getting the new weapons added to the Mission Crates.<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v8",
"
<br/>
	[CHANGED] - Back to the MK-18 with the DMS Scope (NEW) as your Spawning Rifle.<br/>
	[NEW] - Added Stratis Hospital to the map.<br/>
	[NEW] - Got First-Aid Stations to work and added them back on the map.<br/>
"
]
];

player createDiaryRecord["GSN",
[
"v9",
"
<br/>
	[NEW] - Update from Team Wasteland Version 0.9f.<br/>
	[NEW] - WY-55 Hellcat (Unarmed) add as a regular spawning Heli and as a CivHeli Mission.<br/>
	[NEW] - LRPS Long Range Precision Scope added to Crates and Gun Stores.<br/>
	[Changed] - Headgear so you can tell SIDES apart (Opfor, Blufor, Indie).<br/>
	[NEW] - Money Missions as added by Team Wasteland.<br/>
"
]
];
player createDiaryRecord["GSN",
[
"v10",
"
<br/>
	[NEW] - Update the mission.sqm to the A3WL Stratis one with our touches.<br/>
"
]
];

player createDiaryRecord ["changelog",
[
"0.9f",
"
<br/> [Added] - Money missions
<br/> [Added] - Sell Crate Items option at stores when moving crate
<br/> [Changed] - Reorganized loots for crates and trucks
<br/> [Fixed] - Broken Warchest menu
<br/> [Fixed] - Spawn beacons not working for Independent groups
<br/> [Fixed] - Player icons position inside buildings
<br/> [Fixed] - MRAPs and quadbikes not spawning
<br/> [Fixed] - Broken money rewards for territories
"
]];

player createDiaryRecord ["changelog",
[
"0.9e",
"
<br/> [Added] - Territory system
<br/> [Added] - Jumping option (step over while running)
<br/> [Added] - New weapons from v1.04 update
<br/> [Changed] - Water and food now use water bottles and baked beans
<br/> [Fixed] - Store object purchases not operating as intended
<br/> [Fixed] - Objects purchased from stores not saving properly
<br/> [Fixed] - Minor server-side memory leak
"
]];

player createDiaryRecord ["changelog",
[
"0.9d",
"
<br/> [Added] - Store object purchases
<br/> [Changed] - New UI by KoS
"
]];

player createDiaryRecord ["changelog",
[
"0.9c",
"
<br/> [Changed] - Instant money pickup and drop
<br/> [Changed] - Increased plane and heli spawning odds
<br/> [Fixed] - FPS fix improvements
<br/> [Fixed] - Vehicles disappearing when untowed or airdropped
"
]];

player createDiaryRecord ["changelog",
[
"0.9b",
"
<br/> [Initial release] - Welcome to stratis!
"
]];


player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16'>Original ArmA 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16'>Ported to ArmA 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16'>Development of this version by:</font>
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* AWA (OpenDayZ)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Krunch (GitHub)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* Na-Palm (BIS forums)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["infos",
[
"About Wasteland",
"
<br/>Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to http://forums.a3wasteland.com/
<br/>
<br/>FAQ:
<br/>
<br/>Q. What am I supposed to do here?
<br/>A. See the above description
<br/>
<br/>Q. Where can I get a gun?
<br/>A. Weapons are found in one of three places, first in ammo crates that come as rewards from missions, inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/>
<br/>Q. What are the grey circles on the map?
<br/>A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/>
<br/>Q. Why is it so dark, I cant see.
<br/>A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or use your Nightvision Goggles as the darkness sets in.
<br/>
<br/>Q. Is it ok for me to shoot my team mates?
<br/>A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steal items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/>
<br/>Q. Whats with the canisters, baskets and big bags?
<br/>A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from food sacks and wells, or baskets and plastic canisters dropped by dead players. Food and water will also randomly spawn around the map.
<br/>
<br/>Q. I saw someone breaking a rule, what do I do?
<br/>A. Simply go into global chat and get the attention of one of the admins or visit our forums, and make a report if the offense is serious.
"
]];
