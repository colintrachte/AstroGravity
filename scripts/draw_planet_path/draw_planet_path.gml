/// @description draw_planet_path(earth,water,ice,lava,air)
/// @param earth
/// @param water
/// @param ice
/// @param lava
/// @param air
function draw_planet_path(earth, water, ice, lava, air) {
	//By Ground Effect Games

	var d2=ice*diameter;
	var placeholder = water;//future development will happen here.
	if orphan
	{
	    //if there is no sun, draw an outline to represent the atmosphere
	    draw_crescent(x,y,radius*.6,radius*1.1,segments,color_glow,image_blend,image_alpha*.1*air,image_alpha*.1*air,orbit_angle)
	}
	//base color
	draw_path_circle(x,y,path,0,1,radius,merge_color(image_blend,c_orange,lava),merge_color(image_blend,c_red,lava),image_alpha,image_alpha)
	draw_set_blend_mode(bm_add)
	//rock texture
	draw_path_sphere_ext(x,y,path,0,1,radius,fx.texture[1],diameter,diameter,10,0,image_blend,image_alpha*earth)
	//continents
	//draw_path_sphere_ext(x,y,path,0,1,radius,fx.texture[0],diameter,diameter,10,0,image_blend,image_alpha*earth)
	//draw_set_blend_mode(bm_normal)
	//terrain detail
	//draw_path_sphere_ext(x,y,path,0,1,radius,fx.texture[2],diameter,diameter,10,0,image_blend,image_alpha)
	//oceans
	//draw_path_sphere_ext(x,y,path,0,1,radius,fx.texture[0],diameter,diameter,10,0,c_blue,image_alpha*water*.9)
	//draw_set_blend_mode(bm_add)
	//polar ice cap
	draw_sphere_ext(x,y,ice*radius,ice*segments,fx.texture[4],d2,d2,4*ice,image_angle+spin*90,0,c_white,c_white,c_white,image_alpha,image_alpha,0)
	//atmosphere
	if orphan
	{
	    //shadow
	    draw_set_blend_mode(bm_normal)
	    draw_path_circle(x,y,path,0,1,radius,c_black,c_black,.6,.5)
	}
	else
	{
	    draw_crescent(x,y,radius*.6,radius*1.1,segments,color_glow,image_blend,image_alpha*.5*air,0,orbit_angle)
	    //shadow
	    draw_set_blend_mode(bm_normal)
	    draw_path_circle_shadowed(x,y,path,0,1,radius,c_black,c_black,image_alpha,image_alpha,orbit_angle+image_angle)
	}



}
