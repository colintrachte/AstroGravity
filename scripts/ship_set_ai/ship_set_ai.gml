function ship_set_ai() {
	target=instance_nearest(x,y,p_space_matter);
	target_x=target.x;
	target_y=target.y;
	locked_on=0;
	star_id=instance_nearest(x,y,o_star);



}
