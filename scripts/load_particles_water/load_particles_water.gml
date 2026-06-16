/// @description load_particles_water()
function load_particles_water() {
	ripple = part_type_create();
	part_type_shape(ripple,pt_shape_flare);
	part_type_size(ripple,0.40,0.40,0,0.20);
	part_type_scale(ripple,0.20,1);
	part_type_alpha3(ripple,0,1,0);
	part_type_speed(ripple,2,2,0.01,1);
	part_type_direction(ripple,0,359,0,0);
	part_type_orientation(ripple,0,0,0,0,1);
	part_type_blend(ripple,1);
	part_type_life(ripple,60,60);

	bubble = part_type_create();
	part_type_shape(bubble,pt_shape_ring);
	part_type_size(bubble,.1,.2,0,.05);
	part_type_alpha3(bubble,.50,1,0);
	part_type_speed(bubble,1,1,0,0);
	part_type_direction(bubble,0,359,0,20);
	part_type_gravity(bubble,.05,90);
	part_type_blend(bubble,1);
	part_type_life(bubble,60,120);

	droplet = part_type_create()
	part_type_shape(droplet,pt_shape_sphere)
	part_type_size(droplet,0.1,0.2,0,0)
	part_type_scale(droplet,1,.2)
	part_type_color3(droplet,8388608,16776960,8388608)
	part_type_alpha3(droplet,0,1,0)
	part_type_speed(droplet,1,10,0,0)
	part_type_gravity(droplet,1,270)
	part_type_orientation(droplet,0,0,0,0,1)
	part_type_blend(droplet,1)
	part_type_life(droplet,30,60)



}
