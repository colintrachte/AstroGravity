function ship_step_visibility() {
	vis_fog=0;
	vis_dist=point_distance(0,0,sprite_width,sprite_height);

	//cloak
	energy_boost-=cloak;
	difference=(!cloak)*visibility-image_alpha;
	if (abs(difference)>.01)
	{
	    image_alpha+=sign(difference)*.01;
	}



}
