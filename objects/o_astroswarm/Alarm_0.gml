if (camera.zoom<10)
{
    in_view=point_in_rectangle(x,y,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ));
    if in_view
    {
        //spawn a bug
        instance_create(x,y,o_astroparticle)
        //move randomly
        motion_add(random(360),1+random(5))
    }
}
//reset the timer
alarm[0]=spawn_rate;

