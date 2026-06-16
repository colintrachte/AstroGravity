/// @description view_zoom(1/zoom)
/// @param 1/zoom
function view_zoom(arg_1_zoom) {
	__view_set( e__VW.WView, 0, __view_get( e__VW.WPort, 0 )*arg_1_zoom );
	__view_set( e__VW.HView, 0, __view_get( e__VW.HPort, 0 )*arg_1_zoom );



}
