/// @description menu_settings_refresh()
function menu_settings_refresh() {
	//used to synchronize working variables with setting array
	//We use "working variables" DT, gore, etc because their names are more intuitive
	with fx
	{
	    window_set_fullscreen(setting[0]);
	    particles=setting[1];
	    sky=setting[2];
	}



}
