/// @description view_center(x,y,shake,angle)
/// @param x
/// @param y
/// @param shake
/// @param angle
function view_center(x, y, shake, angle) {
	__view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2+lengthdir_x(shake,current_time) );
	__view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2+lengthdir_y(shake,current_time) );
	__view_set( e__VW.Angle, 0, angle );



}
