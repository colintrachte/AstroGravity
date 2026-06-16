/// @description This controller stores and manages visual effects 
load_particles_all()
curl=0;
particles=1;

load_textures()

wind=0;
windmax=10;
windspeed=tolerance(windmax);
targetwind=0;
windscale=wind/windmax; //ranges from 1 to -1

clouds=0;
alarm0=27;//alarm used for creating clouds

menu_settings_init()

draw_set_color(c_white)

