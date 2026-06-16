/// @description math_rotate(xtarget,ytarget,percent rotation)
/// @param xtarget
/// @param ytarget
/// @param percent rotation
function math_rotate(xtarget, ytarget, percent) {
	//generic script for rotating an object's sprite towards a point

	var targetdir=point_direction(x,y,xtarget,ytarget);

	if (abs(targetdir-image_angle)>.01)
	{image_angle+=(((((targetdir - image_angle) mod 360) + 540) mod 360) - 180)*percent;}



}
