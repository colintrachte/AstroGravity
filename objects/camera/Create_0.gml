/// @description this object handles the camera views

pivot_enabled=0;

//intermittent step
update_speed=3;
alarm[0]=update_speed;

screen_set_resolution(screen.width,screen.height,0)
camera_target_init()

selected=-1;
selected_move=0;

zoom_max=150;
zoom_min=.4;
zoom_rate=.1;

if (room==rm_start)
{
    zoom=zoom_max;
    zoom_target=2;
}
else
{
    zoom=zoom_min;
    zoom_target=zoom_max;
}
zoom_percent=(zoom-zoom_min)/(zoom_max-zoom_min);
shake=0;

//the camera moves until it centers on xtarget,ytarget,dirtarget
xtarget=0;
ytarget=0;
dirtarget=0;

create(dynamic_background)
create(hud)

