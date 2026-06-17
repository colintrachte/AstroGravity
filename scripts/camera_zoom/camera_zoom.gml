/// @description camera_zoom(1/zoom)
/// @param 1/zoom
function camera_zoom(argument0) {
	__view_set( e__VW.WView, 0, __view_get( e__VW.WPort, 0 )*argument0 );
	__view_set( e__VW.HView, 0, __view_get( e__VW.HPort, 0 )*argument0 );


}
