/// @description load_particles_air()
function load_particles_air() {
	lsparks = part_type_create();
	part_type_shape(lsparks,pt_shape_flare);
	part_type_alpha2(lsparks,.5,.2);
	part_type_life(lsparks,2,10);
	part_type_scale(lsparks,.2,1);
	part_type_speed(lsparks,0,5,-.1,2);
	part_type_blend(lsparks,1);

	cubesparks = part_type_create()
	part_type_shape(cubesparks,pt_shape_square)
	part_type_size(cubesparks,1,1,-.1,0)
	part_type_scale(cubesparks,.9,.10)
	part_type_alpha2(cubesparks,1,0)
	part_type_orientation(cubesparks,0,0,0,0,1)
	part_type_blend(cubesparks,1)
	part_type_life(cubesparks,1,10)
	part_type_speed(cubesparks,10,30,-1,2)

	windy = part_type_create();
	part_type_color1(windy,make_color_rgb(238,185,0));
	part_type_life(windy,90,300);
	part_type_shape(windy,pt_shape_pixel);
	part_type_size(windy,.1,1,0,.2);

	vapor = part_type_create();
	part_type_shape(vapor,pt_shape_smoke);
	part_type_alpha3(vapor,0,1,0);
	part_type_orientation(vapor,0,0,10,0,1);
	part_type_size(vapor,.1,2,-.01,.05);
	part_type_life(vapor,30,120);

	shockwave = part_type_create();
	part_type_alpha2(shockwave,1,0);
	part_type_blend(shockwave,1);
	part_type_life(shockwave,30,30);
	part_type_shape(shockwave,pt_shape_ring);
	part_type_size(shockwave,.5,2,1,0);

	sparks = part_type_create();
	part_type_shape(sparks,pt_shape_sphere);
	part_type_size(sparks,0.1,0.20,0,.3);
	part_type_color3(sparks,255,33023,random_color());
	part_type_alpha3(sparks,.3,1,0);
	part_type_speed(sparks,1,2,0,0);
	part_type_direction(sparks,20,160,0,30);
	part_type_blend(sparks,1);
	part_type_life(sparks,30,60);

	sand = part_type_create();
	part_type_alpha2(sand,1,0);
	part_type_color1(sand,make_color_rgb(238,185,0));
	part_type_direction(sand,0,180,0,1);
	part_type_life(sand,15,30);
	part_type_shape(sand,pt_shape_pixel);
	part_type_size(sand,.1,2,-.01,.1);
	part_type_speed(sand,3,6,-.01,.01);

	cloud = part_type_create();
	part_type_alpha3(cloud,0,.3,0);
	part_type_color2(cloud,c_white,c_ltgray);
	part_type_shape(cloud,pt_shape_smoke);
	part_type_life(cloud,game_get_speed(gamespeed_fps)*10,game_get_speed(gamespeed_fps)*20);
	part_type_size(cloud,room_height*.001,room_height*.01,.001,.002);
	part_type_orientation(cloud,0,360,0,0,0);



}
