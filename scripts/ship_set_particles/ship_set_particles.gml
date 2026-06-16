function ship_set_particles() {
	ship = part_type_create();
	part_type_life(ship,game_get_speed(gamespeed_fps)/4,game_get_speed(gamespeed_fps)/4)
	part_type_alpha2(ship,1,0)
	part_type_blend(ship,1)
	part_type_speed(ship,3,3,0,0)
	part_type_sprite(ship,sprite_index,0,0,0)



}
