/// @description create_blocksparks(x,y,dir,angle tolerance,dice sides,i,color,alpha)
/// @param x
/// @param y
/// @param dir
/// @param angle tolerance
/// @param dice sides
/// @param i
/// @param color
/// @param alpha
function effect_blocksparks(x, y, dir, angle, dice, i, color, alpha) {
	//this script handles particles for flat lightning
	if (random_dice(dice))
	{
	    part_type_alpha2(fx.lsparks,alpha*(.5+random(.5)),0)
	    part_type_color2(fx.lsparks,c_white,color)
	    part_type_size(fx.cubesparks,1.3-i,2-i,-.1,0)
	    part_type_speed(fx.cubesparks,10,30/((i*2)+1),-1,2);
	    part_type_direction(fx.cubesparks,dir-angle,dir+angle,0,1);
	    part_particles_create(fx.middle,x,y,fx.cubesparks,1);
	}



}
