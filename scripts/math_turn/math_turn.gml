/// @description math_turn(xtarget,ytarget,percent rotation)
/// @param xtarget
/// @param ytarget
/// @param percent rotation
function math_turn(xtarget, ytarget, percent) {
	//generic script for changing direction towards a point

	var targetdir=point_direction(x,y,xtarget,ytarget);

	if (abs(targetdir-direction)>.01)
	{
	    direction+=(((((targetdir - direction) mod 360) + 540) mod 360) - 180)*percent;
	}



}
