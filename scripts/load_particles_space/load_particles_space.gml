function load_particles_space() {
	//load_particles_space()
	//Outer Space Themed Particles
	stars = part_type_create();
	part_type_shape(stars,pt_shape_sphere)
	part_type_alpha2(stars,.8,0)
	part_type_blend(stars,1)
	part_type_size(stars,.01,.03,0,0)
	part_type_speed(stars,0,-2,0,0)
	part_type_life(stars,game_get_speed(gamespeed_fps)/2,game_get_speed(gamespeed_fps))

	star = part_type_create();
	part_type_color_mix(star,c_white,make_color_rgb(234,232,255));
	part_type_speed(star,.5,.7,0,0);
	part_type_direction(star,22.5,22.5,-.009,.1);
	part_type_shape(star,pt_shape_pixel);
	part_type_size(star,0.2,0.5,0,0.02);
	part_type_life(star,game_get_speed(gamespeed_fps)*100,game_get_speed(gamespeed_fps)*100);

	sun = part_type_create();
	part_type_shape(sun,pt_shape_sphere);
	part_type_size(sun,1,1,-0.005,0);
	part_type_color2(sun,39935,49151);
	part_type_speed(sun,1,1,0,0);
	part_type_direction(sun,0,359,0,20);
	part_type_blend(sun,1);
	part_type_life(sun,15,30);

	wave = part_type_create();
	part_type_shape(wave,pt_shape_sphere);
	part_type_blend(wave,1);
	part_type_alpha2(wave,.5,0);

	wave2 = part_type_create();
	part_type_shape(wave2,pt_shape_sphere);
	part_type_scale(wave2,.5,.05);
	part_type_alpha3(wave2,0,1,0);
	part_type_blend(wave2,1);
	part_type_life(wave2,30,30);



}
