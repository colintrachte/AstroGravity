q=0;
w=64; h=32;
x1=x-w; y1=y-h;//top right corner
x2=x+w; y2=y+h;//bottom left corner

activated=1;//determines whether or not to update
updatespeed=game_get_speed(gamespeed_fps)/20;//number of updates per second
alarm[0]=updatespeed;

margin=8;
label="button";
alpha=.4+.4*q;
color=make_color_hsv(q*64,255*activated,255);

//after all your other variables are set, initialize the grid
holygrid=ds_grid_create(6,7);
scr_holygrid_preset(holygrid,0);

