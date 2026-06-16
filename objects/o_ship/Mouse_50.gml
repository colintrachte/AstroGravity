if weapon_ready[0]
{
    var drain=3*math_photon_energy(color)/weapon_efficiency[0];
    if energy>drain
    {
        create_bullet(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),speed+5,image_angle,color,2,1,0,0,1,selected_get_nearest(x,y),game_get_speed(gamespeed_fps),3)
        shake+=50*weapon_recoil[0];
        energy-=drain;
        weapon_ready[0]=0;
        weapon_alarm[0]=0;
        //weapon kick
        motion_add(image_angle+180,.4)
    }
}

