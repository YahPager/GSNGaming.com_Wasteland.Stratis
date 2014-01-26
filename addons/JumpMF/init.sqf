horde_jumpmf_fnc_playMove = compileFinal "_this playMove 'AovrPercMrunSrasWrflDf'";
"horde_jumpmf_var_playMove" addPublicVariableEventHandler { (_this select 1) call horde_jumpmf_fnc_playMove };
if (!hasInterface) exitWith {};
horde_jumpmf_var_jumping = false;
horde_jumpmf_fnc_detect_key_input = "addons\JumpMF\detect_key_input.sqf" call mf_compile;
waitUntil {sleep 0.1; !isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call horde_jumpmf_fnc_detect_key_input"];