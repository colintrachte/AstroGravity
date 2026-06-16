/// @description load_particles_fire()
function load_particles_fire() {
	//main fire particle
	fire=part_type_create()
	part_type_shape(fire,pt_shape_explosion)
	part_type_color1(fire,c_orange)
	part_type_size(fire,.3,.8,-.01,0)
	part_type_alpha3(fire,0,1,0)
	part_type_life(fire,30,90)
	part_type_direction(fire,0,360,.1,10)
	part_type_speed(fire,1,2,-.01,0)
	part_type_orientation(fire,0,360,1,0,0)
	part_type_blend(fire,1)

	//Fire Line
	fire_l=part_type_create()
	part_type_sprite(fire_l,sp_fireline,0,0,1)
	part_type_size(fire_l,.9,.9,-.01,0)
	part_type_alpha3(fire_l,0,.5,0)
	part_type_life(fire_l,70,90)
	part_type_direction(fire_l,0,360,0,0)
	part_type_speed(fire_l,1,2,0,0)
	part_type_orientation(fire_l,0,360,1,0,0)
	part_type_blend(fire_l,1)

	//Fire Spark
	fire_s=part_type_create()
	part_type_shape(fire_s,pt_shape_pixel)
	part_type_color1(fire_s,c_orange)
	part_type_size(fire_s,.1,1,-.01,0)
	part_type_life(fire_s,15,60)
	part_type_direction(fire_s,0,360,0,15)
	part_type_speed(fire_s,1,3,-.01,0)
	part_type_orientation(fire_s,0,360,1,0,0)
	part_type_blend(fire_s,1)

	smoke = part_type_create();
	part_type_alpha3(smoke,0,.6,0);
	part_type_color2(smoke,c_black,c_dkgray);
	part_type_direction(smoke,0,360,0,0);
	part_type_orientation(smoke,0,360,-1,0,0);
	part_type_life(smoke,150,210);
	part_type_shape(smoke,pt_shape_explosion);
	part_type_size(smoke,.4,1,.005,0);
	part_type_speed(smoke,.5,2,-.005,0);
	part_type_gravity(smoke,.001,90)

	//This particle causes the flash you see in the explosions
	flash = part_type_create();
	part_type_color_mix(flash,c_white,c_black);
	part_type_life(flash,6,12);
	part_type_sprite(flash,sp_cloud,0,0,0)
	part_type_size(flash,.5,1,.1,.01);
	part_type_alpha3(flash,.6,.9,0);
	part_type_speed(flash,0,7,-1,0);
	part_type_direction(flash,0,360,1,0);
	part_type_orientation(flash,0,360,0,3,0);
	part_type_blend(flash,1)
	part_type_death(flash,1,smoke)



}
