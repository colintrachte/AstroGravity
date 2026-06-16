/// @description fire_start(particle system,enable smoke)
/// @param particle system
/// @param enable smoke
function fire_start(particle, enable) {
	//By Ground Effect Games
	firesystem=particle;

	fire1=part_emitter_create(firesystem);
	fire2=part_emitter_create(firesystem);
	fire3=part_emitter_create(firesystem);
	onfire=1;
	char=1;
	burntime=sqrt(math_get_volume(sprite_width,sprite_height,1))*.1;
	smoke=enable;



}
