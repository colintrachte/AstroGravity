/// @description This object should be created before all others.
//it controls how the screen is displayed.
time_scale=1000000;//time scale is the relationship between real time and game time.
sec=delta_time/time_scale;
fade=0;//fade ranges between 1 and -1. 1=whiteout    -1=blackout
targetfade=0;
faderate=.01;
blur=0;
paused=0;
game_started=0;
intro_is_done=0;
//store the dimensions of the screen for use by other objects.
width=display_get_width();
height=display_get_height();
x=0;
y=0;
diag=sqrt(sqr(width/2)+sqr(height/2));//diagonal half radius of the screen (good for radial effects)

screen_set_resolution(width,height,0)
alarm[0]=5;
if (surface_exists(application_surface)) texture=surface_get_texture(application_surface);
load_globals()
create(fx)
create(external)
create(audio)
create(splash)
create(mouse)
double_esc=0;

