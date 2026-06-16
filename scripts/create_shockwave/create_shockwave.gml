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
function create_shockwave(x, y, start, path_end, update, expansion, spin, twist, color1, color2, color3, alpha) {
	var shockwave=instance_create(x,y,o_shockwave)
	with shockwave
	{
	    radius=start;
	    targetradius=path_end;
	    update_speed=update;
	    alarm[0]=update_speed;
	    sp=expansion;
	    spin=spin;
	    twist=twist;
	    c1=color1;
	    c2=color2;
	    c3=color3;
	    image_alpha=alpha;
	    //debug=0;
	}
	return shockwave;



}
