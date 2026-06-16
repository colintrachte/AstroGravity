function draw_moon() {
	draw_path_circle(x,y,path,0,1,radius,image_blend,c_black,image_alpha,image_alpha)
	//draw detail
	draw_path_circle_ext(x,y,path,0,1,radius,fx.texture[4],128,128,0,c_white,image_blend,image_alpha,image_alpha)
	draw_set_blend_mode(bm_add)
	draw_path_circle_ext(x,y,path,0,1,radius,fx.texture[1],128,128,0,c_white,image_blend,image_alpha,image_alpha)
	draw_set_blend_mode(bm_normal)
	if !orphan
	{
	    //shadow
	    draw_path_circle_shadowed(x,y,path,0,1,radius,c_black,c_black,1,1,shadow_angle+image_angle)
	}



}
