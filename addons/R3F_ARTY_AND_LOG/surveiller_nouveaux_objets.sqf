#include "R3F_ARTY_disable_enable.sqf"
#include "R3F_LOG_disable_enable.sqf"
sleep 0.1;
private ["_liste_objets_depl_heli_remorq_transp", "_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];
#ifdef R3F_LOG_enable
_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables + R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;
#endif
while {true} do
{
	if !(isNull player) then
	{
		_liste_vehicules = nearestObjects [player, ["LandVehicle", "Ship", "Air", "Thing", "Static"], 75];
		_count_liste_vehicules = count _liste_vehicules;
		if (_count_liste_vehicules > 0) then
		{
			_sleepDelay = 10 / _count_liste_vehicules;
			{
				_objet = _x;
				if !(_objet getVariable ["R3F_LOG_init_done", false]) then
				{
					#ifdef R3F_LOG_enable
					if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
					{
						[_objet] spawn R3F_LOG_FNCT_objet_init;
					};
					if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
					{
						[_objet] spawn R3F_LOG_FNCT_heliporteur_init;
					};
					if ({_objet isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
					{
						[_objet] spawn R3F_LOG_FNCT_transporteur_init;
					};
					if ({_objet isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
					{
						[_objet] spawn R3F_LOG_FNCT_remorqueur_init;
					};
					_objet setVariable ["R3F_LOG_init_done", true];
					#endif
				};
				sleep _sleepDelay;
			} forEach _liste_vehicules;
/*			{
				_liste_vehicules_connus set [count _liste_vehicules_connus, _x];
			} forEach _liste_vehicules; */
		} else {
			sleep 10;
		};
	} else {
		sleep 2;
	};
};