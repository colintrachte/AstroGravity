/// @description ship_set_weapon(slot number,type,recoil,efficiency)
/// @param slot number
/// @param type
/// @param recoil
/// @param efficiency
function ship_set_weapon(slot, type, recoil, efficiency) {
	//weapon stats
	weapon_type[slot]=type;
	weapon_recoil[slot]=recoil;//it takes .2 seconds to recoil, so 5 shots per second
	weapon_ready[slot]=0;
	weapon_efficiency[slot]=efficiency;//allows for augmenting current weapon instead of replacing it
	weapon_alarm[slot]=0;



}
