if !__background_get( e__BG.Visible, 0 )
{
    instance_create(x,y,o_bullet)
}
alarm[0]=game_get_speed(gamespeed_fps)/4; //four bullets per second
motion_add(random(360),random(1))

