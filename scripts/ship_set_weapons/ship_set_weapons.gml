/// @description ship_set_weapons(type)
/// @param type
function ship_set_weapons(argument0) {
	//weapon stats
	primary_type=argument0;
	primary_recoil=.2;//it takes .2 seconds to recoil, so 5 shots per second
	primary_ready=0;
	primary_efficiency=.1;//allows room for augmenting current weapon instead of replacing it
	alarm1=0;
	alarm2=0;


}
