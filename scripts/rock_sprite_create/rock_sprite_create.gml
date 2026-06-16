/// @description rock_sprite_create(path,radius,# polygons,color1,color2,alpha)
/// @param path
/// @param radius
/// @param # polygons
/// @param color1
/// @param color2
/// @param alpha
function rock_sprite_create(path, radius, color1, color2, alpha, arg5) {
	//By Ground Effect Games
	//creates a sprite from a path using a temporary surface.
	//it is important to give the radius of the path so that your sprite will not be chopped off.
	var surface,scale,diameter;
	diameter=radius*2;
	surface = surface_create(diameter,diameter);
	scale=1+random(.5);
	surface_set_target(surface)
	draw_clear_alpha(c_black,0)
	draw_path_circle(radius,radius,path,0,1,color1,color2,c_black,arg5,arg5)
	//draw detail
	draw_path_circle_ext(radius,radius,path,0,1,color1*.7,fx.texture[1],256*scale,256*scale,0,c_white,alpha,arg5,arg5)
	surface_reset_target()
	var spr = sprite_create_from_surface(surface,0,0,diameter,diameter,0,0,radius,radius);
	surface_free(surface);
	return spr;
	//make sure you delete the sprite when it will no longer be used!



}
