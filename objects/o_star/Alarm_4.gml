/// @description intermittent step code
//This code does not need to run every single step
segments=radius/(camera.zoom+7);
in_view=point_in_rectangle(x,y,__view_get( e__VW.XView, 0 )-diameter,__view_get( e__VW.YView, 0 )-diameter,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+diameter,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+diameter);
if in_view
{
    if exclamation
    {
        effect_exclamation(x,y-camera.zoom_percent*5000,exclamation_text,1,camera.zoom_percent,0)
        exclamation=0;
    }
    if (segments>15)
    {
        part_type_life(fx.sun,60,60)
        part_type_size(fx.sun,radius/24,radius/24,-.5/sqrt(radius),0)
        part_type_color2(fx.sun,color,color)
        part_type_alpha3(fx.sun,0,.2,0);
        if random_dice(10/update_speed)
        {
            part_particles_create(fx.below,x,y,fx.sun,1)
        }
    }
}
alarm[4]=random_decrease(update_speed,.4);

