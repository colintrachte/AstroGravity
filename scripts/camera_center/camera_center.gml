/// @description camera_center(x,y,shake)
/// @param x
/// @param y
/// @param shake
function camera_center(argument0, argument1, argument2) {
	__view_set( e__VW.XView, 0, argument0-__view_get( e__VW.WView, 0 )/2+lengthdir_x(argument2,current_time) );
	__view_set( e__VW.YView, 0, argument1-__view_get( e__VW.HView, 0 )/2+lengthdir_y(argument2,current_time) );


}
