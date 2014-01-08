if (!isServer) exitWith {};

if (loadFile (externalConfigFolder + "\admins.sqf") != "") then
{
    call compile preprocessFileLineNumbers (externalConfigFolder + "\admins.sqf");
} else {

    // Low Administrators: manage & spectate players, remove hacked vehicles
    lowAdmins = compileFinal str
    [
    "76561198039468603"  //8603 = JackDee
    ];

    // High Administrators: manage & spectate players, remove hacked vehicles, show player tags
    highAdmins = compileFinal str
    [
    "76561197974325742", //5742 = Poppy
    "76561198016350169", //0169 = Troutman
    "76561198041728491"  //8491 = SilentOperator6   
    ];

    // Server Owners: access to everything
    serverOwners = compileFinal str
    [
    "76561198018964268"  //4268 = Pager
    ];
};

if (typeName lowAdmins == "ARRAY") then { lowAdmins = compileFinal str lowAdmins };
if (typeName highAdmins == "ARRAY") then { highAdmins = compileFinal str highAdmins };
if (typeName serverOwners == "ARRAY") then { serverOwners = compileFinal str serverOwners };

publicVariable "lowAdmins";
publicVariable "highAdmins";
publicVariable "serverOwners";