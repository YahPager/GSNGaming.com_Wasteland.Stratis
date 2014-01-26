[] spawn
{
	#include "R3F_ARTY_disable_enable.sqf"
	#include "R3F_LOG_disable_enable.sqf"
	if (isServer) then
	{
		R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir =
		{
			private ["_objet", "_direction"];
			_objet = _this select 1 select 0;
			_direction = _this select 1 select 1;
			// Orienter l'objet et broadcaster l'effet
			_objet setDir _direction;
			_objet setPos (getPos _objet);
		};
		"R3F_ARTY_AND_LOG_PUBVAR_setDir" addPublicVariableEventHandler R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
	};
	#ifdef R3F_ARTY_enable
		#include "R3F_ARTY\init.sqf"
		R3F_ARTY_active = true;
	#endif
	#ifdef R3F_LOG_enable
		#include "R3F_LOG\init.sqf"
		R3F_LOG_active = true;
	#else
		R3F_LOG_joueur_deplace_objet = objNull;
	#endif
	if (isDedicated) then
	{
		//execVM "addons\R3F_ARTY_AND_LOG\surveiller_nouveaux_objets_dedie.sqf";
	} else {
		execVM "addons\R3F_ARTY_AND_LOG\surveiller_nouveaux_objets.sqf";
/*		{
			_x setVariable ["R3F_LOG_disabled", true];
		} forEach ((nearestObjects [[0,0], R3F_LOG_CFG_objets_deplacables, 99999]) - (allMissionObjects "All")); */
	};
};