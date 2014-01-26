if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat (localize "STR_R3F_LOG_mutex_action_en_cours");
} else {
	R3F_LOG_mutex_local_verrou = true;
	private ["_heliporteur", "_objet", "_velocity", "_airdrop"];
	_heliporteur = _this select 0;
	_objet = _heliporteur getVariable "R3F_LOG_heliporte";
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
	if ((velocity _heliporteur) call BIS_fnc_magnitude < 15 && getPos _heliporteur select 2 < 40) then
	{
		_airdrop = false;
	} else {
		_airdrop = true;
	};
	if (local _objet) then
	{
		[netId _objet, _airdrop] execVM "server\functions\detachTowedObject.sqf";
	} else {
		requestDetachTowedObject = [netId _objet, _airdrop];
		publicVariable "requestDetachTowedObject";
	};
	player globalChat format [(localize "STR_R3F_LOG_action_heliport_larguer_fait"), getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
	R3F_LOG_mutex_local_verrou = false;
};