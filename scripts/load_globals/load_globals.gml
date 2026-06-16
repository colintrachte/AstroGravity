/// @description load_globals()
function load_globals() {
	//All globals are initialized in this single script

	//space matter sizes
	global.min_debris_radius=8;
	global.min_moon_radius=24;
	global.min_planet_radius=64;
	global.min_star_radius=140;
	global.min_nebula_radius=500;
	global.delta_debris_radius=global.min_moon_radius-global.min_debris_radius;
	global.delta_moon_radius=global.min_planet_radius-global.min_moon_radius;
	global.delta_planet_radius=global.min_star_radius-global.min_planet_radius;
	global.delta_star_radius=global.min_nebula_radius-global.min_star_radius;

	//dynamic background object settings
	global.nebula_layers=2;
	global.background_stars=20;

	//points system
	global.organic_points=0;
	global.metallic_points=0;
	global.ectenic_points=0;

	//GUI settings
	var display_height=display_get_gui_height();
	global.button_radius[0]=display_height/3;
	global.button_radius[1]=display_height/5;
	global.button_radius[2]=display_height/7;
	global.button_radius[3]=display_height/9;



}
