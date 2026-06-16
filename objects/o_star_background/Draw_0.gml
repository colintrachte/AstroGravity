if camera.zoom<radius
{
    if point_in_rectangle(x,y,__view_get( e__VW.XView, 0 )-diameter,__view_get( e__VW.YView, 0 )-diameter,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+diameter,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+diameter)
    {
        draw_star_small(x,y,radius,image_blend,image_alpha)
    }
}

