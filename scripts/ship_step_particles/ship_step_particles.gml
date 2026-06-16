function ship_step_particles() {
	//particle trail
	part_type_color1(ship,color)
	part_type_alpha2(ship,image_alpha,0)
	part_type_life(ship,1+speed,1+speed)
	part_type_size(ship,image_yscale,image_yscale,sqrt(abs(speed))*.02,0)
	part_type_orientation(ship,image_angle,image_angle,0,10,0)
	part_type_direction(ship,image_angle-180,image_angle-180,0,1)
	part_particles_create(fx.above,x,y,ship,1)



}
