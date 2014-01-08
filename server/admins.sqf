if (!isServer) exitWith {};

if (loadFile (externalConfigFolder + "\admins.sqf") != "") then
{
    call compile preprocessFileLineNumbers (externalConfigFolder + "\admins.sqf");
} else {

    // Low Administrators: manage & spectate players, remove hacked vehicles
    lowAdmins = compileFinal str
    [
    "76561198039468603", //8603 = JackDee
    "76561197974087118", //7118 = Murph
    "76561198002780890", //0890 = WampRat
    "76561198022608949"  //8949 = MrMackeyMKayyy
    ];

    // High Administrators: manage & spectate players, remove hacked vehicles, show player tags
    highAdmins = compileFinal str
    [
    "76561197974325742", //5742 = Poppy
    "76561197978062094", //2094 = Nimbus
    "76561198016350169", //0169 = Troutman
    "76561197964082556", //2556 = M249-M4A1
    "76561197962964073", //4073 = Termi
    "76561198041728491", //8491 = SilentOperator6   
    "76561198033671854"  //1854 = 11B30
    ];

    // Server Owners: access to everything
    serverOwners = compileFinal str
    [
    "76561198018964268", //4268 = Pager
    "76561197962768890", //8890 = LightEightSix
    "76561198023400574", //0574 = Paronity    
    "76561197994685469", //5469 = PaladinZero
    "76561197978927617" //7617 = BadBadRobot
    ];
};

if (typeName lowAdmins == "ARRAY") then { lowAdmins = compileFinal str lowAdmins };
if (typeName highAdmins == "ARRAY") then { highAdmins = compileFinal str highAdmins };
if (typeName serverOwners == "ARRAY") then { serverOwners = compileFinal str serverOwners };

publicVariable "lowAdmins";
publicVariable "highAdmins";
publicVariable "serverOwners";