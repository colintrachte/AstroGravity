/// @description screen_set_resolution(width,height,view #)
/// @param width
/// @param height
/// @param view #
function screen_set_resolution(width, height, view) {
	//by Ground Effect Games
	//resizes the application and view to pixel-perfectly fit whatever resolution you give.
	window_set_size(width,height);
	__view_set( e__VW.Visible, view, true );
	view_enabled = true;
	__view_set( e__VW.WPort, view, width );
	__view_set( e__VW.HPort, view, height );
	__view_set( e__VW.WView, view, width );
	__view_set( e__VW.HView, view, height );
	surface_resize(application_surface,width,height)



}
