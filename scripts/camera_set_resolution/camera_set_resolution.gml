/// @description camera_set_resolution(width,height,view #)
/// @param width
/// @param height
/// @param view #
function camera_set_resolution(argument0, argument1, argument2) {
	//by Ground Effect Games
	//resizes the application and view to pixel-perfectly fit whatever resolution you give.
	window_set_size(argument0,argument1);
	__view_set( e__VW.Visible, argument2, true );
	view_enabled = true;
	__view_set( e__VW.WPort, argument2, argument0 );
	__view_set( e__VW.HPort, argument2, argument1 );
	__view_set( e__VW.WView, argument2, argument0 );
	__view_set( e__VW.HView, argument2, argument1 );
	surface_resize(application_surface,argument0,argument1)


}
