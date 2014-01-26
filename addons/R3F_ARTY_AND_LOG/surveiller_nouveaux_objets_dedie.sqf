#include "R3F_ARTY_disable_enable.sqf"
#ifdef R3F_ARTY_enable
sleep 0.1;
private ["_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];
_liste_vehicules_connus = [];
while {true} do
{
	_liste_vehicules = vehicles;
	_count_liste_vehicules = count _liste_vehicules;
	if (_count_liste_vehicules > 0) then
	{
		{
			if !(_objet getVariable ["R3F_LOG_init_dedie_done", false]) then
			{
				_objet = _x;
				//#ifdef R3F_ARTY_enable // Déjà présent plus haut dans la version actuelle
				if ({_objet isKindOf _x} count R3F_ARTY_CFG_pieces_artillerie > 0) then
				{
					[_objet] spawn R3F_ARTY_FNCT_piece_init_dedie;
				};
				//#endif
				_objet setVariable ["R3F_LOG_init_dedie_done", true];
			}
			sleep (18/_count_liste_vehicules);
		} forEach _liste_vehicules;
	} else {
		sleep 18;
	};
};

#endif