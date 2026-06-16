function load_particles_systems() {
	middle=part_system_create();
	part_system_depth(middle,depth);

	above=part_system_create();
	part_system_depth(above,depth-100);

	below=part_system_create();
	part_system_depth(below,depth+100);



}
