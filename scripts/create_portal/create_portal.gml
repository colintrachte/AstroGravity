/// @description create_portal(x,y,object to create,scale,seconds to stay open,color)
/// @param x
/// @param y
/// @param object to create
/// @param scale
/// @param seconds to stay open
/// @param color
function create_portal(x, y, object, scale, seconds, color) {
	with instance_create(x,y,o_portal)
	{
	    sprite_index=sp_spiral;
	    endcreate=object;
	    scale=scale;
	    alarm0=seconds;
	    closeportal=0;
	    image_blend=color;
	    image_xscale=0.05;
	    cloudangle=0;
	    donecreating=0;
	    radius=160;
	    segments=12;
	    spin=choose(-1,1);
	}



}
