/// @description load_particles_earth()
function load_particles_earth() {
	//dig a fake tunnel through something using particles
	holecollapse = part_type_create();
	part_type_alpha2(holecollapse,1,0);
	part_type_color1(holecollapse,make_color_rgb(238,185,0));
	part_type_life(holecollapse,15,30);
	part_type_shape(holecollapse,pt_shape_explosion);
	part_type_size(holecollapse,.5,.5,-.01,.1);

	hole = part_type_create();
	part_type_color1(hole,c_black);
	part_type_life(hole,900,900);
	part_type_shape(hole,pt_shape_disk);
	part_type_death(hole,1,holecollapse);



}
