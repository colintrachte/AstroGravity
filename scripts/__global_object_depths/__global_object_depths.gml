function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // screen
	global.__objectDepths[1] = 0; // splash
	global.__objectDepths[2] = 0; // fx
	global.__objectDepths[3] = 0; // external
	global.__objectDepths[4] = 0; // audio
	global.__objectDepths[5] = -100; // camera
	global.__objectDepths[6] = 0; // music_demo
	global.__objectDepths[7] = 100; // dynamic_background
	global.__objectDepths[8] = -100; // mouse
	global.__objectDepths[9] = 0; // hud
	global.__objectDepths[10] = 0; // o_magnifier
	global.__objectDepths[11] = 0; // o_shockwave
	global.__objectDepths[12] = 0; // o_laserturret
	global.__objectDepths[13] = 0; // o_lightning_simple
	global.__objectDepths[14] = 0; // o_lightning_forked
	global.__objectDepths[15] = 0; // o_lightning_flat
	global.__objectDepths[16] = 0; // o_lightning_path
	global.__objectDepths[17] = 0; // o_lightning_color
	global.__objectDepths[18] = 0; // o_lightning_magnify
	global.__objectDepths[19] = 0; // o_lightning_hue
	global.__objectDepths[20] = 0; // o_lightning_circle
	global.__objectDepths[21] = 0; // o_pixel
	global.__objectDepths[22] = 0; // your_object
	global.__objectDepths[23] = 0; // o_pixelmaker
	global.__objectDepths[24] = 0; // o_pixelmaker_fast
	global.__objectDepths[25] = 100; // o_portal
	global.__objectDepths[26] = 0; // o_trail
	global.__objectDepths[27] = 0; // o_countdown
	global.__objectDepths[28] = 0; // o_exclamation
	global.__objectDepths[29] = 0; // o_flash
	global.__objectDepths[30] = 0; // o_button
	global.__objectDepths[31] = 0; // o_menu_main
	global.__objectDepths[32] = 0; // o_menu_pause
	global.__objectDepths[33] = 0; // p_player
	global.__objectDepths[34] = 0; // p_space_matter
	global.__objectDepths[35] = 0; // p_space_debris
	global.__objectDepths[36] = 0; // p_space_enemy
	global.__objectDepths[37] = 0; // p_metal
	global.__objectDepths[38] = 0; // p_bullet
	global.__objectDepths[39] = 0; // p_lightning
	global.__objectDepths[40] = 0; // p_particle_streak
	global.__objectDepths[41] = 0; // p_selectable
	global.__objectDepths[42] = 0; // p_ship_creator
	global.__objectDepths[43] = 0; // o_photon
	global.__objectDepths[44] = 0; // o_asteroid
	global.__objectDepths[45] = 0; // o_comet
	global.__objectDepths[46] = -1; // o_moon
	global.__objectDepths[47] = -1; // o_planet
	global.__objectDepths[48] = 0; // o_star
	global.__objectDepths[49] = 100; // o_star_background
	global.__objectDepths[50] = 0; // o_particle_rain
	global.__objectDepths[51] = 0; // o_nebula
	global.__objectDepths[52] = 0; // o_galaxy
	global.__objectDepths[53] = 0; // o_module
	global.__objectDepths[54] = 0; // o_node
	global.__objectDepths[55] = 0; // o_seed
	global.__objectDepths[56] = 0; // o_point
	global.__objectDepths[57] = 0; // o_shield
	global.__objectDepths[58] = -1; // o_ship
	global.__objectDepths[59] = -1; // o_enemy
	global.__objectDepths[60] = 0; // o_ship_colorslider
	global.__objectDepths[61] = 0; // o_ship_point
	global.__objectDepths[62] = 1; // o_ship_creator
	global.__objectDepths[63] = 0; // b_ship_creator
	global.__objectDepths[64] = 0; // o_astroswarm
	global.__objectDepths[65] = 0; // o_astroparticle
	global.__objectDepths[66] = 0; // o_worm
	global.__objectDepths[67] = 0; // o_worm_seg


	global.__objectNames[0] = "screen";
	global.__objectNames[1] = "splash";
	global.__objectNames[2] = "fx";
	global.__objectNames[3] = "external";
	global.__objectNames[4] = "audio";
	global.__objectNames[5] = "camera";
	global.__objectNames[6] = "music_demo";
	global.__objectNames[7] = "dynamic_background";
	global.__objectNames[8] = "mouse";
	global.__objectNames[9] = "hud";
	global.__objectNames[10] = "o_magnifier";
	global.__objectNames[11] = "o_shockwave";
	global.__objectNames[12] = "o_laserturret";
	global.__objectNames[13] = "o_lightning_simple";
	global.__objectNames[14] = "o_lightning_forked";
	global.__objectNames[15] = "o_lightning_flat";
	global.__objectNames[16] = "o_lightning_path";
	global.__objectNames[17] = "o_lightning_color";
	global.__objectNames[18] = "o_lightning_magnify";
	global.__objectNames[19] = "o_lightning_hue";
	global.__objectNames[20] = "o_lightning_circle";
	global.__objectNames[21] = "o_pixel";
	global.__objectNames[22] = "your_object";
	global.__objectNames[23] = "o_pixelmaker";
	global.__objectNames[24] = "o_pixelmaker_fast";
	global.__objectNames[25] = "o_portal";
	global.__objectNames[26] = "o_trail";
	global.__objectNames[27] = "o_countdown";
	global.__objectNames[28] = "o_exclamation";
	global.__objectNames[29] = "o_flash";
	global.__objectNames[30] = "o_button";
	global.__objectNames[31] = "o_menu_main";
	global.__objectNames[32] = "o_menu_pause";
	global.__objectNames[33] = "p_player";
	global.__objectNames[34] = "p_space_matter";
	global.__objectNames[35] = "p_space_debris";
	global.__objectNames[36] = "p_space_enemy";
	global.__objectNames[37] = "p_metal";
	global.__objectNames[38] = "p_bullet";
	global.__objectNames[39] = "p_lightning";
	global.__objectNames[40] = "p_particle_streak";
	global.__objectNames[41] = "p_selectable";
	global.__objectNames[42] = "p_ship_creator";
	global.__objectNames[43] = "o_photon";
	global.__objectNames[44] = "o_asteroid";
	global.__objectNames[45] = "o_comet";
	global.__objectNames[46] = "o_moon";
	global.__objectNames[47] = "o_planet";
	global.__objectNames[48] = "o_star";
	global.__objectNames[49] = "o_star_background";
	global.__objectNames[50] = "o_particle_rain";
	global.__objectNames[51] = "o_nebula";
	global.__objectNames[52] = "o_galaxy";
	global.__objectNames[53] = "o_module";
	global.__objectNames[54] = "o_node";
	global.__objectNames[55] = "o_seed";
	global.__objectNames[56] = "o_point";
	global.__objectNames[57] = "o_shield";
	global.__objectNames[58] = "o_ship";
	global.__objectNames[59] = "o_enemy";
	global.__objectNames[60] = "o_ship_colorslider";
	global.__objectNames[61] = "o_ship_point";
	global.__objectNames[62] = "o_ship_creator";
	global.__objectNames[63] = "b_ship_creator";
	global.__objectNames[64] = "o_astroswarm";
	global.__objectNames[65] = "o_astroparticle";
	global.__objectNames[66] = "o_worm";
	global.__objectNames[67] = "o_worm_seg";


	// create another array that has the correct entries
	var len = array_length(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
