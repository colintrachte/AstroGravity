/// @description create_shockwave(x,y,start radius,end radius,update speed,expansion rate %,spin,twist,color1,color2,color3,alpha)
/// @param x
/// @param y
/// @param start radius
/// @param end radius
/// @param update speed
/// @param expansion rate %
/// @param spin
/// @param twist
/// @param color1
/// @param color2
/// @param color3
/// @param alpha
function create_shockwave(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	var shockwave=instance_create(argument0,argument1,o_shockwave)
	with shockwave
	{
	    radius=argument2;
	    targetradius=argument3;
	    update_speed=argument4;
	    alarm[0]=update_speed;
	    sp=argument5;
	    spin=argument6;
	    twist=argument7;
	    c1=argument8;
	    c2=argument9;
	    c3=argument10;
	    image_alpha=argument11;
	    debug=0;
	}
	return shockwave;



}
