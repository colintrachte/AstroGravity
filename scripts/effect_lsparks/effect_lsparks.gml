/// @description create_lsparks(x,y,dir,angle tolerance,dice sides,i,color,alpha)
/// @param x
/// @param y
/// @param dir
/// @param angle tolerance
/// @param dice sides
/// @param i
/// @param color
/// @param alpha
function effect_lsparks(x, y, dir, angle, dice, i, color, alpha) {
	//this script handles particles for all the lightning types except flat lightning
	if (random_dice(dice))
	{
	    part_type_alpha2(lsparks,alpha*(.5+random(.5)),0)
	    part_type_color2(lsparks,c_white,color)
	    part_type_size(lsparks,1.2-i,2-i,-.1,0)
	    part_type_speed(lsparks,10,30/((i*2)+1),-1,2);
	    part_type_direction(lsparks,dir-angle,dir+angle,0,1);
	    part_type_direction(lsparks,90,90,0,1);
	    part_particles_create(fx.middle,x,y,lsparks,1);
	}



}
