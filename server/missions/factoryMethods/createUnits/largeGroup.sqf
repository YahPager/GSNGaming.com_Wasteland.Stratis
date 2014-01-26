if (!isServer) exitWith {};

private ["_group", "_pos", "_skill", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10", "_man11", "_man12", "_man13", "_man14", "_man15"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
_leader addUniform "U_B_CombatUniform_mcam";
_leader addVest "V_PlateCarrierGL_rgr";
_leader addBackpack "B_Bergen_blk";
_leader addMagazine "20Rnd_762x51_Mag";
_leader addWeapon "srifle_EBR_ACO_F";
_leader addMagazine "20Rnd_762x51_Mag";
_leader addMagazine "20Rnd_762x51_Mag";
_leader addMagazine "NLAW_F";
_leader addWeapon "launch_NLAW_F";
_leader addMagazine "NLAW_F";

// Rifleman
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
_man2 addUniform "U_B_CombatUniform_mcam_vest";
_man2 addVest "V_PlateCarrier1_rgr";
_man2 addMagazine "20Rnd_762x51_Mag";
_man2 addWeapon "srifle_EBR_ACO_F";
_man2 addMagazine "20Rnd_762x51_Mag";
_man2 addMagazine "20Rnd_762x51_Mag";

// Rifleman
_man3 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
_man3 addUniform "U_B_CombatUniform_mcam_vest";
_man3 addVest "V_PlateCarrier1_rgr";
_man3 addMagazine "20Rnd_762x51_Mag";
_man3 addWeapon "srifle_EBR_ACO_F";
_man3 addMagazine "20Rnd_762x51_Mag";
_man3 addMagazine "20Rnd_762x51_Mag";

// Grenadier
_man4 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
_man4 addUniform "U_B_CombatUniform_mcam_tshirt";
_man4 addVest "V_PlateCarrier1_rgr";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "arifle_TRG21_GL_F";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "1Rnd_HE_Grenade_shell";
_man4 addMagazine "1Rnd_HE_Grenade_shell";
_man4 addMagazine "1Rnd_HE_Grenade_shell";

// Rifleman
_man5 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
_man5 addUniform "U_B_CombatUniform_mcam_vest";
_man5 addVest "V_PlateCarrier1_rgr";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addWeapon "srifle_EBR_ACO_F";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addMagazine "20Rnd_762x51_Mag";

// Rifleman
_man6 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
_man6 addUniform "U_B_CombatUniform_mcam_vest";
_man6 addVest "V_PlateCarrier1_rgr";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addWeapon "srifle_EBR_ACO_F";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addMagazine "20Rnd_762x51_Mag";

// Grenadier
_man7 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
_man7 addUniform "U_B_CombatUniform_mcam_tshirt";
_man7 addVest "V_PlateCarrier1_rgr";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addWeapon "arifle_TRG21_GL_F";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";

// Rifleman
_man8 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
_man8 addUniform "U_B_CombatUniform_mcam_vest";
_man8 addVest "V_PlateCarrier1_rgr";
_man8 addMagazine "20Rnd_762x51_Mag";
_man8 addWeapon "srifle_EBR_ACO_F";
_man8 addMagazine "20Rnd_762x51_Mag";
_man8 addMagazine "20Rnd_762x51_Mag";

// Rifleman
_man9 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
_man9 addUniform "U_B_CombatUniform_mcam_vest";
_man9 addVest "V_PlateCarrier1_rgr";
_man9 addMagazine "20Rnd_762x51_Mag";
_man9 addWeapon "srifle_EBR_ACO_F";
_man9 addMagazine "20Rnd_762x51_Mag";
_man9 addMagazine "20Rnd_762x51_Mag";

// Grenadier
_man10 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man10;
_man10 addUniform "U_B_CombatUniform_mcam_tshirt";
_man10 addVest "V_PlateCarrier1_rgr";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addWeapon "arifle_TRG21_GL_F";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "1Rnd_HE_Grenade_shell";
_man10 addMagazine "1Rnd_HE_Grenade_shell";
_man10 addMagazine "1Rnd_HE_Grenade_shell";

// Sniper
_man11 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man11;
_man11 addUniform "U_B_GhillieSuit";
_man11 addVest "V_PlateCarrierGL_rgr";
_man11 addMagazine "20Rnd_762x51_Mag";
_man11 addWeapon "srifle_EBR_SOS_F";
_man11 addMagazine "20Rnd_762x51_Mag";
_man11 addMagazine "20Rnd_762x51_Mag";

// Sniper
_man12 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man12;
_man12 addUniform "U_B_GhillieSuit";
_man12 addVest "V_PlateCarrierGL_rgr";
_man12 addMagazine "20Rnd_762x51_Mag";
_man12 addWeapon "srifle_EBR_SOS_F";
_man12 addMagazine "20Rnd_762x51_Mag";
_man12 addMagazine "20Rnd_762x51_Mag";

// Anti Tank
_man13 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man13;
_man13 addUniform "U_B_CombatUniform_mcam_tshirt";
_man13 addVest "V_PlateCarrierGL_rgr";
_man13 addBackpack "B_Carryall_oucamo";
_man13 addMagazine "20Rnd_762x51_Mag";
_man13 addWeapon "srifle_EBR_ACO_F";
_man13 addMagazine "20Rnd_762x51_Mag";
_man13 addMagazine "20Rnd_762x51_Mag";
_man13 addMagazine "Titan_AT";
_man13 addWeapon "launch_Titan_short_F";
_man13 addMagazine "Titan_AT";
_man13 addMagazine "Titan_AT";

// Anti Tank
_man14 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man14;
_man14 addUniform "U_B_CombatUniform_mcam_tshirt";
_man14 addVest "V_PlateCarrierGL_rgr";
_man14 addBackpack "B_Carryall_oucamo";
_man14 addMagazine "20Rnd_762x51_Mag";
_man14 addWeapon "srifle_EBR_ACO_F";
_man14 addMagazine "20Rnd_762x51_Mag";
_man14 addMagazine "20Rnd_762x51_Mag";
_man14 addMagazine "Titan_AT";
_man14 addWeapon "launch_Titan_short_F";
_man14 addMagazine "Titan_AT";
_man14 addMagazine "Titan_AT";

// Anti Air
_man15 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
removeAllAssignedItems _man15;
_man15 addUniform "U_B_CombatUniform_mcam_tshirt";
_man15 addVest "V_PlateCarrierGL_rgr";
_man15 addBackpack "B_Carryall_oucamo";
_man15 addMagazine "20Rnd_762x51_Mag";
_man15 addWeapon "srifle_EBR_ACO_F";
_man15 addMagazine "20Rnd_762x51_Mag";
_man15 addMagazine "20Rnd_762x51_Mag";
_man15 addMagazine "Titan_AA";
_man15 addWeapon "launch_Titan_F";
_man15 addMagazine "Titan_AA";
_man15 addMagazine "Titan_AA";

_leader = leader _group;

{
	_x spawn refillPrimaryAmmo;
	_x spawn addMilCap;
	_x call setMissionSkill;
	_x addRating 9999999;
	_x addEventHandler ["Killed", {_this call server_playerDied; (_this select 1) call removeNegativeScore}];
} forEach units _group;

[_group, _pos] call defendArea;