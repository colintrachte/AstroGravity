//it is very important to only put things here that need to be updated real-time
//use alarms for everything else.
//when you have an entire galaxy to simulate, every little bit counts!
if camera.zoom<radius
{
    in_view=point_in_rectangle(x,y,__view_get( e__VW.XView, 0 )-diameter,__view_get( e__VW.YView, 0 )-diameter,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+diameter,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+diameter);
    if in_view
    {
        //drawing
        if visible==0
        {
            visible=1;
            speed=saved_speed;
        }
        image_alpha+=(1-image_alpha)*.01;
        segments=sqr(radius)/camera.zoom;
        image_angle+=spin*screen.sec;
        //rotating the path works just like changing the image angle.
        path_rotate(path,spin*screen.sec)
        
        //physics
        math_astrogravity(p_space_matter,screen.sec*.012,2000)
        math_astrogravity_ext(o_shockwave,screen.sec*.012,2000,1000)
    }
    else
    {
        if visible
        {
            visible=0;
            saved_speed=speed;
            speed=0;
        }
        image_alpha-=.1/game_get_speed(gamespeed_fps);
        if image_alpha<-.1
        {
            instance_destroy()
        }
    }
}
else
{
    if visible
    {
        visible=0;
        saved_speed=speed;
        speed=0;
    }
}

