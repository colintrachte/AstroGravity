if fade>0
{
    var fadecolor,x1,y1,x2,y2;
    x1=__view_get( e__VW.XView, 0 );
    y1=__view_get( e__VW.YView, 0 );
    x2=x1+__view_get( e__VW.WPort, 0 );
    y2=y1+__view_get( e__VW.HPort, 0 );

    draw_set_blend_mode(bm_add)
    fadecolor=make_color_hsv(0,0,fade*255)
    draw_rectangle_color(x1,y1,x2,y2,fadecolor,fadecolor,fadecolor,fadecolor,false)
    draw_set_blend_mode(bm_normal)
}

if fade<0
{
    var fadecolor,x1,y1,x2,y2;
    x1=__view_get( e__VW.XView, 0 );
    y1=__view_get( e__VW.YView, 0 );
    x2=x1+__view_get( e__VW.WPort, 0 );
    y2=y1+__view_get( e__VW.HPort, 0 );
    
    draw_set_blend_mode(bm_subtract)
    fadecolor=make_color_hsv(0,0,-fade*255)
    draw_rectangle_color(x1,y1,x2,y2,fadecolor,fadecolor,fadecolor,fadecolor,false)
    draw_set_blend_mode(bm_normal)
}

