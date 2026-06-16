/// @description draw_planet(earth,water,ice,lava,air)
/// @param earth
/// @param water
/// @param ice
/// @param lava
/// @param air
function draw_planet(earth, water, ice, lava, air) {
	//By Ground Effect Games

	var a0,a1,d2;
	a0=image_alpha*earth;
	a1=image_alpha*water;
	d2=ice*diameter;
	if orphan
	{
	    //if there is no sun, draw an outline to represent the atmosphere
	    draw_crescent(x,y,radius*.6,radius*1.1,segments,color_glow,c_dkgray,image_alpha*.1*air,image_alpha*.1*air,orbit_angle)
	}
	//base color
	draw_polygon(x,y,radius,segments,image_angle,merge_color(image_blend,c_orange,lava),merge_color(image_blend,c_red,lava),1,1)
	draw_set_blend_mode(bm_add)
	//rock texture
	draw_sphere_ext(x,y,radius,segments,fx.texture[1],diameter,diameter,10,image_angle,0,image_blend,image_blend,image_blend,a0,a0,a0*.3)
	//Continents
	draw_sphere_ext(x,y,radius,segments,fx.texture[0],diameter,diameter,10,image_angle+spin*45,0,c_white,image_blend,image_blend,a0,a0,a0*.3)
	draw_set_blend_mode(bm_normal)
	//terrain detail
	draw_sphere_ext(x,y,radius,segments,fx.texture[2],diameter,diameter,10,image_angle,0,c_white,image_blend,image_blend,image_alpha,image_alpha,0)
	//oceans
	draw_sphere_ext(x,y,radius,segments,fx.texture[0],diameter,diameter,10,image_angle+spin*45,0,c_white,c_blue,c_blue,a1,a1,a1*.1)
	draw_set_blend_mode(bm_add)
	//polar ice cap
	draw_sphere_ext(x,y,ice*radius,ice*segments,fx.texture[4],d2,d2,4*ice,image_angle+spin*90,0,c_white,c_white,c_white,image_alpha,image_alpha,0)
	//atmosphere
	if orphan
	{
	    //shadow
	    draw_set_blend_mode(bm_normal)
	    draw_polygon(x,y,radius,segments,image_angle,c_black,c_black,.6,.5)
	}
	else
	{
	    draw_crescent(x,y,radius*.6,radius*1.1,segments,color_glow,image_blend,image_alpha*.5*air,0,orbit_angle) 
	    //shadow
	    draw_set_blend_mode(bm_normal)
	    draw_circle_shadow(x,y,radius,segments,c_black,c_black,1,1,orbit_angle)
	}


}
