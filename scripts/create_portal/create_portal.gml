/// @description create_portal(x,y,object to create,scale,seconds to stay open,color)
/// @param x
/// @param y
/// @param object to create
/// @param scale
/// @param seconds to stay open
/// @param color
function create_portal(argument0, argument1, argument2, argument3, argument4, argument5) {
	with instance_create(argument0,argument1,o_portal)
	{
	    sprite_index=sp_spiral;
	    endcreate=argument2;
	    scale=argument3;
	    alarm0=argument4;
	    closeportal=0;
	    image_blend=argument5;
	    image_xscale=0.05;
	    cloudangle=0;
	    donecreating=0;
	    radius=160;
	    segments=12;
	    spin=choose(-1,1);
	}



}
