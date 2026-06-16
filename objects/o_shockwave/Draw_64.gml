draw_set_blend_mode(bm_add)
draw_magnify_ext((x-__view_get( e__VW.XView, 0 ))/camera.zoom,(y-__view_get( e__VW.YView, 0 ))/camera.zoom,radius,sqrt(radius),screen.texture,__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ),20,twist,c1,c2,c3,0,image_alpha*(1-power(radius/targetradius,4)),0)
draw_set_blend_mode(bm_normal)

