/// @description fire_step(width,height)
/// @param width
/// @param height
function fire_step(width, height) {
	//By Ground Effect Games
	var w,h,x1,y1,x2,y2;
	w=width*.5;
	h=height*.5;
	x1=x-w;
	y1=y-w;
	x2=x+w;
	y2=y+w;

	part_emitter_region(firesystem,fire1,x1,x2,y1,y2,ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_region(firesystem,fire2,x1,x2,y1,y2,ps_shape_ellipse,ps_distr_invgaussian);
	part_emitter_region(firesystem,fire3,x1,x2,y1,y2,ps_shape_ellipse,ps_distr_linear);

	if (random_dice(40/(speed+1))*smoke*onfire)
	{
	    part_particles_create(fx.below,x,y,fx.smoke,1)
	}

	repeat(1+sqrt(speed+w+h)*.2)
	{
	    choose(part_emitter_burst(firesystem,fire1,fx.fire,1),
	    part_emitter_burst(firesystem,fire2,fx.fire_l,1),
	    part_emitter_burst(firesystem,fire3,fx.fire_s,1))
	}

	if (char>.2)//changes the blending color until it turns 80% black
	{
	    char-=screen.sec/(burntime);
	    image_blend=make_color_hsv(color_get_value(color),char*color_get_saturation(color),char*color_get_value(color));
	}
	else
	{
	    fire_die()
	}



}
